import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject2/src/app.dart';
import 'package:providerproject2/src/provider/home_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: ((context) => HomeProvider()))],
    child: const MyApp(),
  ));
}
