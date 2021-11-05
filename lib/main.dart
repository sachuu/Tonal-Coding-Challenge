import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:metricwidget/screens/homepage.dart';
import 'package:metricwidget/models/bubble_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BubbleModelOne("Upper body", 0, "lbs")),
        ChangeNotifierProvider(create: (context) => BubbleModelTwo("Upper body", 0, "lbs")),
        ChangeNotifierProvider(create: (context) => BubbleModelThree("Upper body", 0, "lbs"))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // Root of application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConsumerWidget(),
    );
  }
}
