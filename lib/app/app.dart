import 'package:flutter/material.dart';
import 'package:flutter_financy_app/app/view/authentication/sign_up/sign_up_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Financy App',
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}
