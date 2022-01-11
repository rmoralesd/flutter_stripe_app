import 'package:flutter/material.dart';
import 'package:flutter_stripe_app/pages/home_page.dart';
import 'package:flutter_stripe_app/pages/pago_completo_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'home',
      initialRoute: 'pago_completo',
      routes: {
        'home': (_) => const HomePage(),
        'pago_completo': (_) => const PagoCompletoPage(),
      },
      theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xff284879),
          scaffoldBackgroundColor: const Color(0xff21232A)),
    );
  }
}
