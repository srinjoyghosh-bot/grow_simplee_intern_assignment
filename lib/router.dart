import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/view/add_rider_view.dart';
import 'package:grow_simplee_intern_assignment/view/home_view.dart';
import 'package:grow_simplee_intern_assignment/view/image_view.dart';
import 'package:grow_simplee_intern_assignment/view/upload_documents_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeView.id:
        return MaterialPageRoute(
            builder: (_) => const HomeView(),
            settings: const RouteSettings(name: HomeView.id));
      case AddRiderView.id:
        return MaterialPageRoute(builder: (_) => const AddRiderView());
      case UploadDocumentsView.id:
        return MaterialPageRoute(builder: (_) => const UploadDocumentsView());
      case ImageView.id:
        return MaterialPageRoute(
            builder: (_) => ImageView(image: settings.arguments as File));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route for ${settings.name}'),
                  ),
                ));
    }
  }
}
