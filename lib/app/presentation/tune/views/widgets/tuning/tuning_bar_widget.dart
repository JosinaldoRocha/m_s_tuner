import 'package:flutter/material.dart';

class TuningBarWidget extends StatelessWidget {
  const TuningBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTuneBar(),
        _buildBar(
          height: 180,
          color: const Color(0xFF6CE8DC),
        ),
        _buildTuneBar(direction: TextDirection.rtl),
      ],
    );
  }

  Row _buildTuneBar({TextDirection? direction}) {
    return Row(
      textDirection: direction,
      children: [
        _buildBar(),
        _buildBar(height: 86),
        _buildBar(),
        _buildBar(),
        _buildBar(),
        _buildBar(height: 86),
        _buildBar(),
        _buildBar(),
        _buildBar(),
      ],
    );
  }

  Row _buildBar({
    double? height,
    Color? color,
  }) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Container(
          width: 4,
          height: height ?? 56,
          decoration: ShapeDecoration(
            color: color ?? const Color(0xFFC2C2C2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
