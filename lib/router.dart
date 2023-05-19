import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/view/add_rider_view.dart';
import 'package:grow_simplee_intern_assignment/view/home_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeView.id:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case AddRiderView.id:
        return MaterialPageRoute(builder: (_) => const AddRiderView());
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
