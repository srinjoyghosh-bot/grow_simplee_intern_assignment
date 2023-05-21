import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/styles.dart';

import '../constants.dart';

class ImageView extends StatefulWidget {
  const ImageView({Key? key, required this.image}) : super(key: key);
  final File image;
  static const String id = '/image';

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.image, style: headerTextStyle1),
        elevation: 0,
      ),
      body: Image.file(widget.image, fit: BoxFit.fill),
    );
  }
}
