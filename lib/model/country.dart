class Country {
  String? name;
  String? alpha2Code;
  List<String>? callingCodes;

  Country({this.name, this.alpha2Code, this.callingCodes});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alpha2Code = json['alpha2Code'];
    callingCodes = json['callingCodes'].cast<String>();
  }
}
