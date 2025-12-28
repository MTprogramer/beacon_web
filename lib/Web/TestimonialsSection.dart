

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Common/CommonWidgets.dart';
import '../Models/Testimonial.dart';

class TestimonialsSection extends StatelessWidget {
  TestimonialsSection({super.key});

  final List<Testimonial> testimonials = [
    Testimonial(
      name: "Sarah T.",
      role: "Writer",
      quote: "I've finally stayed consistent with journaling for 90 days. This app made it effortless.",
      imageUrl: "assets/sarah.png",
    ),
    Testimonial(
      name: "James K.",
      role: "Software Engineer",
      quote: "Seeing my progress visually keeps me motivated every day. The reminders are just perfect!",
      imageUrl: "assets/james.png",
    ),
    Testimonial(
      name: "Priya R.",
      role: "Wellness Coach",
      quote: "I've tried several habit trackers, but this one is the only one I actually stuck with.",
      imageUrl: "assets/priya.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "What our users say",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Real stories from people who turned their goals into habits.",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: testimonials.map((t) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TestimonialCard(testimonial: t),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}
