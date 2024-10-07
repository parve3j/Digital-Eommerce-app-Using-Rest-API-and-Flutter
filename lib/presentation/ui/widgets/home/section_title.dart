import 'package:flutter/material.dart';
class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SectionTitle({
    super.key, required this.title, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text('See All', style: TextStyle(
              color: Colors.teal
          ),),
        )
      ],
    );
  }
}
