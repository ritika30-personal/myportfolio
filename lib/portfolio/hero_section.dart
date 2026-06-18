import 'package:flutter/material.dart';
import 'package:myportfolio/constant/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 720;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: isMobile ? 48 : 80,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _heroText(context),
                const SizedBox(height: 40),
                _statsGrid(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _heroText(context)),
                const SizedBox(width: 64),
                SizedBox(width: 340, child: _statsGrid()),
              ],
            ),
    );
  }

  Widget _heroText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 28, height: 1, color: AppTheme.accentGreen),
            const SizedBox(width: 8),
            const Text(
              'AVAILABLE FOR FREELANCE · CANADA',
              style: TextStyle(
                color: AppTheme.accentGreen,
                fontSize: 11,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Flutter Developer &\n',
                style: AppTheme.serifDisplay.copyWith(fontSize: 52),
              ),
              TextSpan(
                text: 'Agile ',
                style: AppTheme.serifDisplay.copyWith(
                  fontSize: 52,
                  fontStyle: FontStyle.italic,
                  color: AppTheme.accentTeal,
                ),
              ),
              TextSpan(
                text: 'Specialist',
                style: AppTheme.serifDisplay.copyWith(fontSize: 52),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'I build high-quality cross-platform mobile apps with Flutter and lead Agile delivery from sprint zero to launch. CSM certified with 4+ years across fintech, edtech, and social platforms.',
          style: TextStyle(
            color: AppTheme.mutedColor,
            fontSize: 15,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _primaryBtn(
              'Get in touch',
              onTap: () => launchUrl(Uri.parse('mailto:r.khattar03@gmail.com')),
            ),
            _ghostBtn('View projects'),
          ],
        ),
      ],
    );
  }

  Widget _statsGrid() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.borderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _statTile('4+', 'Years experience')),
              Container(width: 1, height: 100, color: AppTheme.borderColor),
              Expanded(child: _statTile('6', 'Apps shipped')),
            ],
          ),
          Container(height: 1, color: AppTheme.borderColor),
          Row(
            children: [
              Expanded(child: _statTile('CSM', 'Scrum certified')),
              Container(width: 1, height: 100, color: AppTheme.borderColor),
              Expanded(child: _statTile('3', 'Companies served')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statTile(String num, String label) {
    return Container(
      color: AppTheme.cardColor,
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            num,
            style: AppTheme.serifDisplay.copyWith(
              fontSize: 40,
              color: AppTheme.accentGreen,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.mutedColor,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _primaryBtn(String label, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        decoration: BoxDecoration(
          color: AppTheme.accentGreen,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF0D0D0B),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _ghostBtn(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.borderColor),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        style: const TextStyle(color: AppTheme.textColor, fontSize: 14),
      ),
    );
  }
}
