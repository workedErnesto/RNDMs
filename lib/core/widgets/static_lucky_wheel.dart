import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:lucky_wheel_clean_architecture/features/presets/domain/models/slice_model.dart';

class StaticLuckyWheel extends StatelessWidget {
  final List<Slice> slices;
  final double wheelSize;

  const StaticLuckyWheel({
    super.key,
    required this.slices,
    this.wheelSize = 55,
  });

  @override
  Widget build(BuildContext context) {
    final sliceAngle = (2 * math.pi) / slices.length;
    final angleOffset = -(math.pi / 2 + sliceAngle / 2);

    return RepaintBoundary(
      child: SizedBox(
        width: wheelSize,
        height: wheelSize,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(wheelSize, wheelSize),
              painter: _WheelPainter(slices: slices, angleOffset: angleOffset),
            ),
            ...List.generate(slices.length, (i) {
              final angle = (sliceAngle * i) + angleOffset + (sliceAngle / 2);
              return _buildLabel(wheelSize, angle, slices[i]);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(double size, double angle, Slice slice) {
    return Positioned.fill(
      child: Transform.rotate(
        angle: angle,
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: size * 0.4,
            margin: EdgeInsets.only(right: size * 0.05),
            child: Text(
              slice.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: slice.foregroundColor,
                fontSize: size * 0.08,
                fontFamily: 'soyuz',
                height: 1.0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}

class _WheelPainter extends CustomPainter {
  final List<Slice> slices;
  final double angleOffset;

  _WheelPainter({required this.slices, required this.angleOffset});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final sliceAngle = (2 * math.pi) / slices.length;

    final paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < slices.length; i++) {
      paint.color = slices[i].backgroundColor;
      final startAngle = (i * sliceAngle) + angleOffset;
      canvas.drawArc(rect, startAngle, sliceAngle, true, paint);
    }

    final borderPaint = Paint()
      ..color = Colors.white24
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawCircle(center, radius, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _WheelPainter oldDelegate) {
    return oldDelegate.slices != slices;
  }
}
