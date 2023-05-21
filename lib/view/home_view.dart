import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/size_config.dart';
import 'package:grow_simplee_intern_assignment/styles.dart';
import 'package:grow_simplee_intern_assignment/view%20model/home_viewmodel.dart';
import 'package:grow_simplee_intern_assignment/view/add_rider_view.dart';
import 'package:grow_simplee_intern_assignment/widgets/rectangular_fab.dart';
import 'package:grow_simplee_intern_assignment/widgets/rider_tile.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../utils/snackbars.dart';

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
          Constants.riders,
          style: TextStyle(
            fontSize: SizeConfig.blockSizeVertical * 2.5,
            // fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 4),
        child: Consumer<HomeViewModel>(
            builder: (_, model, __) => model.riders.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (_, index) => Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 2),
                      child: Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            model.removeRider(model.riders[index]);
                            if (direction == DismissDirection.startToEnd) {
                              showSuccessSnackbar(
                                  Constants.approveRider, context);
                            } else {
                              showErrorSnackbar(Constants.rejectRider, context);
                            }
                          },
                          background: Container(
                            color: Colors.green,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 2),
                                child: Text(
                                  Constants.approve,
                                  style: bodyTextStyle3,
                                ),
                              ),
                            ),
                          ),
                          secondaryBackground: Container(
                            color: Colors.red,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 2),
                                child: Text(
                                  Constants.reject,
                                  style: bodyTextStyle3,
                                ),
                              ),
                            ),
                          ),
                          child: RiderTile(rider: model.riders[index])),
                    ),
                    itemCount: model.riders.length,
                  )
                : Center(
                    child: Text(
                      Constants.noRiders,
                      style: bodyTextStyle1,
                    ),
                  )),
      ),
      floatingActionButton: RectangularFAB(
        text: Constants.add,
        onPress: () {
          Navigator.of(context).pushNamed(AddRiderView.id);
        },
      ),
    );
  }
}
