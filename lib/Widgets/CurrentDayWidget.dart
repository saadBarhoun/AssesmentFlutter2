import 'package:assesmentflutter2/Models/Weather.dart';
import 'package:assesmentflutter2/Providers/TemperatureType.dart';
import 'package:assesmentflutter2/Widgets/LocationWidget.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class CurrentDayWidget extends StatefulWidget {
  Weather? weatherData;
  CurrentDayWidget({this.weatherData});

  @override
  State<CurrentDayWidget> createState() => _CurrentDayWidgetState();
}

class _CurrentDayWidgetState extends State<CurrentDayWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: widget.weatherData == null
            ? Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment:
                children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ])
            : SingleChildScrollView(
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            placeholder: (BuildContext context, String url) =>
                                Container(),
                            errorWidget:
                                (BuildContext context, String url, error) =>
                                    const SizedBox(),
                            imageUrl:
                                widget.weatherData?.current?.condition?.icon ??
                                    "",
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Daily",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Consumer<TemperatureType>(
                          builder: (ctx, temp, _) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                              child: Text(
                                temp.isCel
                                    ? "${widget.weatherData?.current?.tempC.toString() ?? ""} C"
                                    : "${widget.weatherData?.current?.tempF.toString() ?? ""} F",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () {
                                temp.toggleTemp();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 200,
                          child: LocationInfoWidget(
                              location: widget.weatherData?.location),
                          decoration: BoxDecoration(),
                        )
                      ]),
                ),
              ),
      ),
    );
  }
}
