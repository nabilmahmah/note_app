import 'package:flutter/widgets.dart';

class Responsive {
  static double wp(BuildContext context, double percent) {
    final w = MediaQuery.of(context).size.width;
    return w * percent / 100;
  }

  static double hp(BuildContext context, double percent) {
    final h = MediaQuery.of(context).size.height;
    return h * percent / 100;
  }

  /// sp: scalable pixels for fonts based on screen width
  static double sp(BuildContext context, double percent) {
    // Using width as base for font scaling gives more consistent results across devices
    final w = MediaQuery.of(context).size.width;
    return w * percent / 100;
  }
}
