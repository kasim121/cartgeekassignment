import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

import '../models/packages_list_model.dart';

class PackagesProvider extends ChangeNotifier {
  static const apiEndpoint =
      'https://www.cgprojects.in/lens8/api/dummy/packages_list';

  bool isLoading = true;
  String error = '';
  PackagesModelList? packagesModel;

  getPackagesAPI() async {
    try {
      var response = await http.get(Uri.parse(apiEndpoint));
      if (response.statusCode == 200) {
        packagesModel = packagesModelListFromJson(response.body);
        debugPrint(
            "printing packages data.. ${packagesModel!.response!.first.title}");
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
