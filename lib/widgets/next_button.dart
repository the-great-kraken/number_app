import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number/util/style.dart';
import 'package:phone_number/widgets/dialog.dart';

import '../bloc/bloc.dart';

Widget nextButton(BuildContext context) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      margin: const EdgeInsets.only(
        top: 125,
        right: 20,
      ),
      height: 48,
      width: 48,
      child: ElevatedButton(
        onPressed: context.watch<CountryBloc>().state.isActive
            ? () => dialog(context)
            : null,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: ThemeColor.boxBackground,
          backgroundColor: Colors.white,
          shadowColor: ThemeColor.buttonShadow,
          elevation: 12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.zero,
        ),
        child: Icon(
          Icons.arrow_forward_rounded,
          size: 30,
          color: context.watch<CountryBloc>().state.isActive
              ? ThemeColor.textColor
              : ThemeColor.hintColor,
        ),
      ),
    ),
  );
}
