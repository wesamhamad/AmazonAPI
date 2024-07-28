import 'package:flutter/material.dart';

PreferredSizeWidget kAppBar(bool show) {
  return AppBar(
    title: const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'AmazonSample',
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    ),
    backgroundColor: const Color(0xFF6300f1),
    elevation: 4.0,
    automaticallyImplyLeading: show,
  );
}
