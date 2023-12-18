import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

TextStyle mTextStyle22() {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: 22,
    color: Colors.white,
  );
}

TextStyle mTextStyle17() {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: 17,
    color: Colors.white,
  );
}

AppBar appBar(String name) {
  return AppBar(
    backgroundColor: Colors.black,
    title: Text(
      name,
      style: mTextStyle17(),
    ),
  );
}

MyContainer(FaIcon image, VoidCallback? onTap) {
  return
    InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.all(6),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(55),
      ),
      child: Center(child: image),
    ),
  );
}

MyContainerImage(FaIcon image, VoidCallback? onTap) {
  return
    Container(
      margin: EdgeInsets.all(6),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: image,
        ),
      ),
    );
}