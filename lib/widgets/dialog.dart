import 'package:flutter/material.dart';
import 'package:phone_number/util/style.dart';

Future<void> dialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
        title: const Center(
          child: Text(
            "Success",
            style: ThemeText.header,
          ),
        ),
        content: SizedBox(
          height: 36,
          child: Column(
            children: const [
              Text(
                "Press button to continue",
                style: ThemeText.countryName,
              ),
              Divider(
                thickness: 1.5,
              ),
            ],
          ),
        ),
        actionsPadding: const EdgeInsets.only(bottom: 10, right: 14),
        backgroundColor: ThemeColor.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Okey",
              style: ThemeText.code,
            ),
          ),
        ]),
  );
}
