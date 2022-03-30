import 'dart:math';

class MathUtils {
  static bool areSequential(double a, double b, double c) {
    return b >= a && b <= c;
  }

  static double convertDegreesToRadians(final int degrees) {
    return degrees*pi/180;
  }
}