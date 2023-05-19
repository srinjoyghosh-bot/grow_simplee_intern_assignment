import 'package:flutter/material.dart';

import '../size_config.dart';

class RectangularFAB extends StatefulWidget {
  const RectangularFAB({Key? key, required this.text, required this.onPress})
      : super(key: key);
  final String text;
  final void Function() onPress;

  @override
  State<RectangularFAB> createState() => _RectangularFABState();
}

class _RectangularFABState extends State<RectangularFAB> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 7,
          vertical: SizeConfig.blockSizeVertical * 2,
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: SizeConfig.blockSizeVertical * 2.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
