import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/constants.dart';
import 'package:grow_simplee_intern_assignment/model/rider.dart';
import 'package:grow_simplee_intern_assignment/styles.dart';
import 'package:grow_simplee_intern_assignment/utils/convert.dart';
import 'package:grow_simplee_intern_assignment/utils/snackbars.dart';
import 'package:grow_simplee_intern_assignment/view%20model/home_viewmodel.dart';
import 'package:grow_simplee_intern_assignment/widgets/carousel_image.dart';
import 'package:provider/provider.dart';

import '../size_config.dart';
import '../widgets/rectangular_fab.dart';

class RiderView extends StatefulWidget {
  const RiderView({Key? key, required this.rider}) : super(key: key);
  final Rider rider;
  static const String id = '/rider';

  @override
  State<RiderView> createState() => _RiderViewState();
}

class _RiderViewState extends State<RiderView> {
  void onPress(bool isAccepted) {
    Provider.of<HomeViewModel>(context, listen: false)
        .removeRider(widget.rider);
    Navigator.of(context).pop();
    if (isAccepted) {
      showSuccessSnackbar(Constants.approveRider, context);
    } else {
      showErrorSnackbar(Constants.rejectRider, context);
    }
  }

  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final rider = widget.rider;
    List<Widget> carouselItems = [
      Expanded(
        child: CarouselImage(
          image: rider.aadhar!,
          title: Constants.aadhar,
        ),
      ),
      CarouselImage(
        image: rider.pan!,
        title: Constants.pan,
      ),
      CarouselImage(
        image: rider.dl!,
        title: Constants.dl,
      ),
      CarouselImage(
        image: rider.bankChq!,
        title: Constants.bankCheque,
      ),
      CarouselImage(
        image: rider.photo!,
        title: Constants.photo,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.viewRider,
          style: headerTextStyle1,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical * 30,
              width: double.infinity,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                    ),
                    onPressed: () {
                      buttonCarouselController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: const Icon(Icons.arrow_back_ios_new_sharp),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 67,
                    height: SizeConfig.blockSizeVertical * 30,
                    child: CarouselSlider(
                      carouselController: buttonCarouselController,
                      items: carouselItems,
                      options: CarouselOptions(
                        // height: SizeConfig.blockSizeVertical * 20,
                        viewportFraction: 1,
                        // clipBehavior: Clip.hardEdge,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                    ),
                    onPressed: () {
                      buttonCarouselController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: const Icon(Icons.arrow_forward_ios_sharp),
                  ),
                ],
              ),
            ),
            // SizedBox(height: SizeConfig.blockSizeVertical * 2),

            RiderDetailField(field: Constants.name, text: rider.name),
            RiderDetailField(field: Constants.phone, text: rider.phone),
            RiderDetailField(field: Constants.address, text: rider.address),
            RiderDetailField(field: Constants.pincode, text: rider.pincode),
            RiderDetailField(field: Constants.bankAccNum, text: rider.bankAcc),
            RiderDetailField(field: Constants.ifsc, text: rider.ifsc),
            RiderDetailField(
              field: Constants.localities,
              text: convertListToString(rider.localities),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 10),
        child: Row(
          children: [
            RectangularFAB(
              text: Constants.reject,
              onPress: () {
                onPress(false);
              },
            ),
            const Spacer(),
            RectangularFAB(
              text: Constants.approve,
              onPress: () {
                onPress(true);
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class RiderDetailField extends StatelessWidget {
  const RiderDetailField({Key? key, required this.field, required this.text})
      : super(key: key);
  final String field, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1)
          .copyWith(left: SizeConfig.blockSizeHorizontal * 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: SizeConfig.blockSizeHorizontal * 40,
              child: Text(
                field,
                style: bodyTextStyle4.copyWith(color: Colors.blue),
                // textAlign: TextAlign.center,
              )),
          Expanded(
            child: Text(
              text,
              style: bodyTextStyle4,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
