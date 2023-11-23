import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/all_in_provider.dart';
import '../spalsh.dart';
import 'isuser_logged_in/is_user_logged_in.dart';

class JailbrokenScreen extends StatelessWidget {
  const JailbrokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of<AllInProvider>(context, listen: false);
    return FutureBuilder(
      future: provider.initPlatformState(),
      builder: (contect, authResult) {
        if (authResult.connectionState == ConnectionState.waiting) {
          return SpalshScreenMain();
        } else {
          if (authResult.data == true) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "App cannot run on jail broken device ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    exit(0);
                                  },
                                  child: Text("   Okay   "))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }

          return IsUserLoggedInOrNot();
        }
      },
    );
  }
}
