import 'package:flutter/material.dart';

class Sizes {
  // Construtor privado
  Sizes._();

  double _width = 0;
  double _height = 0;

  // valor inicial baseado no protótipo
  static const Size _designSize = Size(414.0, 898.0);

  static final Sizes _instance = Sizes._();

  // Construtor Singleton
  factory Sizes() => _instance;

  double get width => _width;
  double get height => _height;

  // Método de configuração inicial
  static void init(BuildContext context, {Size designSize = _designSize}) {
    // Verifica se existe dados de MediaQuery
    final deviceData = MediaQuery.maybeOf(context);

    // Caso não exista, recebe o valor inicial do protótipo
    final deviceSize = deviceData?.size ?? _designSize;

    // Atualiza os getters
    _instance._height = deviceSize.height;
    _instance._width = deviceSize.width;
  }
}

extension SizesExt on num {
  // Cacula o valor proporcional baseado na largura do dispositivo em relação
  // ao protótipo
  double get w {
    return (this * Sizes._instance._width) / Sizes._designSize.width;
  }

  // Cacula o valor proporcional baseado na largura do dispositivo em relação
  // ao protótipo
  double get h {
    return (this * Sizes._instance._height) / Sizes._designSize.height;
  }
}
