import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weatherforecasts/root.dart';
import 'package:weatherforecasts/whether%20model/newmodel.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Weatherprovider())],
    child: const Myapp(),
  ));
}
