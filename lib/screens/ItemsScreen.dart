import 'package:flutter/material.dart';
import 'package:flutter_application_1/items.dart';
import 'package:flutter_application_1/screens/ItemInfoScreen.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:transparent_image/transparent_image.dart';

class Itemsscreen extends StatelessWidget {
  final List<Items> itemsData;

  Itemsscreen({required this.itemsData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: kAppBar(false),
        body: Center(
          child: ListView.builder(
            itemCount: itemsData.length,
            itemBuilder: (context, index) {
              final item = itemsData[index];

              return Column(
                children: [
                  ListTile(
                    leading: Container(
                      height: 590,
                      width: 100, // Adjust the width as per your requirement
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
                            // Adjust the width as per your requirement
                            fit: BoxFit.fill,
                            fadeInDuration: const Duration(milliseconds: 500),
                            height: 490,
                            width: 87,
                          ),
                        ],
                      ),
                    ),
                    title: Text(item.productName),
                    subtitle: Text('${item.price}\n${item.date}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemInfoScreen(item: item),
                        ),
                      );
                    },
                  ),

                  const Divider(), // Adds a line below each ListTile
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
