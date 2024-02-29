import 'package:http/http.dart' as http;
import 'package:carshow/car_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Future<List<Car>> getDataCars() async {
  var response = await http.get(Uri.parse('http://78.157.51.226:5000/cars'));
  var cars = carFromJson(response.body);
  print(cars);
  return cars;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.dark,
        cardColor: Color(0XFF252939),
        scaffoldBackgroundColor: Color(0XFF1C202C),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cars List',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getDataCars(),
          builder: (context, snapshot) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 16 / 14,
              ),
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                var car = snapshot.data?[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CarDetail(
                            car: car,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'http://78.157.51.226:81/static/0${car!.id!}.jpg',
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '   ${car.brand} ${car.model}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('   ${car.year}'),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
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
        title: Text(
          car.brand!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset('images/01.jpg'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${car.brand} ${car.model}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('${car.year}'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
