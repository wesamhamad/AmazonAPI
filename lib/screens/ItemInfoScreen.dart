import 'package:flutter/material.dart';
import 'package:flutter_application_1/items.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemInfoScreen extends StatelessWidget {
  final Items item;

  ItemInfoScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: kAppBar(true),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 350,
                child: Stack(
                  children: [
                    const Center(
                      child: SpinKitFadingCircle(
                        color: Colors.grey,
                        size: 50.0,
                      ),
                    ),
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: item.imgURL,
                      height: 350,
                      fadeInDuration: const Duration(microseconds: 3000),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                item.productName,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                item.id,
                style: const TextStyle(fontSize: 17.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                item.price,
                style: const TextStyle(fontSize: 17.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                item.date,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
