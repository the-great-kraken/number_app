part of 'bloc.dart';

class CountryState extends Equatable {
  final List<Country?> countries;
  final List<Country?> searchCountries;
  final String code;
  final bool isActive;

  const CountryState({
    required this.countries,
    required this.code,
    required this.isActive,
    required this.searchCountries,
  });

  factory CountryState.initial() {
    return CountryState(
      countries: const [],
      code: WidgetsBinding.instance.window.locale.countryCode ?? "UA",
      isActive: false,
      searchCountries: const [],
    );
  }

  @override
  List<Object> get props => [code, isActive, countries, searchCountries];

  CountryState copyWith({
    List<Country>? countries,
    List<Country?>? searchCountries,
    String? code,
    bool? isActive,
  }) {
    return CountryState(
      countries: countries ?? this.countries,
      code: code ?? this.code,
      isActive: isActive ?? this.isActive,
      searchCountries: searchCountries ?? this.searchCountries,
    );
  }
}
