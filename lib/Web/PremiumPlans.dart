
//
//
// class PricingCard extends StatelessWidget {
//   final String image;
//
//   const PricingCard({super.key, required this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 8.0), // spacing between cards
//         height: 500, // adjust height as needed
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(32),
//           image: DecorationImage(
//             image: AssetImage(image),
//             fit: BoxFit.cover,
//           )
//         ),
//       ),
//     );
//   }
// }
//
// class PricingSection extends StatelessWidget {
//   const PricingSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
//       child: Column(
//         children: [
//           const Text(
//             "Take a Look Plans",
//             style: TextStyle(
//               fontSize: 36.0,
//               fontWeight: FontWeight.w900,
//               color: Color(0xFF1C1C33),
//             ),
//           ),
//           const SizedBox(height: 16.0),
//           Text(
//             "A simple, beautiful interface built for everyday use.",
//             style: TextStyle(
//               fontSize: 18.0,
//               color: Colors.grey[600],
//             ),
//           ),
//           const SizedBox(height: 50.0),
//
//           // Row of cards that fit available width
//           Row(
//             children: const [
//               PricingCard(image: 'assets/img.png'),
//               PricingCard(image: 'assets/b2.png'),
//               PricingCard(image: 'assets/b3.png'),
//               PricingCard(image: 'assets/b4.png'),
//               PricingCard(image: 'assets/b5.png'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// --- 1. Custom Clipper for the Card Shape ---

// --- 1. Precise Custom Clipper ---
// This creates the exact "slant-top" shape seen in your design.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Common/CommonWidgets.dart';


// --- 3. Main Section Widget ---

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 60.0),
      child: Column(
        children: [
          // Section Title
          const Text(
            "Take a Look Plans",
            style: TextStyle(
              fontSize: 56.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1C1C33),
            ),
          ),
          // Section Subtitle
          Text(
            "A simple, beautiful interface built for everyday use.",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 50.0),

          Row(
            children: const [
              Expanded(child: PricingCard(planName: "B2", price: "50.0", dailyTickets: "5", ticketReward: "4.0")),
              SizedBox(width: 36), // space between cards
              Expanded(child: PricingCard(planName: "B4", price: "200", dailyTickets: "5", ticketReward: "4.0")),
              SizedBox(width: 36),
              Expanded(child: PricingCard(planName: "B5", price: "300", dailyTickets: "5", ticketReward: "4.0")),
              SizedBox(width: 36),
              Expanded(child: PricingCard(planName: "B1", price: "25.0", dailyTickets: "5", ticketReward: "4.0")),
              SizedBox(width: 36),
              Expanded(child: PricingCard(planName: "B3", price: "100.0", dailyTickets: "5", ticketReward: "4.0")),
            ],
          )
        ],
      ),
    );
  }
}
