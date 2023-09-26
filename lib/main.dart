import 'package:flutter/material.dart';
import 'package:rutuja/pages/choose_location.dart';
import 'package:rutuja/pages/home.dart';
import 'package:rutuja/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/chooselocation': (context) => ChooseLocation(),
  },
));