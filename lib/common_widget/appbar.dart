import 'package:flutter/material.dart';

AppBar commonAppBar(String title, {Color color}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(color: Colors.white ?? Colors.black),
    ),
    backgroundColor: color ?? Colors.white,
    centerTitle: true,
    elevation: 0,
  );
}
