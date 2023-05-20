import 'dart:io';

class Rider {
  String name, phone, address, pincode, bankAcc, ifsc;
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
      this.aadhar,
      this.pan,
      this.dl,
      this.bankChq,
      this.photo});
}
