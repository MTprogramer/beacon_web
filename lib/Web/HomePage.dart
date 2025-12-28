import 'package:flutter/material.dart';

import '../Models/Testimonial.dart';
import 'FAQ_Layout.dart';
import 'FooterLayout.dart';
import 'Header.dart';
import 'PremiumPlans.dart';
import 'ReasonsLayout.dart';
import 'TestimonialsSection.dart';


class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _headerKey = GlobalKey();
  final GlobalKey _plansKey = GlobalKey();
  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _faqKey = GlobalKey();

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
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              WebHeaderPage(
                key: _headerKey,
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
}
