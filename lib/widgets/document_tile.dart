import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grow_simplee_intern_assignment/size_config.dart';
import 'package:grow_simplee_intern_assignment/styles.dart';
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
      final image = await ImagePicker().pickImage(
          source: pickGalleryImage ? ImageSource.gallery : ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      widget.model.setImage(widget.title, imageTemp);
    } on PlatformException catch (e) {
      // print('Failed to pick image: $e');
      //show snackbar
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
