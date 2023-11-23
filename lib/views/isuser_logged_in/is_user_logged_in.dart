import 'package:flutter/material.dart';
import 'package:ntpc/views/home_screen.dart';
import 'package:provider/provider.dart';
import '../../auth/login.dart';
import '../../controller/all_in_provider.dart';
import '../../spalsh.dart';

class IsUserLoggedInOrNot extends StatefulWidget {
  const IsUserLoggedInOrNot({super.key});

  @override
  State<IsUserLoggedInOrNot> createState() => _IsUserLoggedInOrNotState();
}

class _IsUserLoggedInOrNotState extends State<IsUserLoggedInOrNot> {
  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of<AllInProvider>(context, listen: false);
    return FutureBuilder(
      future: provider.isUserLogedIn(context),
      builder: (contect, authResult) {
        if (authResult.connectionState == ConnectionState.waiting) {
          return SpalshScreenMain();
        } else {
          if (authResult.data == true) {
            return HomeScreen();
          }
          return const LoginScreen();
        }
      },
    );
  }
}
