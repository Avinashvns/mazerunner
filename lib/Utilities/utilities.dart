

import 'dart:math';
import 'dart:ui';

class Utilities{
  static int easycol=2;
  static int easyrow=2;
  static int easylevel=1;

  static int mediumcol=7;
  static int mediumrow=7;
  static int mediumlevel=10;

  static int col=12;
  static int row=12;
  static int level=18;

  static String mode="";

  static String timerMessage="";
  static String selecttile="";
}

// Color getRandomColor() {
//   Random random = Random();
//   return Color.fromRGBO(
//     random.nextInt(256), // Red
//     random.nextInt(256), // Green
//     random.nextInt(256), // Blue
//     1.0, // Opacity
//   );
// }

// Generate Random Color with Condition
Color getRandomColor() {
  Random random = Random();

  // Generate random RGB values for the color
  int red = random.nextInt(256);
  int green = random.nextInt(256);
  int blue = random.nextInt(256);

  // Check if the generated color is yellow
  // if (red > 200 && green > 200 && blue < 50) {
  if (red > 0 && green > 0 && blue < 0) {
    // If it's close to yellow, generate a different color
    return getRandomColor();
  } else {
    // Otherwise, return the generated color
    return Color.fromRGBO(red, green, blue, 1.0);
  }
}