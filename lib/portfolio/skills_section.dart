import 'package:flutter/material.dart';
import 'package:myportfolio/constant/app_theme.dart';
import 'package:myportfolio/constant/section_header.dart';
import 'package:myportfolio/tag_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const _skills = [
    {
      'icon': '◆',
      'title': 'Mobile Development',
      'desc':
          'End-to-end Flutter apps for iOS & Android with clean architecture patterns and robust state management.',
      'tags': ['Flutter', 'Dart', 'Firebase', 'REST APIs', 'GraphQL', 'MVVM'],
      'color': 'green',
    },
    {
      'icon': '◇',
      'title': 'Agile & Scrum Delivery',
      'desc':
          'Certified Scrum Master who runs ceremonies, grooms backlogs, and keeps cross-functional teams aligned and shipping.',
      'tags': ['Scrum', 'SAFe', 'Kanban', 'Jira', 'Sprint Planning'],
      'color': 'teal',
    },
    {
      'icon': '○',
      'title': 'Product & Requirements',
      'desc':
          'Stakeholder interviews, user story writing, acceptance criteria, wireframing, and UX-aligned process design.',
      'tags': ['Figma', 'Miro', 'UAT', 'A/B Testing', 'Firebase Analytics'],
      'color': 'green',
    },
    {
      'icon': '▲',
      'title': 'State Management',
      'desc':
          'Scalable state management across complex apps with predictable data flow and maintainable codebases.',
      'tags': ['Redux', 'GetX', 'MobX', 'Clean Architecture'],
      'color': 'teal',
    },
    {
      'icon': '□',
      'title': 'Testing & QA',
      'desc':
          'Unit, widget, and integration testing paired with UAT facilitation to ensure production-ready quality.',
      'tags': ['Unit Testing', 'Widget Testing', 'CI/CD', 'Debugging'],
      'color': 'green',
    },
    {
      'icon': '◉',
      'title': 'Fintech & Domain Expertise',
      'desc':
          'Deep experience in NBFC loan platforms, EV tech, edtech, and social apps with financial services context.',
      'tags': ['Fintech', 'NBFC', 'Edtech', 'Kotlin', 'Java'],
      'color': 'teal',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 720;
    final crossAxisCount = isMobile ? 1 : (width < 1000 ? 2 : 3);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: 'What I bring',
            title: 'Core skills',
            accentWord: 'skills',
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: isMobile ? 2.2 : 1.4,
            ),
            itemCount: _skills.length,
            itemBuilder: (context, i) => _SkillCard(skill: _skills[i]),
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final Map<String, dynamic> skill;
  const _SkillCard({required this.skill});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isGreen = widget.skill['color'] == 'green';
    final iconColor = isGreen ? AppTheme.accentGreen : AppTheme.accentTeal;
    final iconBg = isGreen
        ? AppTheme.accentGreen.withOpacity(0.12)
        : AppTheme.accentTeal.withOpacity(0.12);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _hovered ? AppTheme.accentGreen : AppTheme.borderColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  widget.skill['icon'],
                  style: TextStyle(color: iconColor, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.skill['title'],
              style: const TextStyle(
                color: AppTheme.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: Text(
                widget.skill['desc'],
                style: const TextStyle(
                  color: AppTheme.mutedColor,
                  fontSize: 12,
                  height: 1.6,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: (widget.skill['tags'] as List<String>)
                  .map((t) => TagChip(t))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
