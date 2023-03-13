import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../model/country.dart';
import '../util/style.dart';

Widget countryListItem(BuildContext context, Country? country) {
  String getFlag(String code) {
    return code.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  }

  return InkWell(
    onTap: () {
      BlocProvider.of<CountryBloc>(context)
          .add(UpdateCode(code: country.alpha2Code ?? ''));
      Navigator.pop(context);
    },
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 24,
            left: 20,
          ),
          width: 38,
          child: Text(
            getFlag(country!.alpha2Code ?? ''),
            style: ThemeText.code,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 24,
            left: 2,
          ),
          child: Text(
            "+${country.callingCodes![0]}",
            style: ThemeText.code,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 24,
            left: 12,
          ),
          width: 260,
          child: Text(
            country.name ?? '',
            style: ThemeText.countryName,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
