import 'dart:io';

import 'package:grow_simplee_intern_assignment/constants/constants.dart';
import 'package:grow_simplee_intern_assignment/model/rider.dart';
import 'package:grow_simplee_intern_assignment/view%20model/base_viewmodel.dart';

class AddRiderViewModel extends BaseViewModel {
  String? _name, _phone, _address, _pincode, _bank, _ifsc;
  List<String>? _localities;
  Map<String, File?> _imageMap = {
    Constants.aadhar: null,
    Constants.pan: null,
    Constants.dl: null,
    Constants.bankCheque: null,
    Constants.photo: null,
  };
  Map<String, bool> _isEnabled = {
    Constants.aadhar: false,
    Constants.pan: false,
    Constants.dl: false,
    Constants.bankCheque: false,
    Constants.photo: false,
  };

  final List<String> _allLocalities = [
    'Civil Lines',
    'Saharanpur',
    'IT Roorkee',
    'Old Roorkee'
  ];

  bool _showLocalitiesWarning = false;

  void onSave(String name, String phone, String address, String pincode,
      String bank, String ifsc, List<String> localities) {
    _name = name;
    _phone = phone;
    _address = address;
    _pincode = pincode;
    _bank = bank;
    _ifsc = ifsc;
    _localities = localities;
    // notifyListeners();
  }

  String? get name => _name;

  String? get phone => _phone;

  String? get address => _address;

  String? get pincode => _pincode;

  String? get bank => _bank;

  String? get ifsc => _ifsc;

  bool get showWarning => _showLocalitiesWarning;

  List<String>? get selectedLocalities => [...?_localities];

  List<String> get allLocalities => [..._allLocalities];

  set setLocalities(List<String> value) {
    _localities = value;
    notifyListeners();
  }

  set setWarningStatus(bool value) {
    _showLocalitiesWarning = value;
    notifyListeners();
  }

  void setImage(String field, File? image) {
    _imageMap[field] = image;
    _isEnabled[field] = true;
    notifyListeners();
  }

  void setEnabled(String field, bool value) {
    _isEnabled[field] = value;
    notifyListeners();
  }

  bool? isEnabled(String field) => _isEnabled[field];

  File? getImage(String field) => _imageMap[field];

  Rider saveRider() {
    Rider rider = Rider(
      name: _name!,
      phone: _phone!,
      address: _address!,
      pincode: _pincode!,
      bankAcc: _bank!,
      ifsc: _ifsc!,
      localities: _localities!,
      aadhar: (_isEnabled[Constants.aadhar] ?? false)
          ? _imageMap[Constants.aadhar]
          : null,
      bankChq: (_isEnabled[Constants.bankCheque] ?? false)
          ? _imageMap[Constants.bankCheque]
          : null,
      dl: (_isEnabled[Constants.dl] ?? false) ? _imageMap[Constants.dl] : null,
      pan: (_isEnabled[Constants.pan] ?? false)
          ? _imageMap[Constants.pan]
          : null,
      photo: (_isEnabled[Constants.photo] ?? false)
          ? _imageMap[Constants.photo]
          : null,
    );
    clearAll();
    return rider;
  }

  void clearAll() {
    _imageMap = {
      Constants.aadhar: null,
      Constants.pan: null,
      Constants.dl: null,
      Constants.bankCheque: null,
      Constants.photo: null,
    };
    _isEnabled = {
      Constants.aadhar: false,
      Constants.pan: false,
      Constants.dl: false,
      Constants.bankCheque: false,
      Constants.photo: false,
    };
  }
}
