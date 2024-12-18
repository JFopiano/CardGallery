import 'dart:convert';
import 'package:flutter/services.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Production';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _apiKey = data['apiKey'];
      _apikey1215 = data['apikey1215'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  String _apiKey = '';
  String get apiKey => _apiKey;

  String _apikey1215 = '';
  String get apikey1215 => _apikey1215;
}
