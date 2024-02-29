import 'dart:convert';

List<Car> carFromJson(String str) =>
    List<Car>.from(json.decode(str).map((x) => Car.fromJson(x)));

String carToJson(List<Car> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Car {
  Car({
    this.id,
    this.brand,
    this.model,
    this.year,
    this.image,
  });

  int? id;
  String? brand;
  String? model;
  String? year;
  String? image;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["id"],
        brand: json["brand"],
        model: json["model"],
        year: json["year"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "model": model,
        "year": year,
        "image": image,
      };
}

List<Car> cars = [
  Car(
    id: 1,
    brand: 'Pride',
    model: '111',
    year: '1390',
    image: 'images/01.jpg',
  ),
  Car(
    id: 2,
    brand: 'Pride',
    model: '111',
    year: '1390',
    image: 'images/02.jpg',
  ),
  Car(
    id: 3,
    brand: 'Pride',
    model: '111',
    year: '1390',
    image: 'images/03.jpg',
  ),
  Car(
    id: 4,
    brand: 'Pride',
    model: '111',
    year: '1390',
    image: 'images/04.jpg',
  ),
  Car(
    id: 5,
    brand: 'Pride',
    model: '111',
    year: '1390',
    image: 'images/05.jpg',
  ),
  Car(
    id: 6,
    brand: 'Pride',
    model: '111',
    year: '1390',
    image: 'images/06.jpg',
  ),
  Car(
    id: 7,
    brand: 'Pride',
    model: '111',
    year: '1390',
    image: 'images/01.jpg',
  ),
  Car(
    id: 8,
    brand: 'Pride',
    model: '111',
    year: '1390',
    image: 'images/02.jpg',
  ),
  Car(
    id: 9,
    brand: 'Pride',
    model: '111',
    year: '1390',
    image: 'images/03.jpg',
  ),
  Car(
    id: 10,
    brand: 'Pride',
    model: '111',
    year: '1390',
    image: 'images/04.jpg',
  ),
  Car(
    id: 11,
    brand: 'Pride',
    model: '111',
    year: '1390',
    image: 'images/05.jpg',
  ),
  Car(
    id: 12,
    brand: 'Pride',
    model: '111',
    year: '1390',
    image: 'images/06.jpg',
  ),
];
