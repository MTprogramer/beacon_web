

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FooterLinkColumn extends StatelessWidget {
  final String title;
  final List<String> links;
  final Function(String) onLinkTap; // Callback for clickability

  const FooterLinkColumn({
    super.key,
    required this.title,
    required this.links,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
        ),
        const SizedBox(height: 15),
        // Mapping links to clickable InkWells
        ...links.map((link) => InkWell(
          onTap: () => onLinkTap(link),
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              link,
              style: const TextStyle(color: Colors.white70, fontSize: 15),
            ),
          ),
        )),
      ],
    );
  }
}

class BrandingColumn extends StatelessWidget {
  const BrandingColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
          children: [
            Image.asset(
              "assets/logo.png",
              width: 28,
              height: 28,
              color: Colors.white, // optional tint
            ),
            SizedBox(width: 10),
            Text('Earn now', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.',
          style: TextStyle(color: Colors.white54, height: 1.5),
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            _SocialIcon(icon: Icons.camera_alt_outlined, onTap: () {}),
            const SizedBox(width: 15),
            _SocialIcon(icon: Icons.business_center, onTap: () {}),
          ],
        )
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _SocialIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white24),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, color: Colors.white70, size: 20),
      ),
    );
  }
}

class NewsletterColumn extends StatelessWidget {
  const NewsletterColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Newsletter', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        const Text('Get tips & updates in your inbox', style: TextStyle(color: Colors.white54)),
        const SizedBox(height: 20),
        TextField(
          style: const TextStyle(color: Colors.white), // this sets the input text color
          decoration: InputDecoration(
            hintText: 'Enter your email',
            hintStyle: const TextStyle(color: Colors.white24),
            filled: true,
            fillColor: Colors.white.withOpacity(0.05),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () => print('Subscribed!'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFBA11F),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            child: const Text('Subscribe', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}


