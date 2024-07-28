import 'package:flutter/material.dart';
import 'package:flutter_application_1/items.dart';
import 'package:flutter_application_1/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'ItemsScreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  NetworkHelper networkHelper = NetworkHelper();

  Future<List<Items>> extractData() async {
    List<Items> items = [];
    var data = await networkHelper.extractData();
    List results = data['results'];

    for (var element in results) {
      String imgURL = element['image_urls'][0];
      String date = element['created_at'].split(' ')[0];
      String price = element['price'];
      String id = element['uid'];
      String productName = element['name'];

      items.add(Items(imgURL, price, productName, date, id));
    }
    // print("imgURL: $imgURL");
    return items;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var itemsData = await extractData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Itemsscreen(itemsData: itemsData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitRing(
          color: Color(0xFF6300f1),
          size: 50.0,
        ),
      ),
    );
  }
}
