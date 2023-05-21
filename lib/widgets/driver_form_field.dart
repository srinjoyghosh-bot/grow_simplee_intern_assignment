import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/size_config.dart';
import 'package:grow_simplee_intern_assignment/styles.dart';

class DriverFormField extends StatefulWidget {
  const DriverFormField({
    Key? key,
    required this.label,
    required this.textType,
    required this.validator,
    required this.onSave,
    this.initialText,
    required this.focusNode,
    required this.onSubmit,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);
  final String label;
  final TextInputType textType;
  final String? Function(String? val) validator;
  final void Function(String? val) onSave;
  final String? initialText;
  final FocusNode focusNode;
  final Function(String?) onSubmit;
  final TextInputAction textInputAction;

  @override
  State<DriverFormField> createState() => _DriverFormFieldState();
}

class _DriverFormFieldState extends State<DriverFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SizeConfig.blockSizeVertical * 2),
        Text(widget.label, style: bodyTextStyle1),
        SizedBox(height: SizeConfig.blockSizeVertical),
        TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 0.1,
                horizontal: SizeConfig.blockSizeHorizontal * 2),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(2.0),
            ),
            // labelStyle:
            // TextStyle(color: Colors.black.withOpacity(0.65)),
            // labelText: 'Title',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(2),
              ),
            ),
          ),
          style: bodyTextStyle2,
          keyboardType: widget.textType,
          validator: widget.validator,
          onSaved: widget.onSave,
          initialValue: widget.initialText,
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onSubmit,
          textInputAction: widget.textInputAction,
        ),
      ],
    );
  }
}
