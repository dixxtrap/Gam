import 'package:flutter/widgets.dart';
import 'package:grica/core/model/grica_response_model.dart';
import 'package:grica/core/model/response_model.dart';
import 'package:grica/core/service/grica_service.dart';

class GricaFormProvider extends ChangeNotifier {
  late GricaResponseModel gricaRsp;
  bool loading = false;
  String errMes = "";
  int stepDone = 0;
  Map<String, dynamic> grica = {
    "niveauPerte": {},
    "catastrophe": {},
    "profondeur": {},
    "niveauControle": {},
    "frequence": {},
    "vitesse": {}
  };

  GricaFormProvider() {
    getData();
  }
  getData() async {
    handleLoading(true);
    ResponseModel res = await GricaServices().getParameter("apiparametre");
    if (res.statusCode == 200) {
      gricaRsp = GricaResponseModel.fromJson(res.body);
      print(gricaRsp);
    }

    handleLoading(false);
  }

  handleErr(String mes) {
    errMes = mes;
    notifyListeners();
  }

  handleLoading(bool l) {
    loading = l;
    notifyListeners();
  }

  List<Map<String, dynamic>> getList(String key) {
    switch (key) {
      case "niveauPerte":
        // do something
        return [for (NiveauPerte e in gricaRsp.niveauPerte ?? []) e.toJson()];
      case "catastrophe":
        // do something else
        return [for (Catastrophe e in gricaRsp.catastrophe ?? []) e.toJson()];
      case "profondeur":
        // do something
        return [for (Profondeur e in gricaRsp.profondeur ?? []) e.toJson()];
      case "niveauControle":
        // do something else
        return [
          for (NiveauControle e in gricaRsp.niveauControle ?? []) e.toJson()
        ];
      case "frequence":
        // do something else
        return [for (Frequence e in gricaRsp.frequence ?? []) e.toJson()];
      case "vitesse":
        return [for (Vitesse e in gricaRsp.vitesse ?? []) e.toJson()];
      default:
        return [{}];
    }
  }

  Map getItemFromGrica(String key) {
    return grica[key];
  }

  changeStepDone(int i) {
    stepDone += i;
    notifyListeners();
  }

  updateGrica({
    required String key,
    required String id,
    required value,
  }) {
    List l = value.split("@");

    grica[key] = {id: l[0], "libelle": l[1]};

    notifyListeners();
  }
}
