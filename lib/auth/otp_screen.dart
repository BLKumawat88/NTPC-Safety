import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ntpc/common_theme/common_dialog.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:ntpc/theme/common_theme.dart';
import 'package:ntpc/theme/pin_box.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final Map data;
  const OtpScreen({super.key, required this.data});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int selectedIndex = 0;
  String code = '';

  addDigit(int digit, context) async {
    AllInProvider provider = Provider.of(context, listen: false);
    if (code.length > 3) {
      return;
    }
    setState(() {
      code = code + digit.toString();
      selectedIndex = code.length;
    });

    if (code.length == 4) {
      if (code == provider.opt) {
        final _storage = const FlutterSecureStorage();
        final userDataLocal = json.encode(widget.data);
        await _storage.write(key: 'isuser_login', value: userDataLocal);

        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home_screen',
          (route) => false,
        );
      } else {
        CommanDialog.showErrorDialog(context, description: "OTP did not match");
      }
    } else {}
  }

  backspace() {
    if (code.isEmpty) {
      return;
    }
    setState(() {
      code = code.substring(0, code.length - 1);
      selectedIndex = code.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Image.asset(
                          'assets/images/logo.png.png',
                          width: 120,
                          color: CommonTheme.headerCommonColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          'Enter OTP',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Please enter  OTP to proceed',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DigitHolder(
                              width: width,
                              selectedIndex: selectedIndex,
                              index: 0,
                              code: code,
                            ),
                            DigitHolder(
                              width: width,
                              selectedIndex: selectedIndex,
                              index: 1,
                              code: code,
                            ),
                            DigitHolder(
                              width: width,
                              selectedIndex: selectedIndex,
                              index: 2,
                              code: code,
                            ),
                            DigitHolder(
                              width: width,
                              selectedIndex: selectedIndex,
                              index: 3,
                              code: code,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                addDigit(1, context);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent,
                              ),
                              child: Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                addDigit(2, context);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent,
                              ),
                              child: Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                addDigit(3, context);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent,
                              ),
                              child: Text(
                                '3',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                addDigit(4, context);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent,
                              ),
                              child: Text(
                                '4',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                addDigit(5, context);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent,
                              ),
                              child: Text(
                                '5',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                addDigit(6, context);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent,
                              ),
                              child: Text(
                                '6',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                addDigit(7, context);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent,
                              ),
                              child: Text(
                                '7',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                addDigit(8, context);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent,
                              ),
                              child: Text(
                                '8',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                addDigit(9, context);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent,
                              ),
                              child: Text(
                                '9',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                addDigit(0, context);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent,
                              ),
                              child: Text(
                                '0',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                backspace();
                              },
                              child: Icon(
                                Icons.backspace_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
