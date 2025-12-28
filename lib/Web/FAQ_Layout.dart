

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Common/CommonWidgets.dart';
import '../Models/FAQItem.dart';

class FAQSection extends StatelessWidget {
  FAQSection({super.key});

  final List<FAQItem> faqList = [
    FAQItem(
      question: "What do I get with Premium?",
      answer: "Full access to all habit tracking features and advanced insights.",
      backgroundColor: const Color(0xFFFF633B), // Bright Orange
    ),
    FAQItem(
      question: "What do I get with Premium?",
      answer: "Personalized coaching and priority support from our experts.",
      backgroundColor: const Color(0xFFFFD1D1), // Soft Pink
    ),
    FAQItem(
      question: "What happens if I miss a day?",
      answer: "Don't worry! You can log missed days or pause your streak.",
      backgroundColor: const Color(0xFFE2CCDF), // Soft Purple
    ),
    FAQItem(
      question: "What happens if I miss a day?",
      answer: "Our smart reminders help you get back on track effortlessly.",
      backgroundColor: const Color(0xFFDEF0FA), // Soft Blue
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
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two columns
              crossAxisSpacing: 24,
              mainAxisSpacing: 18,
              mainAxisExtent: 100, // Keeps height consistent before expansion
            ),
            itemCount: faqList.length,
            itemBuilder: (context, index) {
              return ReusableFAQTile(item: faqList[index]);
            },
          ),
        ],
      ),
    );
  }
}
