import 'package:flutter/material.dart';

import '../../constant/constants.dart';
import '../../data/models/elephant.dart';

Expanded buildTopPage(Elephant _elephant, BuildContext context) {
  print(_elephant.affiliation);
  return Expanded(
    child: Container(
      decoration: BoxDecoration(color: Constants.primaryColor),
      padding: EdgeInsets.all(36),
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSpace(90),
          _buildBackIcon(context),
          _buildCircleImage(_elephant.image),
          _buildSpace(15),
          _buildName(_elephant.name),
          _buildSpace(15),
          _buildAffiliation(_elephant.affiliation),
        ],
      ),
    ),
  );
}

SizedBox _buildSpace(double value) {
  return SizedBox(height: value);
}

IconButton _buildBackIcon(var context) {
  return IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}

Center _buildCircleImage(String _url) {
  return Center(
    child: CircleAvatar(
      backgroundImage: NetworkImage(_url),
      radius: 50,
    ),
  );
}

Center _buildName(String name) {
  return Center(
    child: Text(
      name,
      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
    ),
  );
}

Center _buildAffiliation(String text) {
  return Center(
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}
