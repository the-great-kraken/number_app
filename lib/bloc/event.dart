part of 'bloc.dart';

@immutable
abstract class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];
}

class LoadCountry extends CountryEvent {}

class UpdateCode extends CountryEvent {
  final String code;

  const UpdateCode({required this.code});

  @override
  List<Object> get props => [code];
}

class ChangeActive extends CountryEvent {
  final bool isActive;

  const ChangeActive({required this.isActive});

  @override
  List<Object> get props => [isActive];
}

class SearchEvent extends CountryEvent {
  final String? value;

  const SearchEvent(this.value);
}
