import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {
  bool? isEligible;
  String? eligiblityMsg = "";

  void checkEligibility(int age) {
    if (age > 18) {
      isEligible = true;
      eligiblityMsg = "you are eligible!";
    } else {
      isEligible = false;
      eligiblityMsg = "you are not eligible!";
    }
    notifyListeners();
  }
}
