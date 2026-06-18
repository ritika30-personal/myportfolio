import 'package:flutter/material.dart';
import 'package:myportfolio/constant/app_theme.dart';
import 'package:myportfolio/constant/section_header.dart';
import 'package:myportfolio/tag_chip.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const _projects = [
    {
      'num': '01',
      'badge': 'Fintech · NBFC',
      'title': 'ZipCred — Loan Management Platform',
      'desc':
          'Mobile app enabling MSMEs to manage NBFC loans with real-time finance tracking. Designed process flows and requirements with financial stakeholders and led handoff within an Agile delivery framework.',
      'stack': ['Flutter', 'Swift', 'Firebase', 'REST APIs'],
    },
    {
      'num': '02',
      'badge': 'Clean Tech · IoT',
      'title': 'Eotify — EV Charging Station App',
      'desc':
          'QR-based EV charging station access app for drivers. A process digitization initiative improving accessibility and operational efficiency for electric vehicle owners across the network.',
      'stack': ['Flutter', 'QR Integration', 'Firebase'],
    },
    {
      'num': '03',
      'badge': 'Social · Analytics',
      'title': 'Rasooc — Social Influence Platform',
      'desc':
          'Advanced content analytics and real-time Firebase-powered user engagement features. Applied A/B testing and data strategy principles to drive continuous product improvement.',
      'stack': ['Flutter', 'Firebase Analytics', 'A/B Testing'],
    },
    {
      'num': '04',
      'badge': 'Edtech',
      'title': 'KidsChaupal — Educational Engagement App',
      'desc':
          'Educational mobile app with full SDLC ownership — from requirements gathering through deployment and post-launch optimization. Firebase Analytics for data-driven UX improvements.',
      'stack': ['Flutter', 'Firebase', 'Dart', 'Analytics'],
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
            label: 'Selected work',
            title: 'Featured projects',
            accentWord: 'projects',
          ),
          Column(
            children: _projects.map((p) => _ProjectCard(project: p)).toList(),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 720;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: AppTheme.cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered ? AppTheme.accentTeal : AppTheme.borderColor,
            ),
          ),
          child: isMobile
              ? _content()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _content()),
                    const SizedBox(width: 24),
                    Text(
                      widget.project['num'],
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 48,
                        color: AppTheme.borderColor,
                        height: 1,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.accentGreen.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            widget.project['badge'],
            style: const TextStyle(
              color: AppTheme.accentGreen,
              fontSize: 11,
              letterSpacing: 0.8,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          widget.project['title'],
          style: AppTheme.serifDisplay.copyWith(fontSize: 22),
        ),
        const SizedBox(height: 8),
        Text(widget.project['desc'], style: AppTheme.mutedStyle),
        const SizedBox(height: 16),
        const Text(
          'STACK',
          style: TextStyle(
            color: AppTheme.mutedColor,
            fontSize: 11,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: (widget.project['stack'] as List<String>)
              .map((t) => TagChip(t))
              .toList(),
        ),
      ],
    );
  }
}
