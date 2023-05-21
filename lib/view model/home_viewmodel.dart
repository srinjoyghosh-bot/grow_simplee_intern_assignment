import 'package:grow_simplee_intern_assignment/view%20model/base_viewmodel.dart';

import '../model/rider.dart';

class HomeViewModel extends BaseViewModel {
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
