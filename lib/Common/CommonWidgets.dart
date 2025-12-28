
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/FAQItem.dart';
import '../Models/Testimonial.dart';
import '../Utils/Cliper.dart';

import 'dart:html' as html;


class DownloadButton extends StatelessWidget {
  final bool isLarge;
  const DownloadButton({super.key, this.isLarge = false});
  void _downloadApk() {
    html.AnchorElement(
      href: 'https://www.dropbox.com/scl/fi/zoukb71s3rehsslar96gq/app-release.apk?rlkey=95m13ufeamjne8qof79b39z9n&dl=1',
    )
      ..setAttribute('download', 'app-release.apk')
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _downloadApk();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: isLarge ? 48 : 24,
          vertical: isLarge ? 22 : 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        'Download App',
        style: TextStyle(
          fontSize: isLarge ? 18 : 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SocialProofBadge extends StatelessWidget {
  const SocialProofBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2436),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.star, color: Color(0xFFFBAF1B), size: 20),
          SizedBox(width: 8),
          Text(
            'Loved by 1M+ users worldwide',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}



class PricingCard extends StatelessWidget {
  final String planName;
  final String price;
  final String dailyTickets;
  final String ticketReward;

  const PricingCard({
    super.key,
    required this.planName,
    required this.price,
    required this.dailyTickets,
    required this.ticketReward,
  });

  @override
  Widget build(BuildContext context) {
    // Define common text styles
    const whiteTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    );
    const yellowTextStyle = TextStyle(
      color: Color(0xFFFFF59D), // A lighter yellow for labels
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    );

    return ClipPath(
      clipper: ExactPlanClipper(),
      child: Container(
        width: 180, // Fixed width for consistency
        height: 400,
        padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
        decoration: const BoxDecoration(
          // Using a gradient to match the subtle color shift in the image
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF59A1B), // Lighter amber
              Color(0xFFFEC804), // Slightly darker amber
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Plan Name and Price at the top
            // Plan Name and Price at the top-right
            Padding(
              padding: const EdgeInsets.only(right: 16.0 , top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        planName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        "\$$price",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30.0),

            // Plan Details
            const Text("Daily Ticket", style: whiteTextStyle),
            const SizedBox(height: 4.0),
            Text("$dailyTickets TICKET", style: yellowTextStyle),
            const SizedBox(height: 20.0),
            const Text("Ticket Reward", style: whiteTextStyle),
            const SizedBox(height: 4.0),
            Text("\$ $ticketReward PER TICKET", style: yellowTextStyle),

            Spacer(),
            // Arrow Button
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 44.0, vertical: 2.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE082), // Lighter yellow/orange
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Image.asset(
                  "assets/arrow.png",
                  width: 60,
                  height: 40,
                  color: Colors.white, // optional tint
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReasonCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ReasonCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    // Using Expanded ensures all cards in a Row take up equal width
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEF0), // Light gray card background
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 36.0, color: const Color(0xFF1C1C33)),
            const SizedBox(height: 20.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C1C33),
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
                height: 1.5, // Better line height for readability
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;

  const TestimonialCard({super.key, required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // Light grey background
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(testimonial.imageUrl),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testimonial.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF1A1F26),
                    ),
                  ),
                  Text(
                    testimonial.role,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            '"${testimonial.quote}"',
            style: const TextStyle(
              fontSize: 18,
              height: 1.5,
              color: Color(0xFF4A4A4A),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableFAQTile extends StatelessWidget {
  final FAQItem item;

  const ReusableFAQTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Padding matches the visual "pill" thickness
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: item.backgroundColor,
        borderRadius: BorderRadius.circular(100), // Perfect pill shape
      ),
      child: Row(
        children: [
          // The static circular icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              // Logic to keep the orange icon on the orange card
              color: item.backgroundColor == const Color(0xFFFF633B)
                  ? const Color(0xFFFF633B)
                  : Colors.grey[800],
            ),
          ),
          const SizedBox(width: 16),
          // The Question text
          Expanded(
            child: Text(
              item.question,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xFF1A1F26),
              ),
            ),
          ),
        ],
      ),
    );
  }
}