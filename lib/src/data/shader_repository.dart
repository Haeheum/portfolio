import 'dart:ui';

typedef Shaders = ({
  FragmentShader water,
  FragmentShader glitch,
  FragmentShader pixelation,
  FragmentShader flashlight,
  FragmentShader ripple,
  FragmentShader smoke,

// Append more shaders later on.
});

class ShaderRepository {
  static final ShaderRepository instance = ShaderRepository._();

  ShaderRepository._();

  factory ShaderRepository() => instance;

  static const String _shaderFolderPath = 'assets/shaders';
  static const String waterShader = '$_shaderFolderPath/water.frag';
  static const String glitchShader = '$_shaderFolderPath/glitch.frag';
  static const String pixelationShader = '$_shaderFolderPath/pixelation.frag';
  static const String burnShader = '$_shaderFolderPath/flashlight.frag';
  static const String rippleShader = '$_shaderFolderPath/ripple.frag';
  static const String smokeShader = '$_shaderFolderPath/smoke.frag';

  late final Shaders shaders;

  Future<void> preLoadShaders() async {
    shaders = (
      water: await _loadShader(waterShader),
      glitch: await _loadShader(glitchShader),
      pixelation: await _loadShader(pixelationShader),
      flashlight: await _loadShader(burnShader),
      ripple: await _loadShader(rippleShader),
      smoke: await _loadShader(smokeShader),
      // Append more shaders later on.
    );
  }

  Future<FragmentShader> _loadShader(String path) async {
    return (await FragmentProgram.fromAsset(path)).fragmentShader();
  }
}
