

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Common/CommonWidgets.dart';
import '../Models/FAQItem.dart';

class FAQSection extends StatelessWidget {
  FAQSection({super.key});

  final List<FAQItem> faqList = [
    FAQItem(
      question: "How does this app help me earn money?",
      answer:
      "You earn by buying coins at a lower price and selling them when their value increases. Prices change based on market demand and supply.",
      backgroundColor: const Color(0xFFFF633B),
    ),
    FAQItem(
      question: "Is my investment guaranteed?",
      answer:
      "No. Coin prices can go up or down. Profit is not guaranteed and losses are possible.",
      backgroundColor: const Color(0xFFFFD1D1),
    ),
    FAQItem(
      question: "When can I sell my coins?",
      answer:
      "You can sell your coins at any time when the market is active and buyers are available at the current price.",
      backgroundColor: const Color(0xFFE2CCDF),
    ),
    FAQItem(
      question: "How do I withdraw my earnings?",
      answer:
      "After selling your coins, your balance can be withdrawn using the payment methods provided in the app.",
      backgroundColor: const Color(0xFFDEF0FA),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 100),
      child: Column(
        children: [
          const Text(
            "Frequently Asked\nQuestions",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
              height: 1.1,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Everything you need to know before getting started",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 64),
          // Grid layout for the FAQ items

          MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 18,
            crossAxisSpacing: 24,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: faqList.length,
            itemBuilder: (context, index) {
              return ReusableFAQTile(item: faqList[index]);
            },
          )
          //
          // GridView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2, // Two columns
          //     crossAxisSpacing: 24,
          //     mainAxisSpacing: 18,
          //     mainAxisExtent: 100, // Keeps height consistent before expansion
          //   ),
          //   itemCount: faqList.length,
          //   itemBuilder: (context, index) {
          //     return ReusableFAQTile(item: faqList[index]);
          //   },
          // ),
        ],
      ),
    );
  }
}
