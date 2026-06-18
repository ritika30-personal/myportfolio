import 'package:flutter/material.dart';
import 'package:myportfolio/constant/app_theme.dart';
import 'package:myportfolio/constant/section_header.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  static const _certs = [
    'Certified Scrum Master (CSM) — Scrum Alliance',
    // 'Graduate Certificate in Project Management — Algoma University, 2025',
    // 'MBA in IT & Marketing — Galgotias University',
    'B.Tech in Information Technology — ITS Engineering College',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: 'Credentials',
            title: 'Certifications & education',
            accentWord: 'Certifications',
          ),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _certs.map((c) => _CertPill(label: c)).toList(),
          ),
        ],
      ),
    );
  }
}

class _CertPill extends StatelessWidget {
  final String label;
  const _CertPill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        border: Border.all(color: AppTheme.borderColor),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppTheme.accentGreen,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(color: AppTheme.textColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
