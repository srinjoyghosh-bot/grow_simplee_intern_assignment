import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/router.dart';
import 'package:grow_simplee_intern_assignment/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomeView.id,
        onGenerateRoute: AppRouter.generateRoute,
        // home: const HomeView(),
      ),
    );
  }
}
