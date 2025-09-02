import 'dart:ui';

typedef Shaders = ({
  FragmentShader water,
  FragmentShader glitch,
  FragmentShader pixelation,
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

  late final Shaders shaders;

  Future<void> preLoadShaders() async {
    shaders = (
      water: await _loadShader(waterShader),
      glitch: await _loadShader(glitchShader),
      pixelation: await _loadShader(pixelationShader),
      // Append more shaders later on.
    );
  }

  Future<FragmentShader> _loadShader(String path) async {
    return (await FragmentProgram.fromAsset(path)).fragmentShader();
  }
}
