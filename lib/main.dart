import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/constants.dart';
import 'package:grow_simplee_intern_assignment/router.dart';
import 'package:grow_simplee_intern_assignment/view%20model/add_rider_viewmodel.dart';
import 'package:grow_simplee_intern_assignment/view%20model/home_viewmodel.dart';
import 'package:grow_simplee_intern_assignment/view/home_view.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddRiderViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel())
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          title: Constants.appTitle,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: HomeView.id,
          onGenerateRoute: AppRouter.generateRoute,
          // home: const HomeView(),
        ),
      ),
    );
  }
}
