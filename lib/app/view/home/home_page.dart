import 'package:flutter/material.dart';
import 'package:flutter_financy_app/app/common/constants/routes.dart';
import 'package:flutter_financy_app/app/services/secure_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const secureStorage = SecureStorage();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Nova tela'),
            ElevatedButton(
              onPressed: () {
                secureStorage.deleteOne(key: "CURRENT_USER").then(
                      (_) => Navigator.popAndPushNamed(
                        context,
                        NamedRoute.initial,
                      ),
                    );
              },
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
