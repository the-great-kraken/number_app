import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../bloc/bloc.dart';
import '../util/style.dart';
import 'country_list.dart';

Widget callCodeButton(BuildContext context) {
  String getFlag(String code) {
    return code.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  }

  return Container(
    margin: const EdgeInsets.only(
      top: 200.0,
      left: 20,
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
    child: InkWell(
      onTap: () => showCupertinoModalBottomSheet(
        expand: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          context.read<CountryBloc>().add(const SearchEvent(null));
          return countryList(context);
        },
      ),
      child: BlocBuilder<CountryBloc, CountryState>(builder: (context, state) {
        final number = state.countries
            .firstWhere((e) => e!.alpha2Code == state.code)!
            .callingCodes![0];

        return Text(
          "${getFlag(state.code)} +$number",
          style: ThemeText.code,
        );
      }),
    ),
  );
}
