import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/constants.dart';

class MultiSelect extends StatefulWidget {
  final List<String> items;
  final List<String> selected;

  const MultiSelect({Key? key, required this.items, required this.selected})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        if (widget.selected.length < 3) {
          widget.selected.add(itemValue);
        }
      } else {
        widget.selected.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, widget.selected);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(Constants.selectLocalities),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: widget.selected.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text(Constants.cancel),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text(Constants.submit),
        ),
      ],
    );
  }
}
