#version 460 core

#include <flutter/runtime_effect.glsl>

// Flutter에서 제공하는 uniform 변수들

uniform vec2 iResolution; // viewport resolution (in pixels)
uniform float iTime; // Time in seconds
uniform sampler2D iChannel0; // Input texture sampler (me.jpeg)

out vec4 fragColor; // 최종 출력 색상

float random(in float x) {
    return fract(sin(x) * 1e4);
}

float noise(in vec3 p) {
    const vec3 step = vec3(110.0, 241.0, 171.0);
    vec3 i = floor(p);
    vec3 f = fract(p);
    float n = dot(i, step);
    vec3 u = f * f * (3.0 - 2.0 * f);
    return mix(mix(mix(random(n + dot(step, vec3(0, 0, 0))),
                       random(n + dot(step, vec3(1, 0, 0))), u.x),
                   mix(random(n + dot(step, vec3(0, 1, 0))),
                       random(n + dot(step, vec3(1, 1, 0))), u.x), u.y),
               mix(mix(random(n + dot(step, vec3(0, 0, 1))),
                       random(n + dot(step, vec3(1, 0, 1))), u.x),
                   mix(random(n + dot(step, vec3(0, 1, 1))),
                       random(n + dot(step, vec3(1, 1, 1))), u.x), u.y),
               u.z);
}

float dot2(in vec3 v) { return dot(v, v); }

// 사각형 정의 (Quad)

float udQuad(vec3 p, vec3 a, vec3 b, vec3 c, vec3 d) {
    vec3 ba = b - a; vec3 pa = p - a;
    vec3 cb = c - b; vec3 pb = p - b;
    vec3 dc = d - c; vec3 pc = p - c;
    vec3 ad = a - d; vec3 pd = p - d;

    vec3 nor = cross(ba, ad);

    return sqrt(
        (sign(dot(cross(ba, nor), pa)) +
        sign(dot(cross(cb, nor), pb)) +
        sign(dot(cross(dc, nor), pc)) +
        sign(dot(cross(ad, nor), pd)) < 3.0)
        ?
        min(min(min(
                    dot2(ba * clamp(dot(ba, pa) / dot2(ba), 0.0, 1.0) - pa),
                    dot2(cb * clamp(dot(cb, pb) / dot2(cb), 0.0, 1.0) - pb)),
                dot2(dc * clamp(dot(dc, pc) / dot2(dc), 0.0, 1.0) - pc)),
            dot2(ad * clamp(dot(ad, pd) / dot2(ad), 0.0, 1.0) - pd))
        : dot(nor, pa) * dot(nor, pa) / dot2(nor));

}



// 안개/노이즈 효과

float fog(in vec3 p, float scale) {
    float x = (noise((p + (iTime * 1.0) * 2.0) * 0.2) * 2.0 - 1.0) * 15.0;
    float y = (noise((p + (iTime * 1.0 + 5.0) * 2.0) * 0.2) * 2.0 - 1.0) * 15.0;
    float z = (noise((p + (iTime * 1.0 + 3.5) * 2.0) * 0.2) * 2.0 - 1.0) * 15.0;
    p += vec3(x, y, z);
    return max((noise(p * scale) + noise(p * 2.0 * scale) * 0.5 +
    noise(p * 3.0 * scale) * 0.33 +
    noise(p * 4.0 * scale) * 0.25) * 0.4807, 0.0) * 5.0;
}



float mapHyper(vec3 p) {
    return fog(p, 0.5);
}



// 움직이는 사각형

float map3(vec3 p) {
    return udQuad(p,
                  vec3(5, 0, 100.0),
                  vec3(-5.0, 0, 100.0),
                  vec3(-5.0, cos(iTime * 0.35) * 2.0, -100.0),
                  vec3(5.0, cos(iTime * 0.35) * 2.0, -100.0));
}



// --- 메인 렌더링 로직 ---

void main() {

    // 1. 텍스처 UV 좌표 및 화면 비율 보정
    vec2 uv = vec2(gl_FragCoord.x / iResolution.x, gl_FragCoord.y / iResolution.y);
    uv -= 0.5;

    // 2. 카메라 설정
    vec3 s = vec3(0.0, 0.0, -100.0);
    vec3 t = vec3(0.0, 0.0, 0.0);
    vec3 cz = normalize(t - s);
    vec3 cx = normalize(cross(cz, vec3(0.0, 1.0, 0.0)));
    vec3 cy = normalize(cross(cz, cx));
    vec3 r = normalize(uv.x * cx + uv.y * cy + cz * 0.7);

    // 3. 레이마칭 효과 계산

    vec3 p = s;
    vec2 c = vec2(0.0, 0.0);
    for (int i = 0; i < 500; ++i) { // 성능 향상을 위해 반복 횟수를 100으로 줄임
                                    float d2 = map3(p);

                                    // 사각형 주변에서만 연기 효과를 계산합니다.
                                    float mH = mapHyper(p) * clamp(0.5 - d2, 0.0, 1.0) * 2.0;
                                    c += vec2(
                                    pow(mH * 0.06, 2.0) * clamp(0.2 - d2, 0.0, 1.0) * 0.55 +
                                    pow(mH * clamp(cos((p.x + sin(p.x + iTime * 100.0)) * 20.0), 0.0, 1.0), 4.0) * 0.007 * clamp(0.05 - d2, 0.0, 1.0) + mH * 0.0004, 0.0) +
                                    pow(mH * 0.06, 2.0) * clamp(1.0 - d2, 0.0, 1.0) * 0.20;
                                    p += r * 0.1;
    }

    // 4. 레이마칭 효과와 사진 텍스처를 조합
    // 레이저 효과 색상을 더 밝게 변경 (예: 순수한 흰색)
    vec3 effectCol = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), c.x);
    // 사진의 UV 좌표를 조정 (uv는 -0.5 ~ 0.5 범위, 텍스처는 0.0 ~ 1.0 범위)
    vec2 texCoord = uv + 0.5;
    vec4 textureSample = texture(iChannel0, texCoord);
    // 쉐이더 효과를 사진 위에 섞습니다.
    // mix 비율을 0.3으로 높여서 밝아진 레이저 효과가 더 잘 보이도록 합니다.
    vec3 finalColor = mix(textureSample.rgb, effectCol, 0.3); // mix 비율을 0.2에서 0.3으로 올림
    fragColor = vec4(finalColor, 1.0); // 최종 색상을 출력

}