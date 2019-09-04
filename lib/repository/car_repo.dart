import 'package:flutter_transitions/model/car.dart';
import 'package:flutter_transitions/util/assets.dart';

class CarRepo {
  List<Car> getCars() {
    final list = List<Car>();
    list.add(Car('i8', 'BMW', ThemeAssets.bmw, ThemeAssets.bmwLogo,
        'fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew f'));
    list.add(Car('Model X', 'Tesla', ThemeAssets.tesla, ThemeAssets.teslaLogo,
        'fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew f'));
    list.add(Car(
        'Virage',
        'Aston Martin',
        ThemeAssets.astonMartin,
        ThemeAssets.astonMartinLogo,
        'fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew f'));
    return list;
  }
}
