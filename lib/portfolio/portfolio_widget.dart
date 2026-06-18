import 'package:flutter/material.dart';
import 'package:myportfolio/constant/app_theme.dart';
import 'package:myportfolio/constant/nav_bar.dart';
import 'package:myportfolio/portfolio/certifications_section.dart';
import 'package:myportfolio/portfolio/contact_section.dart';
import 'package:myportfolio/portfolio/experience_section.dart';
import 'package:myportfolio/portfolio/hero_section.dart';
import 'package:myportfolio/portfolio/projects_section.dart';
import 'package:myportfolio/portfolio/skills_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: Column(
        children: [
          const NavBar(),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const HeroSection(),
                  _divider(),
                  const SkillsSection(),
                  _divider(),
                  const ProjectsSection(),
                  _divider(),
                  const ExperienceSection(),
                  _divider(),
                  const CertificationsSection(),
                  _divider(),
                  const ContactSection(),
                  _footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Container(
    height: 1,
    color: AppTheme.borderColor,
    margin: const EdgeInsets.symmetric(horizontal: 40),
  );

  Widget _footer() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
    decoration: BoxDecoration(
      border: Border(top: BorderSide(color: AppTheme.borderColor)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '© 2025 Ritika Khattar',
          style: TextStyle(color: AppTheme.mutedColor, fontSize: 12),
        ),
        Text(
          'Flutter Developer · CSM · Canada',
          style: TextStyle(color: AppTheme.mutedColor, fontSize: 12),
        ),
      ],
    ),
  );
}
