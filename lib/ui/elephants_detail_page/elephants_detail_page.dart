import 'package:flutter/material.dart';

import '../../data/models/elephant.dart';
import 'build_bottom_page.dart';
import 'build_top_page.dart';

class ElephantsDetailPage extends StatefulWidget {
  final Elephant elephant;

  const ElephantsDetailPage({Key key, @required this.elephant}) : super(key: key);
  @override
  _ElephantsDetailPageState createState() => _ElephantsDetailPageState();
}

class _ElephantsDetailPageState extends State<ElephantsDetailPage> {
  @override
  Widget build(BuildContext context) {
    Elephant _elephant = widget.elephant;
    return Scaffold(
      body: Container(
        child: _buildPage(_elephant),
      ),
    );
  }

  Column _buildPage(Elephant _elephant) {
    return Column(
      children: [
        buildTopPage(_elephant, context),
        buildBottomPage(_elephant, context),
      ],
    );
  }
}
