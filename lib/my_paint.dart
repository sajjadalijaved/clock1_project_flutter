import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final center = Offset(width / 2, height / 2);
    final radius = min(width, height) / 2;
    final hoursNeedleBaseRadius = radius * 0.1;
    final minutesNeedleBaseRadius = radius * 0.08;
    final secondsNeedleBaseRadius = radius * 0.05;
    final hoursNeedleStrokeWidth = radius * 0.04;
    final minutesNeedleStrokeWidth = radius * 0.03;
    final secondsNeedleStrokeWidth = radius * 0.02;
    final hourseNeedleLength = radius * 0.6;
    final minutesNeedleLength = radius * 0.85;
    final secondsNeedleLength = radius * 0.90;
    const hoursTickLength = 8.0;
    const minutesTickLength = 4.0;
    const hoursTickStrokeWidth = 4.0;
    const minutesTickStrokeWidth = 2.0;

    const rotationSteps = 60;
    const angle = 2 * pi / rotationSteps;
    final mainDailPaint = Paint()
      ..shader = LinearGradient(
              colors: [Colors.pink, Colors.blue.shade600, Colors.green])
          .createShader(Rect.fromCircle(center: center, radius: radius));
    final hoursNeedlePaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = hoursNeedleStrokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final minutesNeedlePaint = Paint()
      ..color = Colors.amber
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = minutesNeedleStrokeWidth;
    final secondsNeedlePaint = Paint()
      ..color = Colors.green
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = secondsNeedleStrokeWidth;
    final hoursTickPaint = Paint()
      ..color = Colors.amber
      ..strokeWidth = hoursTickStrokeWidth;
    final minutesTickPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = minutesTickStrokeWidth;
    // Main Dail Of The Clock
    canvas.drawCircle(center, radius, mainDailPaint);
    // Center Hours Needle Base
    canvas.drawCircle(center, hoursNeedleBaseRadius, hoursNeedlePaint);

    // Minutes Needle Base
    canvas.drawCircle(center, minutesNeedleBaseRadius, minutesNeedlePaint);
    // seconds Needle Base
    canvas.drawCircle(center, secondsNeedleBaseRadius, secondsNeedlePaint);
    canvas.save();
    canvas.translate(radius, radius);
    // Hours Needle
    canvas.drawLine(Offset(0, -hoursNeedleBaseRadius),
        Offset(0, -hourseNeedleLength), hoursNeedlePaint);
    // Minutes Needle
    canvas.drawLine(Offset(minutesNeedleLength - 115, 0),
        Offset(minutesNeedleLength, 0), minutesNeedlePaint);
    // seconds Needle
    canvas.drawLine(
        Offset(-secondsNeedleLength, 0), Offset.zero, secondsNeedlePaint);
    double tickLength;
    Paint paint;
    for (var i = 0; i < rotationSteps; i++) {
      final isHour = i % 5 == 0;
      tickLength = isHour ? hoursTickLength : minutesTickLength;
      paint = isHour ? hoursTickPaint : minutesTickPaint;
      //   canvas.save();
      //   canvas.translate(0, -radius);
      canvas.drawLine(
          Offset(0, -radius), Offset(0, -radius + tickLength), paint);
      canvas.rotate(angle);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ClockPainter oldDelegate) => false;
}
