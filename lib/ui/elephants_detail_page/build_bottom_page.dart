import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';

import '../../constant/constants.dart';
import '../../data/models/elephant.dart';

Expanded buildBottomPage(Elephant _elephant, BuildContext context) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: Constants.primaryAccentColor,
      ),
      padding: EdgeInsets.all(36),
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoCard("Date of Birthday", "${_elephant.dob}"),
          _buildInfoCard("Date of Death", "${_elephant.dod}"),
          _buildInfoCard("Sex", "${_elephant.sex}"),
          _buildInfoCard("Species", "${_elephant.species}"),
          _buildInfoCard("Fictional", "${_elephant.fictional}"),
          _buildInfoText(),
          _buildInfo(_elephant.note),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Center(
              child: LinkText(
                text: _elephant.wikilink,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Padding _buildInfoCard(String infoName, String value) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$infoName :", style: TextStyle(color: Constants.primaryColor, fontWeight: FontWeight.w700, fontSize: 22)),
        Text("$value", style: TextStyle(color: Colors.white, fontSize: 22)),
      ],
    ),
  );
}

Padding _buildInfoText() {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Center(
      child: Text("Information :", style: TextStyle(color: Constants.primaryColor, fontWeight: FontWeight.w700, fontSize: 24)),
    ),
  );
}

Padding _buildInfo(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Center(
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
    ),
  );
}
