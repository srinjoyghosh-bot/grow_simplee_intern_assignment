import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/constants/constants.dart';
import 'package:grow_simplee_intern_assignment/size_config.dart';
import 'package:grow_simplee_intern_assignment/styles.dart';
import 'package:grow_simplee_intern_assignment/utils/snackbars.dart';
import 'package:grow_simplee_intern_assignment/view%20model/add_rider_viewmodel.dart';
import 'package:grow_simplee_intern_assignment/view%20model/home_viewmodel.dart';
import 'package:grow_simplee_intern_assignment/widgets/document_tile.dart';
import 'package:grow_simplee_intern_assignment/widgets/rectangular_fab.dart';
import 'package:provider/provider.dart';

class UploadDocumentsView extends StatefulWidget {
  const UploadDocumentsView({Key? key}) : super(key: key);
  static const String id = '/upload';

  @override
  State<UploadDocumentsView> createState() => _UploadDocumentsViewState();
}

class _UploadDocumentsViewState extends State<UploadDocumentsView> {
  late AddRiderViewModel model;

  void onSave() {
    final rider = model.saveRider();
    if (rider == null) {
      showErrorSnackbar(Constants.uploadAllDocuments, context);
      return;
    }
    Provider.of<HomeViewModel>(context, listen: false).addRider(rider);
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    model = Provider.of<AddRiderViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(Constants.uploadDocuments, style: headerTextStyle1),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 5),
        child: Column(
          children: [
            DocumentTile(title: Constants.aadhar, model: model),
            DocumentTile(title: Constants.pan, model: model),
            DocumentTile(title: Constants.dl, model: model),
            DocumentTile(title: Constants.bankCheque, model: model),
            DocumentTile(title: Constants.photo, model: model),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 10),
        child: Row(
          children: [
            RectangularFAB(
              text: Constants.back,
              onPress: () {
                Navigator.of(context).pop();
              },
            ),
            const Spacer(),
            RectangularFAB(
              text: Constants.save,
              onPress: onSave,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
