import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/size_config.dart';
import 'package:grow_simplee_intern_assignment/view/add_rider_view.dart';
import 'package:grow_simplee_intern_assignment/widgets/rectangular_fab.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String id = '/';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riders',
          style: TextStyle(
            fontSize: SizeConfig.blockSizeVertical * 2.5,
            // fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: RectangularFAB(
        text: 'Add',
        onPress: () {
          Navigator.of(context).pushNamed(AddRiderView.id);
        },
      ),
      // floatingActionButton: ElevatedButton(
      //   onPressed: () {
      //     Navigator.of(context).pushNamed(AddDriverView.id);
      //   },
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(
      //       horizontal: SizeConfig.blockSizeHorizontal * 7,
      //       vertical: SizeConfig.blockSizeVertical * 2,
      //     ),
      //     child: Text(
      //       'Add',
      //       style: TextStyle(
      //         fontSize: SizeConfig.blockSizeVertical * 2.5,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
