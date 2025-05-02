import 'package:bosedu/pages/event/event.dart';
import 'package:bosedu/pages/event/event_detail_page.dart';
import 'package:bosedu/pages/event/event_registration_page.dart';
import 'package:bosedu/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/events': (context) => EventsPage(),
        '/eventDetail': (context) => EventDetailPage(),
        '/eventRegistration': (context) => EventRegistrationPage(),
      },
    );
  }
}
