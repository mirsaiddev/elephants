import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constant/constants.dart';
import 'ui/elephants_main_pahe/elephants_main_page.dart';
import 'view_model/elephant_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ElephantViewModel>(
          create: (context) => ElephantViewModel()..fetchElephant(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Constants.primaryColor,
      ),
      home: ElephantsMainPage(),
    );
  }
}
