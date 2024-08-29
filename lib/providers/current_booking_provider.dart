import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import '../models/booking_list_model.dart';

class CurrentBookingProvider extends ChangeNotifier {
  static const apiEndpoint =
      'https://www.cgprojects.in/lens8/api/dummy/current_booking_list';

  bool isLoading = true;
  String error = '';
  CurrentBookingModel? currentBookingModel;

  getCurrentBookingAPI() async {
    try {
      var response = await http.get(Uri.parse(apiEndpoint));
      if (response.statusCode == 200) {
        currentBookingModel = currentBookingModelFromJson(response.body);
        debugPrint(
            "printing current booking data.. ${currentBookingModel!.response!.first.title}");
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
