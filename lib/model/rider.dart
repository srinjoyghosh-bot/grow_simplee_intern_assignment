import 'dart:io';

class Rider {
  String name, phone, address, pincode, bankAcc, ifsc, id;
  List<String> localities;
  File? aadhar, pan, dl, bankChq, photo;

  Rider(
      {required this.name,
      required this.phone,
      required this.address,
      required this.pincode,
      required this.bankAcc,
      required this.ifsc,
      required this.localities,
      required this.id,
      required this.aadhar,
      required this.pan,
      required this.dl,
      required this.bankChq,
      required this.photo});
}
