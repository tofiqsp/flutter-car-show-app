import 'dart:convert';

import 'package:carshow/car_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        cardColor: Color(0XFF252939),
        scaffoldBackgroundColor: Color(0XFF1C202C),
      ),
      home: CarShow(),
    );
  }
}

Future<List<Car>> getData() async {
  await Future.delayed(Duration(seconds: 2));
  var response = await http.get(Uri.parse('http://78.157.51.226:5000/cars'));
  List<Car> carsFake = carFromJson(response.body);
  // List<Car> carsFake = carFromJson(json.encode(cars));
  return carsFake;
}

class CarShow extends StatelessWidget {
  const CarShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars List'),
        centerTitle: true,
        backgroundColor: Theme.of(context).cardColor,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 16 / 14,
              ),
              padding: EdgeInsets.all(16),
              itemBuilder: (BuildContext context, int index) {
                var car = snapshot.data?[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarDetail(car: car!),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: '${car?.id}${car?.image}',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                car?.image ?? '',
                                scale: 0.5,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '  ${car?.brand} ${car?.model}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '  ${car?.year}',
                            style: TextStyle(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class CarDetail extends StatelessWidget {
  const CarDetail({
    super.key,
    required this.car,
  });

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.brand ?? ''),
        centerTitle: true,
        backgroundColor: Theme.of(context).cardColor,
      ),
      body: Column(
        children: [
          Hero(
            tag: '${car.id}${car.image}',
            child: Image.asset(
              car.image!,
              scale: 0.3,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${car.brand!} ${car.model!}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  car.year!,
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
