import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../util/style.dart';

Widget searchBar(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(
      top: 20,
      left: 20,
      right: 20,
    ),
    height: 48,
    width: MediaQuery.of(context).size.width - 40,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      color: ThemeColor.boxBackground,
    ),
    child: TextFormField(
      style: ThemeText.code,
      decoration: const InputDecoration(
        hintText: 'Search',
        hintStyle: ThemeText.code,
        border: InputBorder.none,
        isCollapsed: true,
        prefixIcon: Icon(
          Icons.search_rounded,
          color: ThemeColor.textColor,
          size: 20,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 14,
        ),
      ),
      onChanged: (value) {
        context.read<CountryBloc>().add(SearchEvent(value));
      },
    ),
  );
}
