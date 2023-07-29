// ignore: file_names
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        DetailScreen.nameRoute: (context) => const DetailScreen(),
      },
      title: 'Navigation',
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  List<station> stations = [
    station(1, 'tu lanh', 'publish', true, 'demo'),
    station(2, 'dien thoai', 'private', false, 'flash'),
    station(3, 'may giat', 'private', false, 'demo'),
    station(4, 'laptop', 'publish', true, 'demo'),
    station(5, 'ban phim', 'publish', true, 'demo'),
    station(6, 'chuot', 'private', false, 'demo'),
    station(7, 'tap', 'private', false, 'demo'),
    station(8, 'sach', 'publish', true, 'demo'),
    station(9, 'but chi', 'publish', true, 'demo'),
    station(10, 'may quat', 'private', false, 'demo'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: GridView.count(
        childAspectRatio: 1.5,
        crossAxisCount: 2,
        children: stations.map((item) {
          return StationItem(item: (item));
        }).toList(),
      ),
    );
  }
}

class StationItem extends StatelessWidget {
  const StationItem({Key? key, required this.item}) : super(key: key);
  final station item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('okei ${item.name}');
        Navigator.pushNamed(context, DetailScreen.nameRoute, arguments: item);
      },
      splashColor: Colors.red,
      child: Card(
        child: Container(
          color: item.status ? Colors.green : Colors.purple,
          alignment: Alignment.center,
          child: Text(item.name,
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  static const nameRoute = '/Detail';

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as station;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(item.type == 'publish' ? Icons.public : Icons.lock),
              onPressed: () {}),
        ],
        backgroundColor: item.status ? Colors.green : Colors.purple,
        title: Text(item.name),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${item.names}',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class station {
  int id;
  String name;
  String type;
  bool status;
  String names;

  station(this.id, this.name, this.type, this.status, this.names);
}
