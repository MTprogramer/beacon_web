import 'package:beacon/Mobile/MobileHeader.dart';
import 'package:flutter/material.dart';

import '../Models/Testimonial.dart';
import '../Web/FAQ_Layout.dart';
import '../Web/FooterLayout.dart';
import '../Web/PremiumPlans.dart';
import '../Web/ReasonsLayout.dart';
import '../Web/TestimonialsSection.dart';


class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _headerKey = GlobalKey();
  final GlobalKey _plansKey = GlobalKey();
  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _faqKey = GlobalKey();

  // This key is essential to trigger the drawer from the header
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // 1. Assign the key here
      extendBodyBehindAppBar: true,

      // 2. Add the Drawer with your desktop navigation items
      drawer: Drawer(
        child: Container(
          color: const Color(0xFFF8A41B), // Matching Orange
          child: Column(
            children: [
              const SizedBox(height: 60),
              _buildDrawerItem("Home", () => scrollTo(_headerKey)),
              _buildDrawerItem("Features", () => scrollTo(_featuresKey)),
              _buildDrawerItem("Plans", () => scrollTo(_plansKey)),
              _buildDrawerItem("FAQ", () => scrollTo(_faqKey)),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              MobileWebHeader(
                key: _headerKey,
                scaffoldKey: _scaffoldKey, // Passes key so menu icon works
                onHomeTap: () => scrollTo(_headerKey),
                onFeaturesTap: () => scrollTo(_featuresKey),
                onPlansTap: () => scrollTo(_plansKey),
                onFaqTap: () => scrollTo(_faqKey),
              ),
              WhyYouWillLoveItPage(key: _featuresKey),
              PricingSection(key: _plansKey),
               TestimonialsSection(),
              FAQSection(key: _faqKey),
               FooterLayout(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to build the drawer links
  Widget _buildDrawerItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer first
        onTap(); // Then scroll
      },
    );
  }
}