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
    brand: 'BMW',
    model: 'SCX',
    year: '2022',
    image: 'images/0.jpg',
  ),
  Car(
    id: 2,
    brand: 'Benz',
    model: 'Acura',
    year: '2021',
    image: 'images/1.jpg',
  ),
  Car(
    id: 3,
    brand: 'Ford',
    model: 'Integra',
    year: '2020',
    image: 'images/2.jpg',
  ),
  Car(
    id: 4,
    brand: 'Dodge',
    model: 'MDX',
    year: '2023',
    image: 'images/3.jpg',
  ),
  Car(
    id: 5,
    brand: 'Audi',
    model: 'A3',
    year: '2023',
    image: 'images/4.jpg',
  ),
  Car(
    id: 6,
    brand: 'Ford',
    model: 'e-tron',
    year: '2022',
    image: 'images/5.jpg',
  ),
  Car(
    id: 7,
    brand: 'GMC',
    model: 'Q5',
    year: '2020',
    image: 'images/0.jpg',
  ),
  Car(
    id: 8,
    brand: 'Honda',
    model: 'GT',
    year: '2021',
    image: 'images/1.jpg',
  ),
  Car(
    id: 9,
    brand: 'Chrysler',
    model: '4-Series',
    year: '2023',
    image: 'images/2.jpg',
  ),
  Car(
    id: 10,
    brand: 'Chevrolet',
    model: 'X2',
    year: '2022',
    image: 'images/3.jpg',
  ),
  Car(
    id: 11,
    brand: 'Volvo',
    model: 'i4',
    year: '2021',
    image: 'images/4.jpg',
  ),
  Car(
    id: 12,
    brand: 'Toyota',
    model: 'Encore',
    year: '2023',
    image: 'images/5.jpg',
  ),
];
