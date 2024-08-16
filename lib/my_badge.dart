import 'package:flutter/material.dart';

class MyBadge extends StatelessWidget {
  final String value;
  final Color color;

  const MyBadge({
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class BadgeText extends StatelessWidget {
  final String value;
  final Color color;

  const BadgeText({
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
