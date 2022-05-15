import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weather_info/resources/colors.dart';

class ErrorLoadingWidget extends StatelessWidget {
  const ErrorLoadingWidget({Key? key}) : super(key: key);

  void checkConnection(context) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Navigator.of(context).pushNamed('/home');
      }
    } on SocketException catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryLightColor,
            AppColors.primaryDarkColor,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Error loading",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            const Text(
              "Check Internet connection",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: 140,
              child: OutlinedButton(
                onPressed: () => checkConnection(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.refresh),
                    SizedBox(width: 5),
                    Text("Try update"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
