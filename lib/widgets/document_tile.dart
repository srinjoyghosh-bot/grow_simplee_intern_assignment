import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grow_simplee_intern_assignment/size_config.dart';
import 'package:grow_simplee_intern_assignment/styles.dart';
import 'package:grow_simplee_intern_assignment/utils/snackbars.dart';
import 'package:grow_simplee_intern_assignment/view%20model/add_rider_viewmodel.dart';
import 'package:grow_simplee_intern_assignment/view/image_view.dart';
import 'package:image_picker/image_picker.dart';

class DocumentTile extends StatefulWidget {
  const DocumentTile({Key? key, required this.title, required this.model})
      : super(key: key);
  final String title;
  final AddRiderViewModel model;

  @override
  State<DocumentTile> createState() => _DocumentTileState();
}

class _DocumentTileState extends State<DocumentTile> {
  // File? image;
  bool pickGalleryImage = false;

  Future pickImage() async {
    try {
      final imageSource = await showDialog<ImageSource>(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  "Select the image source",
                  style: bodyTextStyle1,
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () =>
                          Navigator.pop(context, ImageSource.camera),
                      child: Text(
                        "Camera",
                        style: buttonTextStyle2,
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pop(context, ImageSource.gallery),
                      child: Text(
                        "Gallery",
                        style: buttonTextStyle2,
                      ),
                    ),
                  ],
                ),
              ));
      if (imageSource == null) return;
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      final imageTemp = File(image.path);
      widget.model.setImage(widget.title, imageTemp);
    } on PlatformException catch (e) {
      showErrorSnackbar('Failed to pick up image', context);
    }
  }

  void viewImage() {
    Navigator.of(context).pushNamed(ImageView.id,
        arguments: widget.model.getImage(widget.title));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      child: CheckboxListTile(
        value: widget.model.isEnabled(widget.title),
        onChanged: widget.model.getImage(widget.title) == null
            ? null
            : (val) {
                widget.model.setEnabled(widget.title, val ?? false);
              },
        // checkColor: Colors.blue,
        title: Text(
          widget.title,
          style: bodyTextStyle1,
        ),
        contentPadding:
            EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1.5),
        secondary: SizedBox(
          width: SizeConfig.blockSizeHorizontal * 40,
          child: Row(
            children: [
              OutlinedButton(
                onPressed: widget.model.getImage(widget.title) == null
                    ? null
                    : viewImage,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      color: widget.model.getImage(widget.title) == null
                          ? Colors.grey
                          : Colors.blue),
                ),
                child: Text(
                  'View',
                  style: buttonTextStyle2,
                ),
              ),
              OutlinedButton(
                onPressed: pickImage,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'Add',
                  style: buttonTextStyle2,
                ),
              ),
            ],
          ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(2))),
      ),
    );
  }
}
