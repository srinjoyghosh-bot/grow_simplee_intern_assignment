import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/constants/constants.dart';
import 'package:grow_simplee_intern_assignment/size_config.dart';
import 'package:grow_simplee_intern_assignment/view%20model/add_rider_viewmodel.dart';
import 'package:grow_simplee_intern_assignment/view/upload_documents_view.dart';
import 'package:grow_simplee_intern_assignment/widgets/multi_select_field.dart';
import 'package:grow_simplee_intern_assignment/widgets/rectangular_fab.dart';
import 'package:provider/provider.dart';

import '../styles.dart';
import '../utils/convert.dart';
import '../widgets/driver_form_field.dart';

class AddRiderView extends StatefulWidget {
  const AddRiderView({Key? key}) : super(key: key);
  static const String id = '/add';

  @override
  State<AddRiderView> createState() => _AddRiderViewState();
}

class _AddRiderViewState extends State<AddRiderView> {
  late AddRiderViewModel model;
  final _key = GlobalKey<FormState>();
  String name = '',
      number = '',
      address = '',
      pincode = '',
      bankAccount = '',
      ifsc = '';

  List<String> selected = [];

  void submit() async {
    final isValid = _key.currentState?.validate();
    if (isValid == null || !isValid || selected.isEmpty) {
      if (selected.isEmpty) {
        model.setWarningStatus = true;
      } else {
        model.setWarningStatus = false;
      }
      return;
    }

    _key.currentState?.save();
    model.setWarningStatus = false;
    model.onSave(name, number, address, pincode, bankAccount, ifsc, selected);
    // navigate
    Navigator.of(context).pushNamed(UploadDocumentsView.id);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    model = Provider.of<AddRiderViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            Constants.addRider,
            style: headerTextStyle1,
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 5),
            child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DriverFormField(
                      label: Constants.name,
                      textType: TextInputType.name,
                      validator: (value) {
                        if (value == null || (value.trim().isEmpty)) {
                          return Constants.nameWarning;
                        }
                        return null;
                      },
                      onSave: (value) {
                        name = value!;
                      },
                      initialText: name,
                    ),
                    DriverFormField(
                      label: Constants.phone,
                      textType: TextInputType.phone,
                      validator: (value) {
                        String? text = value?.replaceAll(' ', '');
                        if (text == null || text.isEmpty || text.length != 9) {
                          return Constants.phoneWarning;
                        }
                        return null;
                      },
                      onSave: (value) {
                        number = value!;
                      },
                      initialText: number,
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 2),
                    Text(Constants.localities, style: bodyTextStyle1),
                    SizedBox(height: SizeConfig.blockSizeVertical),
                    InkWell(
                      onTap: () async {
                        List<String>? result = await showDialog(
                            context: context,
                            builder: (_) => MultiSelect(
                                  items: model.allLocalities,
                                  selected: selected,
                                ));
                        if (result != null) {
                          setState(() {
                            selected = result;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2)),
                            border: Border.all(
                                color: model.showWarning
                                    ? Colors.red
                                    : Colors.grey)),
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal * 2,
                            vertical: SizeConfig.blockSizeVertical * 0.1),
                        height: SizeConfig.blockSizeVertical * 6,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                selected.isEmpty
                                    ? Constants.chooseLocalities
                                    : convertListToString(selected),
                                style: bodyTextStyle2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                    DriverFormField(
                      label: Constants.address,
                      textType: TextInputType.streetAddress,
                      validator: (value) {
                        if (value == null || (value.trim().isEmpty)) {
                          return Constants.addressWarning;
                        }
                        return null;
                      },
                      onSave: (value) {
                        address = value!;
                      },
                      initialText: address,
                    ),
                    DriverFormField(
                      label: Constants.pincode,
                      textType: TextInputType.number,
                      validator: (value) {
                        String? text = value?.replaceAll(' ', '');
                        if (text == null || text.isEmpty || text.length != 6) {
                          return Constants.pincodeWarning;
                        }
                        return null;
                      },
                      onSave: (value) {
                        pincode = value!;
                      },
                      initialText: pincode,
                    ),
                    DriverFormField(
                      label: Constants.bankAccNum,
                      textType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            (value.replaceAll(' ', '').isEmpty)) {
                          return Constants.bankAccWarning;
                        }
                        return null;
                      },
                      onSave: (value) {
                        bankAccount = value!;
                      },
                      initialText: bankAccount,
                    ),
                    DriverFormField(
                      label: Constants.ifsc,
                      textType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            (value.replaceAll(' ', '').isEmpty)) {
                          return Constants.ifscWarning;
                        }
                        return null;
                      },
                      onSave: (value) {
                        ifsc = value!;
                      },
                      initialText: ifsc,
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 10)
                  ],
                )),
          ),
        ),
        floatingActionButton: Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
            child: RectangularFAB(
              text: Constants.next,
              onPress: submit,
            )));
  }
}
