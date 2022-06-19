import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppSelectInput extends StatelessWidget {
  String? hint;

  List<Map<String, dynamic>>? list;
  Map? data;
  Function? validator;
  Function? setter;
  String? value;
  AppSelectInput(
      {Key? key,
      this.hint,
      this.list,
      this.validator,
      this.setter,
      this.value,
      this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: -4, horizontal: 20),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(1000)))),
        isDense: true,
        hint: Text("$hint"),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == "" || value == null) {
            return 'Obligatoire';
          } else {
            return null;
          }
        },
        onSaved: ((newValue) {
          setter!(newValue);
        }),
        items: List.generate(
            list!.length,
            (idx) => DropdownMenuItem(
                  child: Text(list![idx]['libelle'].toString()),
                  value: "${list![idx][data!['id']]}@${list![idx]['libelle']}",
                )),
        onChanged: (v) {
          // print("new valuee: $v");
          setter!(v);
        });
  }
}
