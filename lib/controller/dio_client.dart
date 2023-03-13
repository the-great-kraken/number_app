import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:phone_number/model/country.dart';

class DioClient {
  final Dio _dio = Dio();

  Future<List<Country>> getCountries() async {
    List<dynamic> country = [];
    try {
      const url = 'https://restcountries.com/v2/all';

      Response countryData = await _dio.get(url);

      country = countryData.data.map((e) => Country.fromJson(e)).toList();
    } on DioError catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print('Dio error! Status: ${e.response?.statusCode}');
        }
      } else {
        if (kDebugMode) {
          print('Error sending request! ${e.message}');
        }
      }
    }

    return country.map((e) => e as Country).toList();
  }
}
