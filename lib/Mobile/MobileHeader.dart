import 'package:flutter/material.dart';
import '../Common/CommonWidgets.dart';

class MobileWebHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback onHomeTap;
  final VoidCallback onFeaturesTap;
  final VoidCallback onPlansTap;
  final VoidCallback onFaqTap;

  const MobileWebHeader({
    super.key,
    required this.scaffoldKey,
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
            // 1. Background Image (The orange background from your assets)
            Image.asset(
              "assets/mobile_header_bg.png",
              fit: BoxFit.cover,
            ),

            // 2. Content Overlay
            // We use a transparent Column so the background image is visible
            Column(
              children: [
                // Navigation Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
                            onPressed: () => scaffoldKey.currentState?.openDrawer(),
                          ),
                          const SizedBox(width: 8),
                          Image.asset("assets/logo.png",
                              width: 24,
                              height: 24,
                              color: Colors.white
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Earn Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      const DownloadButton(),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Social Proof Pill
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 8),
                      Text(
                        'Loved by 1M+ users worldwide',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Main Headline
                const Text(
                  'Your Journey to\nExtra Income\nStarts Here.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                  ),
                ),

                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ),

                const SizedBox(height: 40),

                // Large Action Button
                const DownloadButton(isLarge: true),

                const Spacer(), // Pushes content up to leave room for images at the bottom

                // 3. Optional: Add the tilted phone images here if you have them as assets
                // to fully match the screenshot look.
              ],
            ),
          ],
        ),
      ),
    );
  }
}