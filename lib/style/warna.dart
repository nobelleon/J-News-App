import 'package:flutter/cupertino.dart';

class Warna {
  const Warna();

  static const Color mainColor = const Color(0xFF74F61D);
  static const Color putih = const Color(0xFFE5E5E5);
  static const Color unguMuda = const Color(0xFFF17BC0);
  static const Color background = const Color(0xFFf0f1f6);
  static const Color titleColor = const Color(0xFF061857);

  static const primaryGradient = const LinearGradient(
    colors: const [Color(0xFF00FF80), Color(0xFF1CF6AD)],
    stops: const [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
