import 'package:flutter/material.dart';

class CircularImageWidget extends StatelessWidget {
  final String imageURL;
  const CircularImageWidget({Key? key,required this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Image.network(
        imageURL,
        height: 40,
        width: 40,
        fit: BoxFit.cover,
      ),
    );
  }
}
