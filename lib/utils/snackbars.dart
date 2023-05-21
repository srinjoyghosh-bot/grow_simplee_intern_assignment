import 'package:flutter/material.dart';

void showSuccessSnackbar(String msg, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    backgroundColor: Theme.of(context).primaryColor,
    duration: const Duration(seconds: 3),
  ));
}

void showErrorSnackbar(String msg, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    backgroundColor: Colors.red,
    duration: const Duration(seconds: 3),
  ));
}
