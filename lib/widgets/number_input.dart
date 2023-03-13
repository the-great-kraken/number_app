import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask/mask.dart';

import '../bloc/bloc.dart';
import '../util/style.dart';

Widget numberInput(BuildContext context) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(
        top: 200.0,
        left: 8,
        right: 20,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 12,
      ),
      height: 48,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        color: ThemeColor.boxBackground,
      ),
      child: TextFormField(
        inputFormatters: [
          Mask.generic(
            masks: ['(###) ###-####'],
            hashtag: Hashtag.numbers,
          ),
        ],
        style: ThemeText.code,
        decoration: const InputDecoration.collapsed(
          hintText: '(123) 123-1234',
          hintStyle: ThemeText.hint,
          border: InputBorder.none,
        ),
        autofocus: true,
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          if (Mask.validations.generic(value, min: 14, error: 'Error') ==
              null) {
            context.read<CountryBloc>().add(const ChangeActive(isActive: true));
          } else {
            context.read<CountryBloc>().add(const ChangeActive(isActive: false));
          }
        },
      ),
    ),
  );
}
