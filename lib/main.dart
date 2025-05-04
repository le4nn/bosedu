import 'package:bosedu/pages/event/event.dart';
import 'package:bosedu/pages/event/event_detail_page.dart';
import 'package:bosedu/pages/event/event_registration_page.dart';
import 'package:bosedu/pages/event/registration_complete_page.dart';
import 'package:bosedu/pages/payment/payment_confirmation_page.dart';
import 'package:bosedu/pages/news/home_page.dart';
import 'package:bosedu/pages/payment/payment_method_page.dart';
import 'package:bosedu/pages/transaction/transaction_history_page.dart';
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
        '/transaction_history': (context) => TransactionHistoryPage(),
        '/events': (context) => EventsPage(),
        '/eventDetail': (context) => EventDetailPage(),
        '/eventRegistration': (context) => EventRegistrationPage(),
        '/paymentConfirmation': (context) => PaymentConfirmationPage(),
        '/paymentMethod': (context) => PaymentMethodPage(),
        '/payNow': (context) => RegistrationCompletePage(),
      },
    );
  }
}
