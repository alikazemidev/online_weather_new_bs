import 'package:flutter/material.dart';

class CurrentCityDataModel {
  final String? _cityName, _main, _description, _country;

  final double? _long, _lat, _temp, _min_temp, _max_temp, _wind_speed;
  final int? _pressure, _humidity, _sunRise, _sunSet;
  final DateTime? _dataTime;

  CurrentCityDataModel(
    this._cityName,
    this._main,
    this._description,
    this._country,
    this._long,
    this._lat,
    this._temp,
    this._min_temp,
    this._max_temp,
    this._wind_speed,
    this._pressure,
    this._humidity,
    this._sunRise,
    this._sunSet,
    this._dataTime,
  );

  get main => _main;

  get description => _description;

  get country => _country;

  get cityName => _cityName;

  get long => _long;

  get lat => _lat;

  get temp => _temp;

  get min_temp => _min_temp;

  get max_temp => _max_temp;

  get wind_speed => _wind_speed;

   get pressure => _pressure;

  get humidity => _humidity;

  get sunRise => _sunRise;

  get sunSet => _sunSet;

   get dataTime => _dataTime;
}
