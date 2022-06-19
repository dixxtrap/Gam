import 'package:flutter/foundation.dart';
import 'package:grica/core/model/response_model.dart';
import 'package:grica/core/service/grica_service.dart';

class RecapProvider extends ChangeNotifier {
  bool loading = false;
  String errMes = "";

  Future<Map<String, dynamic>> postData(Map<String, dynamic> dt) async {
    loading = true;
    notifyListeners();
    Map<String, dynamic> data = {};
    ResponseModel res = await GricaServices().handlePostMethode("action", dt);
    if (res.statusCode == 200) {
      data = res.body;
    } else {
      errMes = res.errorMessage.toString();
    }

    loading = false;
    notifyListeners();
    return data;
  }
}
