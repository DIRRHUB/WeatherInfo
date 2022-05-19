import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_info/models/place_model.dart';
import 'package:weather_info/widgets/city_menu_widget.dart';
import 'package:weather_info/widgets/home_widget.dart';

import 'models/main_model.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainModel>(
          create: (context) => MainModel(),
        ),
        ChangeNotifierProvider<PlaceModel>(
          create: (context) => PlaceModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Weather Info',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: const CityMenuWidget(),
        initialRoute: '/',
        routes: {
          '/home': (context) => const HomeWidget(),
          '/city_menu': (context) => const CityMenuWidget(),
        },
      ),
    );
  }
}
