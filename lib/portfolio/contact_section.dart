import 'package:flutter/material.dart';
import 'package:myportfolio/constant/app_theme.dart';
import 'package:myportfolio/constant/section_header.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: 'Get in touch',
            title: "Let's work together",
            accentWord: 'together',
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(48),
            decoration: BoxDecoration(
              color: AppTheme.cardColor,
              border: Border.all(color: AppTheme.borderColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Let's build something ",
                        style: AppTheme.serifDisplay.copyWith(fontSize: 36),
                      ),
                      TextSpan(
                        text: 'great',
                        style: AppTheme.serifDisplay.copyWith(
                          fontSize: 36,
                          fontStyle: FontStyle.italic,
                          color: AppTheme.accentTeal,
                        ),
                      ),
                      TextSpan(
                        text: ' together',
                        style: AppTheme.serifDisplay.copyWith(fontSize: 36),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Available for freelance Flutter projects and Agile consulting across Canada.\nOpen to remote and on-site engagements.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.mutedColor,
                    fontSize: 14,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    _contactLink(
                      icon: Icons.email_outlined,
                      label: 'r.khattar03@gmail.com',
                      onTap: () =>
                          launchUrl(Uri.parse('mailto:r.khattar03@gmail.com')),
                    ),
                    _contactLink(
                      icon: Icons.phone_outlined,
                      label: '+1 (289) 623-3432',
                      onTap: () => launchUrl(Uri.parse('tel:+12896233432')),
                    ),
                    _contactLink(
                      icon: Icons.link,
                      label: 'LinkedIn',
                      onTap: () => launchUrl(
                        Uri.parse('https://linkedin.com/in/ritika-khattar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactLink({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.bgColor,
          border: Border.all(color: AppTheme.borderColor),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppTheme.mutedColor, size: 16),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: AppTheme.textColor, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
