import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final String imageUrl;

  const HeaderImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: 250,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        height: 250,
        color: Colors.blueGrey,
        child: const Center(
          child: Icon(Icons.image, size: 64, color: Colors.white70),
        ),
      ),
    );
  }
}