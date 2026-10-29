import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../widgets/brand_logo.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.navigation,
    required this.active,
    required this.navigate,
    required this.onMenu,
  });
  final List<(String, String)> navigation;
  final String active;
  final void Function(String) navigate;
  final VoidCallback onMenu;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final desktop =
          constraints.maxWidth >= 1320 &&
          MediaQuery.textScalerOf(context).scale(13) <= 15;
      final mobile = constraints.maxWidth < 600;
      return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(bottom: BorderSide(color: Color(0xFFE6EDF8))),
          boxShadow: [
            BoxShadow(
              color: navy.withValues(alpha: .025),
              blurRadius: 24,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1440),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mobile ? 20 : 40,
                vertical: mobile ? 19 : 23,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => navigate('accueil'),
                    borderRadius: BorderRadius.circular(14),
                    child: BrandLogo(compact: mobile),
                  ),
                  const Spacer(),
                  if (desktop) ...[
                    ...navigation.map(
                      (item) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: TextButton(
                          onPressed: () => navigate(item.$2),
                          style: TextButton.styleFrom(
                            minimumSize: const Size(0, 48),
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            foregroundColor: active == item.$2 ? blue : navy,
                            backgroundColor: active == item.$2
                                ? const Color(0xFFF2F6FF)
                                : null,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            textStyle: const TextStyle(
                              fontFamily: premiumFont,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          child: Text(item.$1),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                  if (!mobile) ...[
                    FilledButton(
                      onPressed: () => navigate('contact'),
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(0, 54),
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        elevation: 0,
                        shadowColor: blue.withValues(alpha: .2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: const TextStyle(
                          fontFamily: premiumFont,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: const Text('Demander un devis  ↗'),
                    ),
                    if (!desktop) const SizedBox(width: 16),
                  ],
                  if (!desktop)
                    IconButton.filledTonal(
                      tooltip: 'Ouvrir le menu',
                      onPressed: onMenu,
                      style: IconButton.styleFrom(
                        backgroundColor: pale.withValues(alpha: .7),
                        foregroundColor: navy,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      icon: const Icon(Icons.menu_rounded, size: 25),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
