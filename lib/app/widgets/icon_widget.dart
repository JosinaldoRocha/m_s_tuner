import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.image,
    this.iconColor,
    this.height,
    this.width,
  });
  final String image;
  final Color? iconColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: width ?? 24,
      height: height ?? 24,
      color: iconColor ?? const Color(0xFFC2C2C2),
    );
  }
}
