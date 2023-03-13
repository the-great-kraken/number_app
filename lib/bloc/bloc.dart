import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/model/country.dart';
import '/controller/dio_client.dart';

part 'event.dart';
part 'state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryState.initial()) {
    on<LoadCountry>(_onLoad);
    on<UpdateCode>(_onCodeUpdate);
    on<ChangeActive>(_onChangeActive);
    on<SearchEvent>(_onSearch);
  }

  void _onLoad(LoadCountry event, Emitter<CountryState> emit) async {
    final countryList = await DioClient().getCountries();
    emit(state.copyWith(countries: countryList));
  }

  void _onCodeUpdate(UpdateCode event, Emitter<CountryState> emit) {
    final newCode = event.code;
    emit(state.copyWith(code: newCode));
  }

  void _onChangeActive(ChangeActive event, Emitter<CountryState> emit) {
    final newActive = event.isActive;
    emit(state.copyWith(isActive: newActive));
  }

  void _onSearch(SearchEvent event, Emitter<CountryState> emit) async {
    List<Country?> list = [];

    if (event.value == null) {
      list = state.countries;
    } else {
      for (var e in state.countries) {
        if (e!.name!.toLowerCase().contains(event.value!.toLowerCase()) ||
            e.callingCodes![0].contains(event.value!)) {
          list.add(e);
        }
      }
    }
    emit(state.copyWith(searchCountries: list));
  }
}
