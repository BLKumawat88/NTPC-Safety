import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:ntpc/theme/common_theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AllInProvider provider;
  final formKey = GlobalKey<FormState>();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _password = true;

  Future<void> _launchUrl(_url) async {
    try {
      final Uri urlTwitter = Uri.parse(_url);

      await launchUrl(
        urlTwitter,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {}
  }

  RegExp emails = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/logo.png.png',
                      width: MediaQuery.of(context).size.width / 3,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "सचेतन",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 42,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.asset(
                        'assets/images/kavach.png',
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: mobile,
                        maxLength: 10,
                        toolbarOptions: ToolbarOptions(
                          copy: false,
                          cut: false,
                          paste: false,
                          selectAll: false,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Mobile Number',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile numer';
                          }
                          return null;
                        },
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "By Clicking Login , I agree that",
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(Icons.arrow_right_alt),
                            Text("I have read and accepted the"),
                            InkWell(
                              onTap: () {
                                _launchUrl(
                                    "https://coalmining.ntpc.co.in/user-policy");
                              },
                              child: Text(
                                " Terms of Use",
                                style: TextStyle(
                                  color:
                                      CommonTheme.buttonBackgrooundCommonColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.arrow_right_alt),
                            Text("See Our"),
                            InkWell(
                              onTap: () {
                                _launchUrl(
                                    "https://coalmining.ntpc.co.in/privacy-policy");
                              },
                              child: Text(
                                " Privacy Policy",
                                style: TextStyle(
                                  color:
                                      CommonTheme.buttonBackgrooundCommonColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Map<String, String> loginData = {
                              'mobile_number': mobile.text,
                              'password': password.text,
                            };
                            provider.login(
                              loginData,
                              context,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              CommonTheme.buttonBackgrooundCommonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
