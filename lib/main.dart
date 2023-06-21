import 'package:assesmentflutter2/Providers/TemperatureType.dart';
import 'package:assesmentflutter2/Screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TemperatureType>(
            create: (_) => TemperatureType(isCel: true)),
        // ChangeNotifierProvider<NFTListModel>(
        //     create: (_) => NFTListModel(id: "", name: "")),
        // ChangeNotifierProvider<CommentModel>(
        // create: (_) => CommentModel(widgetId: "", id: "", comment: "")),
      ],
      child: MaterialApp(
        home: MainScren(),
        routes: {
          MainScren.routeName: (context) => MainScren(),
        },
      ),
    );
  }
}
