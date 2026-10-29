import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

const premiumFont = 'PlusJakartaSans';

class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, this.light = false, this.compact = false});
  final bool light, compact;

  @override
  Widget build(BuildContext context) => Semantics(
    label: 'NOURIM PROD — Solutions Digitales',
    child: ExcludeSemantics(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: compact ? 42 : 50,
            height: compact ? 46 : 54,
            decoration: BoxDecoration(
              color: light
                  ? Colors.white.withValues(alpha: .06)
                  : pale.withValues(alpha: .65),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(9),
            child: CustomPaint(painter: _NMarkPainter()),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NOURIM PROD',
                style: TextStyle(
                  fontFamily: premiumFont,
                  fontSize: compact ? 17 : 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -.6,
                  height: 1.25,
                  color: light ? Colors.white : navy,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'SOLUTIONS DIGITALES',
                style: TextStyle(
                  fontFamily: premiumFont,
                  fontSize: compact ? 8 : 9,
                  letterSpacing: 2.1,
                  fontWeight: FontWeight.w600,
                  color: light ? Colors.white70 : const Color(0xFF72839B),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class _NMarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 32, size.height / 36);
    final paint = Paint()..color = blue;
    canvas.drawPath(
      Path()
        ..moveTo(0, 36)
        ..lineTo(0, 0)
        ..lineTo(8, 0)
        ..lineTo(8, 36)
        ..close(),
      paint,
    );
    canvas.drawPath(
      Path()
        ..moveTo(24, 0)
        ..lineTo(32, 0)
        ..lineTo(32, 36)
        ..lineTo(24, 36)
        ..close(),
      paint,
    );
    paint.shader = const LinearGradient(
      colors: [Color(0xFF1463FF), Color(0xFF619BFF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(const Rect.fromLTWH(0, 0, 32, 36));
    canvas.drawPath(
      Path()
        ..moveTo(0, 0)
        ..lineTo(9, 0)
        ..lineTo(32, 36)
        ..lineTo(23, 36)
        ..close(),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
