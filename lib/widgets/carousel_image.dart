import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/styles.dart';

import '../size_config.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({Key? key, required this.image, required this.title})
      : super(key: key);
  final File image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.file(
          image,
          height: SizeConfig.blockSizeVertical * 25,
          width: SizeConfig.blockSizeHorizontal * 70,
        ),
        SizedBox(height: SizeConfig.blockSizeVertical),
        Text(title, style: bodyTextStyle1)
      ],
    );
  }
}
