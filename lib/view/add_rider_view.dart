import 'package:flutter/material.dart';
import 'package:grow_simplee_intern_assignment/size_config.dart';
import 'package:grow_simplee_intern_assignment/widgets/multi_select_field.dart';
import 'package:grow_simplee_intern_assignment/widgets/rectangular_fab.dart';

import '../styles.dart';
import '../widgets/driver_form_field.dart';

class AddRiderView extends StatefulWidget {
  const AddRiderView({Key? key}) : super(key: key);
  static const String id = '/add';

  @override
  State<AddRiderView> createState() => _AddRiderViewState();
}

class _AddRiderViewState extends State<AddRiderView> {
  final _key = GlobalKey<FormState>();
  String name = '',
      number = '',
      address = '',
      pincode = '',
      bankAccount = '',
      ifsc = '';

  List<String> localities = [
    'Civil Lines',
    'Saharanpur',
    'IT Roorkee',
    'Old Roorkee'
  ];
  List<String> selected = [];

  void submit() async {
    final isValid = _key.currentState?.validate();
    if (isValid == null || !isValid) {
      return;
    }
    _key.currentState?.save();
    // final result = await _model.createTransaction(
    //     title, amount, selectedType, selectedCategory);
    // if (result) {
    //   Navigator.of(context).pushReplacementNamed(MainScreen.id);
    //   showSuccessToast('Transaction added!', context);
    // } else {
    //   showErrorToast(_model.errorMessage, context);
    // }
  }

  String convertListToString(List<String> list) {
    String res = "";
    for (String element in list) {
      res += "$element, ";
    }
    return res.substring(0, res.length - 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add New Rider',
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
                      label: 'Name',
                      textType: TextInputType.name,
                      validator: (value) {
                        if (value == null || (value.trim().isEmpty)) {
                          return 'Please add a name';
                        }
                        return null;
                      },
                      onSave: (value) {
                        name = value!;
                      },
                    ),
                    DriverFormField(
                      label: 'Phone Number',
                      textType: TextInputType.phone,
                      validator: (value) {
                        String? text = value?.replaceAll(' ', '');
                        if (text == null || text.isEmpty || text.length != 9) {
                          return 'Please add a 9 digit phone number';
                        }
                        return null;
                      },
                      onSave: (value) {
                        number = value!;
                      },
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 2),
                    Text('Localities', style: bodyTextStyle1),
                    SizedBox(height: SizeConfig.blockSizeVertical),
                    InkWell(
                      onTap: () async {
                        List<String>? result = await showDialog(
                            context: context,
                            builder: (_) => MultiSelect(
                                  items: localities,
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
                            border: Border.all(color: Colors.grey)),
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal * 2,
                            vertical: SizeConfig.blockSizeVertical * 0.1),
                        height: SizeConfig.blockSizeVertical * 6,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                selected.isEmpty
                                    ? 'Choose Some Localities'
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
                      label: 'Current Address',
                      textType: TextInputType.streetAddress,
                      validator: (value) {
                        if (value == null || (value.trim().isEmpty)) {
                          return 'Please add a valid address';
                        }
                        return null;
                      },
                      onSave: (value) {
                        address = value!;
                      },
                    ),
                    DriverFormField(
                      label: 'Current Pincode',
                      textType: TextInputType.number,
                      validator: (value) {
                        String? text = value?.replaceAll(' ', '');
                        if (text == null || text.isEmpty || text.length != 6) {
                          return 'Please add a 6 digit pincode';
                        }
                        return null;
                      },
                      onSave: (value) {
                        pincode = value!;
                      },
                    ),
                    DriverFormField(
                      label: 'Bank Account Number',
                      textType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            (value.replaceAll(' ', '').isEmpty)) {
                          return 'Please add a account number';
                        }
                        return null;
                      },
                      onSave: (value) {
                        bankAccount = value!;
                      },
                    ),
                    DriverFormField(
                      label: 'IFSC Number',
                      textType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            (value.replaceAll(' ', '').isEmpty)) {
                          return 'Please add a valid IFSC number';
                        }
                        return null;
                      },
                      onSave: (value) {
                        ifsc = value!;
                      },
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 10)
                  ],
                )),
          ),
        ),
        floatingActionButton: Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
            child: RectangularFAB(
              text: 'Next',
              onPress: submit,
            )));
  }
}
