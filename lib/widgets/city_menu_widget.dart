import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_info/domain/entities/location_object.dart';
import 'package:weather_info/models/city_menu_controller.dart';
import 'package:weather_info/models/place_model.dart';
import 'package:weather_info/resources/colors.dart';
import 'package:weather_info/widgets/custom_behavior.dart';
import '../models/main_model.dart';

class CityMenuWidget extends StatefulWidget {
  const CityMenuWidget({Key? key}) : super(key: key);

  @override
  State<CityMenuWidget> createState() => _CityMenuWidgetState();
}

class _CityMenuWidgetState extends State<CityMenuWidget> {
  final CityMenuController controller = CityMenuController();

  void nextScreen() {
    if (context.read<MainModel>().appForecast == null) {
      controller.loadForecast(context);
    } else {
      Navigator.of(context).pushNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLightColor,
        title: context.watch<MainModel>().location?.name == null
            ? const Text("Select place")
            : Text(context.watch<MainModel>().titleLocationString ?? ""),
        actions: [
          IconButton(
              onPressed: () => controller.getGeolocation(context),
              icon: const Icon(Icons.location_pin)),
          IconButton(onPressed: nextScreen, icon: const Icon(Icons.check)),
        ],
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 16),
              HeadContent(),
              SizedBox(height: 8),
              ListCityMenuWidget(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class ListCityMenuWidget extends StatefulWidget {
  const ListCityMenuWidget({Key? key}) : super(key: key);

  @override
  State<ListCityMenuWidget> createState() => _ListCityMenuWidgetState();
}

class _ListCityMenuWidgetState extends State<ListCityMenuWidget> {
  List<LocationObject> cities = [];
  final CityMenuController controller = CityMenuController();

  @override
  void didChangeDependencies() {
    cities = context.watch<PlaceModel>().places;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.primaryDarkColor,
          ),
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryLightColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ScrollConfiguration(
            behavior: CustomBehavior(),
            child: ListView.builder(
              itemCount: cities.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: InkWell(
                    onTap: () => controller.setLocation(index, context),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.primaryDarkColor,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.primaryLightColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          cities[index].fullLocationString ?? "",
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.primaryTextColor),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class HeadContent extends StatefulWidget {
  const HeadContent({Key? key}) : super(key: key);

  @override
  State<HeadContent> createState() => _HeadContentState();
}

class _HeadContentState extends State<HeadContent> {
  final CityMenuController controller = CityMenuController();
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.primaryDarkColor,
        ),
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryLightColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: textController,
                style: const TextStyle(
                    fontSize: 16, color: AppColors.primaryTextColor),
                decoration: const InputDecoration(
                    label: Text("Type the location"),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16)),
                      borderSide: BorderSide(
                          width: 1, color: AppColors.primaryDarkColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16)),
                      borderSide: BorderSide(
                          width: 1, color: AppColors.primaryDarkColor),
                    ),
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: AppColors.primaryTextColor),
                    contentPadding: EdgeInsets.all(16)),
              ),
            ),
            const SizedBox(width: 4),
            SizedBox(
              height: 52,
              child: OutlinedButton(
                onPressed: () => controller.trySearch(
                    textController.text.toString(), context),
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                  ),
                  side: const BorderSide(
                      width: 1.0,
                      color: AppColors.primaryDarkColor,
                      style: BorderStyle.solid),
                ),
                child: const Text(
                  "Search",
                  style: TextStyle(color: AppColors.primaryTextColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
