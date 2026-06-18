import 'package:flutter/material.dart';
import 'package:myportfolio/constant/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 720;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
      decoration: BoxDecoration(
        color: AppTheme.bgColor.withOpacity(0.92),
        border: Border(bottom: BorderSide(color: AppTheme.borderColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Ritika',
                  style: AppTheme.serifDisplay.copyWith(fontSize: 20),
                ),
                TextSpan(
                  text: '.',
                  style: AppTheme.serifDisplay.copyWith(
                    fontSize: 20,
                    color: AppTheme.accentGreen,
                  ),
                ),
              ],
            ),
          ),
          if (!isMobile)
            Row(
              children: [
                _navLink('Skills'),
                _navLink('Projects'),
                _navLink('Experience'),
                _navLink('Contact'),
              ],
            ),
          GestureDetector(
            onTap: () => launchUrl(Uri.parse('mailto:r.khattar03@gmail.com')),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: AppTheme.accentGreen,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Text(
                'Hire me',
                style: TextStyle(
                  color: Color(0xFF0D0D0B),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navLink(String label) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Text(
      label.toUpperCase(),
      style: const TextStyle(
        color: AppTheme.mutedColor,
        fontSize: 12,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
