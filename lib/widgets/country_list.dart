import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number/widgets/country_list_item.dart';
import 'package:phone_number/widgets/search_bar.dart';

import '../bloc/bloc.dart';
import '../util/style.dart';

Widget countryList(BuildContext context) {
  return BlocBuilder<CountryBloc, CountryState>(builder: (context, state) {
    if (state.countries.isNotEmpty) {
      return Material(
        color: ThemeColor.background,
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20.0,
                        left: 20,
                      ),
                      child: const Text(
                        "Country code",
                        style: ThemeText.header,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        margin: const EdgeInsets.only(top: 20, right: 20),
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          color: ThemeColor.boxBackground,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                searchBar(context),
                state.searchCountries.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 20),
                          itemCount: state.searchCountries.length,
                          itemBuilder: (context, index) {
                            return countryListItem(
                                context, state.searchCountries[index]);
                          },
                        ),
                      )
                    : const Spacer(),
              ],
            ),
          ),
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(
          color: ThemeColor.textColor,
        ),
      );
    }
  });
}
