import 'package:flutter/material.dart';

import 'package:grica/core/data/grica_data.dart';
import 'package:grica/core/model/disaster_model.dart';
import 'package:grica/core/provider/grica_form_provider.dart';
import 'package:grica/interface/components/stepper/Stepper.dart';
import 'package:grica/interface/components/stepper/widget/input_select.dart';
import 'package:grica/interface/components/stepper/widget/step.dart';
import 'package:grica/interface/router/generate_route.dart';

import 'package:grica/interface/screen/grica/widget/grica_banner.dart';
import 'package:grica/interface/screen/main_screen/main_screen.dart';
import 'package:grica/interface/utils/constant/constant.dart';
import 'package:grica/interface/utils/theme/colors.dart';
import 'package:provider/provider.dart';

class GricaScreen extends StatelessWidget {
  const GricaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();
    return ChangeNotifierProvider(
      create: (BuildContext context) => GricaFormProvider(),
      child: MainScreen(
        color: primaryColor,
        child: Column(
          children: [
            GricaBanner(),
            Form(
              key: keyForm,
              child: Container(
                width: getW(context),
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
                child: Consumer<GricaFormProvider>(
                  builder: (context, newsController, child) {
                    return newsController.loading
                        ? const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: defaultPadding * 4),
                            child: Center(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                              backgroundColor: Colors.white12,
                            )),
                          )
                        : AppStepper(
                            title: "Verifier l'information",
                            stepDone: newsController.stepDone,
                            onFinal: () {
                              if (keyForm.currentState?.validate() ?? false) {
                                keyForm.currentState!.save();
                                GeneratedRoutes.navigateTo(
                                    context, GeneratedRoutes.recap,
                                    arguments: DisasterModel.fromJson(
                                        newsController.grica));
                              }
                            },
                            steps: [
                              ...List.generate(
                                  gricaFormData.length,
                                  (idx) => AppStep(
                                      data: gricaFormData[idx],
                                      current: newsController.getItemFromGrica(
                                          gricaFormData[idx]["key"])["libelle"],
                                      label: gricaFormData[idx]["label"],
                                      content: AppSelectInput(
                                        data: gricaFormData[idx],
                                        setter: (String v) {
                                          // print(
                                          //     newsController.getItemFromNews(
                                          //         gamFormData[idx]["key"]));
                                          // print(v);
                                          // print(
                                          //     "======================> setter");
                                          Map cV =
                                              (newsController.getItemFromGrica(
                                                  gricaFormData[idx]["key"]));
                                          // print("cv+++++++++++>");
                                          // print(cV);
                                          // print("cv+++++++++++>");
                                          // print(cV);

                                          if (v != "" &&
                                              (cV["libelle"] == "" ||
                                                  cV["libelle"] == null)) {
                                            newsController.changeStepDone(1);
                                          }
                                          newsController.updateGrica(
                                            key: gricaFormData[idx]["key"],
                                            id: gricaFormData[idx]["id"],
                                            value: v,
                                          );
                                        },
                                        list: newsController
                                            .getList(gricaFormData[idx]["key"]),
                                        hint: gricaFormData[idx]["hint"],
                                      ))),
                            ],
                          );
                  },
                ),
              ),
            ),
            Container(
              color: primaryColor,
              height: defaultPadding * 3,
            )
          ],
        ),
      ),
    );
  }
}
