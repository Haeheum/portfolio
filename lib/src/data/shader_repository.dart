import 'dart:ui';

typedef Shaders = ({
  FragmentShader water,
  // Append more shaders later on.
});

class ShaderRepository {
  static final ShaderRepository instance = ShaderRepository._();

  ShaderRepository._();

  factory ShaderRepository() => instance;

  static const String _shaderFolderPath = 'assets/shaders';
  static const String waterShader = '$_shaderFolderPath/water.frag';

  late final Shaders shaders;

  Future<void> preLoadShaders() async {
    shaders = (
      water: await _loadShader(waterShader),
      // Append more shaders later on.
    );
  }

  Future<FragmentShader> _loadShader(String path) async {
    return (await FragmentProgram.fromAsset(path)).fragmentShader();
  }
}
