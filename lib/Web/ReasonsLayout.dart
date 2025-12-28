
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Common/CommonWidgets.dart';

class WhyYouWillLoveItPage extends StatelessWidget {
  const WhyYouWillLoveItPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100 , vertical: 50),
      child: Column(
        children: [
          // Section 1: Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "Why you’ll love it",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF1C1C33),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 8),
              //   child: Text(
              //     "Designed to help you stay on track, effortlessly.",
              //     style: TextStyle(
              //       fontSize: 18,
              //       color: Colors.grey,
              //     ),
              //   ),
              // ),
            ],
          ),

          const SizedBox(height: 50),

          // Section 2: Cards
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ReasonCard(
                icon: Icons.notifications_none_rounded,
                title: 'Reason 1',
                description:
                'Track live coin prices and market movements so you can make informed buy and sell decisions.',

              ),
              SizedBox(width: 24),
              ReasonCard(
                icon: Icons.trending_up_rounded,
                title: 'Reason 2',
                description:
                'Your funds and transactions are protected using secure systems and verified payment methods.',
              ),
              SizedBox(width: 24),
              ReasonCard(
                icon: Icons.local_fire_department_outlined,
                title: 'Reason 3',
                description:
                'Buy coins instantly and sell them anytime when prices rise, with clear balance updates.',
              ),
            ],
          ),

          const SizedBox(height: 80),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image left
              Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Image.asset(
                    'assets/card.png',
                    height: 600,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Text right
              Flexible(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: const Text(
                    "Join thousands of users from top companies using Habitus to build better habits",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1C1C33),
                      height: 1.1,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
