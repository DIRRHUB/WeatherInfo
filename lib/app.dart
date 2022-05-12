import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_info/widgets/home_widget.dart';

import 'models/main_model.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (context) => MainModel(),
      child: MaterialApp(
        title: 'Weather Info',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: const HomeWidget(),
      ),
    );
  }
}
