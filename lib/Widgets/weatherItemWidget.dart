import 'package:assesmentflutter2/Models/Weather.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WeatherItemWidget extends StatelessWidget {
  Forecastday? forcastItem;
  WeatherItemWidget({this.forcastItem});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        child: CachedNetworkImage(
          placeholder: (BuildContext context, String url) => Container(),
          errorWidget: (BuildContext context, String url, error) =>
              const SizedBox(),
          imageUrl: forcastItem?.day?.condition?.icon ?? "",
        ),
      ),
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("sunrise: ${forcastItem?.astro?.sunrise}",
            style: TextStyle(fontSize: 18)),
        Text('sunset: ${forcastItem?.astro?.sunset}',
            style: TextStyle(fontSize: 14)),
      ]),
    );
  }
}
