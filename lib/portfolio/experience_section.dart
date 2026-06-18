import 'package:flutter/material.dart';
import 'package:myportfolio/constant/app_theme.dart';
import 'package:myportfolio/constant/section_header.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static const _experiences = [
    {
      'date': 'July 2025 – Jan 2026',
      'company': '.',
      'role': 'Freelancer',
      'desc':
          'Built a proof-of-concept AI Tutor app that helps users improve their English grammar and spoken communication. Integrated Speech-to-Text to capture user speech in real time, then passed transcriptions to OpenAI to detect grammar errors and suggest corrections — making English learning conversational and hands-free.',
    },
    {
      'date': 'Sep 2022 – Feb 2023',
      'company': 'Hashstudioz Technology Pvt Ltd',
      'role': 'Flutter Developer',
      'desc':
          'Translated business requirements into technical solutions, authored user stories and acceptance criteria for Agile sprints. Developed scalable mobile apps using Flutter and REST APIs across the full development lifecycle.',
    },
    {
      'date': 'Aug 2020 – Aug 2021',
      'company': 'Mobcoder Technology Pvt Ltd',
      'role': 'Flutter Developer',
      'desc':
          'Delivered cross-platform mobile applications optimizing UI/UX based on iterative stakeholder feedback within an Agile workflow. Designed and documented process flows for clear requirements handoffs.',
    },
    {
      'date': 'Dec 2018 – Jul 2020',
      'company': 'BlueLupin Technologies',
      'role': 'Flutter Developer',
      'desc':
          'Managed full SDLC for educational mobile applications from requirements gathering through post-launch optimization. Integrated Firebase Analytics to drive data-informed UX improvements.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: 'Career timeline',
            title: 'Experience',
            accentWord: 'Experience',
          ),
          Column(
            children: _experiences.map((e) => _ExperienceItem(exp: e)).toList(),
          ),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final Map<String, String> exp;
  const _ExperienceItem({required this.exp});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 720;

    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppTheme.borderColor)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exp['date']!,
                  style: const TextStyle(
                    color: AppTheme.mutedColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                _body(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    exp['date']!,
                    style: const TextStyle(
                      color: AppTheme.mutedColor,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(child: _body()),
              ],
            ),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          exp['company']!.toUpperCase(),
          style: const TextStyle(
            color: AppTheme.accentGreen,
            fontSize: 11,
            letterSpacing: 0.8,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          exp['role']!,
          style: const TextStyle(
            color: AppTheme.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(exp['desc']!, style: AppTheme.mutedStyle),
      ],
    );
  }
}
