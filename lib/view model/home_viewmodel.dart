import 'package:flutter/material.dart';

import '../model/rider.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Rider> _riders = [];

  List<Rider> get riders => [..._riders];

  void addRider(Rider rider) {
    _riders.add(rider);
    notifyListeners();
  }

  void removeRider(Rider rider) {
    _riders.removeWhere((element) => element.id == rider.id);
    notifyListeners();
  }
}
