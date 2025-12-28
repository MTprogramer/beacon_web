import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Common/FooterWidgets.dart';
import 'HomePage.dart';

class FooterLayout extends StatelessWidget {
  const FooterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: ClipRRect(
        // 1. ROUNDED CORNERS FOR THE FOOTER
        borderRadius: BorderRadius.circular(40),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
          color: const Color(0xFF0B1120),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(flex: 2, child: BrandingColumn()),

                  // 2. CLICKABLE LINK COLUMNS
                  Expanded(
                    child: FooterLinkColumn(
                      title: 'Product',
                      links: const ['Features', 'Pricing', 'FAQ', 'Blog'],
                      onLinkTap: (link) => print('Navigating to $link'),
                    ),
                  ),
                  Expanded(
                    child: FooterLinkColumn(
                      title: 'Company',
                      links: const ['About', 'Contact', 'Privacy Policy'],
                      onLinkTap: (link) => print('Navigating to $link'),
                    ),
                  ),

                  const Expanded(flex: 2, child: NewsletterColumn()),
                ],
              ),
              const SizedBox(height: 60),
              const Divider(color: Colors.white10),
              const SizedBox(height: 20),
              const Text(
                '© 2025. All rights reserved.',
                style: TextStyle(color: Colors.white38, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}