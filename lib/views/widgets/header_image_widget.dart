import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final String imageUrl;
  final String badgeText;
  final double height;

  const HeaderImageWidget({
    super.key,
    required this.imageUrl,
    required this.badgeText,
    this.height = 230,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: height,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.indigo.shade100,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.directions_boat,
                  size: 48,
                  color: Colors.indigo,
                ),
              );
            },
          ),
        ),
        Positioned(
          left: 12,
          bottom: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 0, 0, 0.65),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              badgeText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}