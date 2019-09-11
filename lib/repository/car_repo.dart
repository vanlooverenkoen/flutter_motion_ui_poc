import 'package:flutter_transitions/model/car.dart';
import 'package:flutter_transitions/util/assets.dart';

class CarRepo {
  List<Car> getCars() {
    final list = List<Car>();
    list.add(
      Car('i8', 'BMW', 'Sporty', ThemeAssets.bmw, ThemeAssets.bmwLogo,
          'fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew f'),
    );
    list.add(
      Car('Model X', 'Tesla', 'Elon', ThemeAssets.tesla, ThemeAssets.teslaLogo,
          'fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew f'),
    );
    list.add(
      Car(
          'Virage',
          'Bond, James Bond',
          'Aston Martin',
          ThemeAssets.astonMartin,
          ThemeAssets.astonMartinLogo,
          'fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew fasdfj iweqyfr ewf ioqh rfioqew f'),
    );
    return list;
  }
}
