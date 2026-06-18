import 'package:flutter/material.dart';
import 'package:myportfolio/constant/app_theme.dart';

class SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  final String accentWord;

  const SectionHeader({
    super.key,
    required this.label,
    required this.title,
    required this.accentWord,
  });

  @override
  Widget build(BuildContext context) {
    // title is like "Core skills" where accentWord is "skills"
    final before = title.replaceAll(accentWord, '').trim();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: AppTheme.labelStyle),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              if (before.isNotEmpty)
                TextSpan(
                  text: '$before ',
                  style: AppTheme.serifDisplay.copyWith(fontSize: 36),
                ),
              TextSpan(
                text: accentWord,
                style: AppTheme.serifDisplay.copyWith(
                  fontSize: 36,
                  fontStyle: FontStyle.italic,
                  color: AppTheme.accentTeal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
