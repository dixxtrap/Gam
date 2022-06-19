import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:grica/core/model/disaster_model.dart';
import 'package:grica/core/provider/recap_provider.dart';
import 'package:grica/interface/components/stepper/widget/step_button.dart';
import 'package:grica/interface/screen/grica_recap/widget/recap_item.dart';
import 'package:grica/interface/utils/constant/constant.dart';
import 'package:provider/provider.dart';

class RecapGrica extends StatelessWidget {
  const RecapGrica({
    Key? key,
    required this.disaster,
  }) : super(key: key);

  final DisasterModel disaster;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecapProvider(),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.only(topRight: Radius.elliptical(80, 50))),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        // decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                "Recapitulatif",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Consumer<RecapProvider>(builder: (context, recapProvider, _) {
              return Column(children: [
                if (recapProvider.loading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                if (recapProvider.errMes != "")
                  Container(
                    padding: const EdgeInsets.all(defaultPadding),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(children: [
                      Row(
                        children: [
                          const Icon(
                            BootstrapIcons.exclamation_diamond,
                            color: Colors.white,
                          ),
                          const SizedBox(width: defaultPadding / 2),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Erreur",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                recapProvider.errMes,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      )
                    ]),
                  )
              ]);
            }),
            RecapItem(
              title: "Nom de l'événement",
              value: "${disaster.catastrophe["libelle"]}",
            ),
            const Divider(),
            RecapItem(
              title: "Niveau de perte ",
              value: "${disaster.niveauPerte["libelle"]}",
            ),
            const Divider(),
            RecapItem(
              title: "La frequence de la catastrophe ",
              value: "${disaster.frequence["libelle"]}",
            ),
            const Divider(),
            RecapItem(
              title: "profondeur de la catastrophe",
              value: "${disaster.profondeur["libelle"]}",
            ),
            const Divider(),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButtonIcon(
                    icon: Icons.edit,
                    text: "modifier",
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Consumer<RecapProvider>(
                  builder: (context, recapProvider, _) => AppButtonIcon(
                      icon: BootstrapIcons.check_circle_fill,
                      text: "Valider",
                      onPressed: () async {
                        // Map<String, dynamic> data =
                        //     await recapProvider.postData(disaster.toJson());
                        // // print(data);
                        // if (data.isNotEmpty) {
                        //   Box gamBox = Hive.box("GamDBBox");
                        //   GamDB gamDB = GamDB(
                        //       date: DateTime.now(),
                        //       nature: NatureInfo.fromJson(disaster.nature),
                        //       perception: PerceptionSupportParution.fromJson(
                        //           disaster.perception),
                        //       rebond: RebondInfo.fromJson(disaster.rebond),
                        //       support: SupportParution.fromJson(disaster.support));

                        //   gamBox.put(gamDB.key(), gamDB.toJson());
                        //   GeneratedRoutes.navigateTo(
                        //       context, GeneratedRoutes.gamResponse,
                        //       arguments: data);
                        // }
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
