import 'package:flutter/material.dart';

import '../Common/CommonWidgets.dart';

class WebHeaderPage extends StatelessWidget {

  final VoidCallback onHomeTap;
  final VoidCallback onFeaturesTap;
  final VoidCallback onPlansTap;
  final VoidCallback onFaqTap;

  const WebHeaderPage({
    super.key,
    required this.onHomeTap,
    required this.onFeaturesTap,
    required this.onPlansTap,
    required this.onFaqTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: SizedBox(
        height: 800,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            const DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/header_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Column(
              children: [
                // Top navigation
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/logo.png",
                            width: 30,
                            height: 30,
                            color: Colors.white, // optional tint
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Earn Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      if (MediaQuery.of(context).size.width > 800)
                        Row(
                          children: [
                            _NavBarItem(title: 'Home', onTap: onHomeTap),
                            _NavBarItem(title: 'Features', onTap: onFeaturesTap),
                            _NavBarItem(title: 'Plans', onTap: onPlansTap),
                            _NavBarItem(title: 'FAQ', onTap: onFaqTap),
                          ],
                        ),
                      const DownloadButton(),
                    ],
                  ),
                ),

                const Spacer(),

                // Center headline
                const Text(
                  'Your Journey to Extra\nIncome Starts Here.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 56,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),

                const SizedBox(height: 24),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      height: 1.4,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Center download button
                const DownloadButton(isLarge: true),

                const Spacer(),

                // Bottom center social proof
                const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: SocialProofBadge(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class _NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () {onTap();},
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
