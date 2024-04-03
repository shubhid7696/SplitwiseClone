import 'package:flutter/material.dart';

class NetworkAndAssetImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const NetworkAndAssetImage({
    Key? key,
    required this.imagePath,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if the image path starts with "http" or "https" for URL
    if (imagePath.startsWith("http") || imagePath.startsWith("https")) {
      return Image.network(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.cover, // Adjust as needed (cover, contain, etc.)
      );
    } else {
      // Assume it's an asset path
      return Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.cover, // Adjust as needed (cover, contain, etc.)
      );
    }
  }
}