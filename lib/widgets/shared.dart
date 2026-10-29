import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

class ContentWidth extends StatelessWidget {
  const ContentWidth({super.key, required this.child, this.vertical = 64});
  final Widget child;
  final double vertical;
  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1240),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width < 600 ? 22 : 40,
          vertical: vertical,
        ),
        child: child,
      ),
    ),
  );
}

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.eyebrow, this.title, this.subtitle, {super.key});
  final String eyebrow, title, subtitle;
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(
        eyebrow.toUpperCase(),
        style: const TextStyle(
          color: blue,
          fontSize: 11,
          letterSpacing: 2.4,
          fontWeight: FontWeight.w800,
        ),
      ),
      const SizedBox(height: 12),
      Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w800,
          letterSpacing: -1,
        ),
      ),
      const SizedBox(height: 12),
      Text(
        subtitle,
        textAlign: TextAlign.center,
        style: TextStyle(color: navy.withValues(alpha: .65), height: 1.7),
      ),
      const SizedBox(height: 34),
    ],
  );
}

class HoverCard extends StatefulWidget {
  const HoverCard({super.key, required this.child, this.color = Colors.white});
  final Widget child;
  final Color color;
  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool hover = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => hover = true),
    onExit: (_) => setState(() => hover = false),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      transform: Matrix4.translationValues(0, hover ? -5 : 0, 0),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE4EAF4)),
        boxShadow: [
          BoxShadow(
            color: navy.withValues(alpha: hover ? .08 : .025),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: widget.child,
    ),
  );
}

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, c) {
      final count = c.maxWidth >= 1050
          ? 3
          : c.maxWidth >= 650
          ? 2
          : 1;
      return Wrap(
        spacing: 22,
        runSpacing: 22,
        children: children
            .map(
              (child) => SizedBox(
                width: (c.maxWidth - (count - 1) * 22) / count,
                child: child,
              ),
            )
            .toList(),
      );
    },
  );
}

class Reveal extends StatefulWidget {
  const Reveal({super.key, required this.child});
  final Widget child;
  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> {
  ScrollPosition? position;
  bool visible = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    position?.removeListener(checkVisibility);
    position = Scrollable.maybeOf(context)?.position;
    position?.addListener(checkVisibility);
    WidgetsBinding.instance.addPostFrameCallback((_) => checkVisibility());
  }

  void checkVisibility() {
    if (!mounted || visible) return;
    final box = context.findRenderObject();
    if (box is! RenderBox || !box.hasSize) return;
    final top = box.localToGlobal(Offset.zero).dy;
    if (top < MediaQuery.sizeOf(context).height && top + box.size.height > 0) {
      setState(() => visible = true);
    }
  }

  @override
  void dispose() {
    position?.removeListener(checkVisibility);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
    opacity: visible ? 1 : 0,
    duration: MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : const Duration(milliseconds: 650),
    child: widget.child,
  );
}
