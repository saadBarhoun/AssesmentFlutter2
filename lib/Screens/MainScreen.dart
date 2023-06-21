import 'package:assesmentflutter2/API/APIService.dart';
import 'package:assesmentflutter2/Models/Weather.dart';
import 'package:assesmentflutter2/Widgets/CurrentDayWidget.dart';
import 'package:assesmentflutter2/Widgets/WeatherListWidget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MainScren extends StatefulWidget {
  const MainScren({super.key});
  static const routeName = '/MainScreen';

  @override
  State<MainScren> createState() => _MainScrenState();
}

class _MainScrenState extends State<MainScren>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final dataManagement = APIService();
  Weather? wetaher;
  Weather? wetaherList;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:
          dataManagement.getCurrentWeather().then((value) => {
                setState(
                  () {
                    if (value != null) {
                      wetaher = value;
                    }
                  },
                )
              });
          break;
        case 1:
          dataManagement.getWeatherList().then((value) => {
                setState(
                  () {
                    if (value != null) {
                      wetaherList = value;
                    }
                  },
                )
              });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(
            text: "Daily",
          ),
          Tab(text: "upcoming 2 weeks")
        ]),
      ),
      body: TabBarView(
          dragStartBehavior: DragStartBehavior.start,
          controller: _tabController,
          children: [
            CurrentDayWidget(
              weatherData: wetaher,
            ),
            WeatherListWidget(
              item: wetaherList,
            )
          ]),
    );
  }
}
