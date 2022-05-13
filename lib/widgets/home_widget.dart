import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:weather_info/domain/api_clients/dio_client.dart';
import 'package:weather_info/domain/entities/app_forecast.dart';
import 'package:weather_info/models/main_model.dart';
import 'package:weather_info/resources/colors.dart';
import 'package:weather_info/resources/images.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    DioClient client = DioClient(); //!
    return Scaffold(
      body: FutureBuilder(
          future: client.getInfo("ZHYTOMYR"),
          builder:
              (BuildContext context, AsyncSnapshot<AppForecast?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(strokeWidth: 3));
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                context.watch<MainModel>().setInfo(snapshot.data);
                return Container(
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
                  child: ScrollConfiguration(
                    behavior: CustomBehavior(),
                    child: ListView(
                      children: const [
                        SizedBox(height: 32),
                        HeadContent(),
                        SizedBox(height: 32),
                        RowHorizontalValues(),
                        SizedBox(height: 32),
                        ColumnValues(),
                        SizedBox(height: 32),
                      ],
                    ),
                  ),
                );
              }
            }
            //choose location
            return Center(child: Text(snapshot.error.toString()));
          }),
    );
  }
}

class HeadContent extends StatelessWidget {
  const HeadContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          child: Text(
            context.watch<MainModel>().location?.name ?? "",
            style: const TextStyle(
              fontSize: 48,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          context.watch<MainModel>().current?.currentTemp.toString() ?? "",
          style: const TextStyle(fontSize: 80),
        ),
        Text(
          context.watch<MainModel>().getTodayStateForecast ?? "",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          context.watch<MainModel>().getTodayMinMaxTemperature ?? "",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
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
      child: SizedBox(
        width: double.infinity,
        height: 180,
        child: ScrollConfiguration(
          behavior: CustomBehavior(),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: context.watch<MainModel>().todayHoursInfo?.length,
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
                  child: HourValues(index),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HourValues extends StatelessWidget {
  final int index;
  const HourValues(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        Text(
          context.watch<MainModel>().todayHoursInfo![index].hour,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
        const Expanded(child: Divider()),
        Text(
          "Temp\n" + context.watch<MainModel>().todayHoursInfo![index].temp,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Expanded(child: Divider()),
        Text(
          "Wind\n" + context.watch<MainModel>().todayHoursInfo![index].wind,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Expanded(child: Divider()),
        Image(
          image: context.watch<MainModel>().todayHoursInfo![index].imageCode,
        ),
        const SizedBox(height: 8),
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
          children: const [
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

class CustomBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
