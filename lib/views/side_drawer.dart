import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:ntpc/theme/common_theme.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatefulWidget {
  SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  String defaultValue = '';

  final List dropdownItems = [
    {'id': '1', 'item': 'Link'},
    {'id': '2', 'item': 'Link'},
    {'id': '3', 'item': 'Link'},
  ];

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Container(
      color: CommonTheme.headerCommonColor,
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/logo.png.png',
                  width: MediaQuery.of(context).size.width / 2.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Divider(
                  color: Colors.white,
                ),
              ),

              ListTile(
                onTap: () {
                  Navigator.pop(
                    context,
                  );

                  String lng = context.locale.toString();
                  if (lng == "hi_IN") {
                    context.setLocale(Locale("en", "US"));
                  } else {
                    context.setLocale(Locale("hi", "IN"));
                  }
                },
                title: Text(
                  '🌎 Language',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: provider.iPadSize ? 20 : 14,
                  ),
                ),
                trailing: Text(
                  context.locale.toString() == "hi_IN" ? "English" : "Hindi",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: provider.iPadSize ? 20 : 14,
                  ),
                ),
              ),
              ListTile(
                onTap: () async {
                  provider.blockList(context, true);
                },
                title: Text(
                  ' Blocked User List',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: provider.iPadSize ? 20 : 14,
                  ),
                ),
              ),
              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.pushNamed(context, '/index_screen');
              //   },
              //   title: Text(
              //     'Index',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.pushNamed(context, '/form_maintenance');
              //   },
              //   title: Text(
              //     'Form Maintenance',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.pushNamed(context, '/Explosive_weekly_check_list');
              //   },
              //   title: Text(
              //     'Explosive Weekly Check List',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.pushNamed(context, '/Explosive_daily_check_list');
              //   },
              //   title: Text(
              //     'Explosive Daily Check List',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              // ListTile(
              //   onTap: () {
              //     // Navigator.pop(context);
              //     provider.getCheckList(context);
              //   },
              //   title: Text(
              //     'Daily Check List',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.pushNamed(context, '/excavator_form');
              //   },
              //   title: Text(
              //     'Excavator Form',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.pushNamed(context, '/mine_shift_end_report');
              //   },
              //   title: Text(
              //     'Shift Report Mines End',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: provider.iPadSize ? 20 : 14,
              //     ),
              //   ),
              // ),
              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.pushNamed(context, '/shift_report_banadag_siding');
              //   },
              //   title: Text(
              //     'Shift Report Banadag Siding',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: provider.iPadSize ? 20 : 14,
              //     ),
              //   ),
              // ),
              ListTile(
                onTap: () async {
                  final _storage = const FlutterSecureStorage();
                  Navigator.pop(context);
                  await _storage.delete(key: 'isuser_login');
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                },
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: provider.iPadSize ? 20 : 14,
                  ),
                ),
              ),

              ListTile(
                onTap: () async {},
                title: Text(
                  ' Buid Version :  5',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: provider.iPadSize ? 20 : 14,
                  ),
                ),
              ),

              // ListTile(
              //   onTap: () {
              //     Navigator.pushNamed(context, '/form_maintenance');
              //   },
              //   leading: Icon(
              //     Icons.book,
              //     color: Colors.white,
              //   ),
              //   title: Text(
              //     'Daily Maintenance',
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios_rounded,
              //     color: Colors.white,
              //     size: 15,
              //   ),
              // ),
              // DropdownButton<String>(
              //   value: defaultValue,
              //   isExpanded: true,
              //   items: [
              //     DropdownMenuItem(
              //       child: Text(
              //         'Dropdown',
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       value: '',
              //     ),
              //     ...dropdownItems.map<DropdownMenuItem<String>>((e) {
              //       return DropdownMenuItem(
              //         child: Text(
              //           e['item'],
              //         ),
              //         value: e['id'],
              //       );
              //     }).toList(),
              //   ],
              //   onChanged: (value) {
              //     setState(() {
              //       defaultValue = value!;
              //     });
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
