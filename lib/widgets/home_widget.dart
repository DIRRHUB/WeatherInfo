// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_info/resources/colors.dart';
import 'package:weather_info/resources/images.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(height: 32),
            HeadWidget(),
            SizedBox(height: 32),
            RowHorizontalValues(),
            SizedBox(height: 32),
            ColumnValues(),
          ],
        ),
      ),
    );
  }
}

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Location", style: TextStyle(fontSize: 48)),
        SizedBox(height: 16),
        Text("100", style: TextStyle(fontSize: 80)),
        Text(
          "STATE",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "TEMP_MAX, TEMP_MIN",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class RowMainValues extends StatelessWidget {
  const RowMainValues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 48,
          width: 96,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.primaryDarkColor,
            ),
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primaryLightColor,
          ),
          child: const Center(
            child: Text(
              "TEMP",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.primaryDarkColor,
            ),
            borderRadius: BorderRadius.circular(32),
            color: AppColors.primaryLightColor,
          ),
          child: const Center(
            child: Image(image: AppImages.day112),
          ),
        ),
        Container(
          height: 48,
          width: 96,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.primaryDarkColor,
            ),
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primaryLightColor,
          ),
          child: const Center(
            child: Text(
              "WIND",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RowHorizontalValues extends StatelessWidget {
  const RowHorizontalValues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 160,
        color: AppColors.primaryColor,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.primaryDarkColor,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.primaryLightColor,
                ),
                child: const HourValues(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class HourValues extends StatelessWidget {
  const HourValues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(height: 8),
        Text(
          "HH",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
        Expanded(child: Divider()),
        Text(
          "TEMP",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(child: Divider()),
        Text(
          "WIND",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(child: Divider()),
        Image(
          image: AppImages.day113,
        ),
        SizedBox(height: 8),
      ],
    );
  }
}

class ColumnValues extends StatelessWidget {
  const ColumnValues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.primaryDarkColor,
          ),
          borderRadius: BorderRadius.circular(16),
          color: AppColors.primaryLightColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DayValues(),
            DayValues(),
            DayValues(),
            DayValues(),
            DayValues(),
            DayValues(),
            DayValues(),
          ],
        ),
      ),
    );
  }
}

class DayValues extends StatelessWidget {
  const DayValues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 32,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.primaryDarkColor,
          ),
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primaryLightColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: const [
              Image(
                image: AppImages.day299,
              ),
              VerticalDividerWidget(),
              Text(
                "DD",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              VerticalDividerWidget(),
              Text(
                "TEMP",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              VerticalDividerWidget(),
              Text(
                "WIND",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 16,
        width: 1,
        color: Colors.grey,
      ),
    );
  }
}
