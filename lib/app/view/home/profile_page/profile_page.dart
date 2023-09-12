import 'package:flutter/material.dart';
import 'package:flutter_financy_app/app/locator.dart';
import 'package:flutter_financy_app/app/services/auth_service.dart';
import 'package:flutter_financy_app/app/services/secure_storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Profile"),
            TextButton(
              onPressed: () async {
                await locator.get<AuthService>().signOut();
                await const SecureStorage().deleteAll();
                if (mounted) {
                  return Navigator.popUntil(context, ModalRoute.withName('/'));
                }
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
