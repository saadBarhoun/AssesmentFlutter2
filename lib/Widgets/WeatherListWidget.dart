import 'package:assesmentflutter2/Models/Weather.dart';
import 'package:assesmentflutter2/Widgets/weatherItemWidget.dart';
import 'package:flutter/material.dart';

class WeatherListWidget extends StatefulWidget {
  Weather? item;
  WeatherListWidget({this.item});

  @override
  State<WeatherListWidget> createState() => _WeatherListWidgetState();
}

class _WeatherListWidgetState extends State<WeatherListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: ListView.builder(
          itemCount: widget.item?.forecast?.forecastday?.length ?? 0,
          itemBuilder: ((context, index) {
            return WeatherItemWidget(
                forcastItem: widget.item?.forecast?.forecastday?[index]);
          })),
    );
  }
}
