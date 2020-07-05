import 'dart:ui';

class ColorUtils {
  static Color getColorFromValue(double val) {
    int g = (255 - 50 * (val - 1)).round();
    if (g > 255) g = 255;
    if (g < 0) g = 0;
    return Color.fromARGB(255, 255, g, 50);
  }
}
