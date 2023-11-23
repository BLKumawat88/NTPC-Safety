import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:provider/provider.dart';
import '../../theme/common_theme.dart';

class CommonHeaderClass {
  BuildContext context;
  final String accessScreenTitle;
  final String pageActionName;
  CommonHeaderClass({
    required this.context,
    required this.accessScreenTitle,
    required this.pageActionName,
  }) {
    AllInProvider provider = Provider.of(context, listen: false);

    provider.updateUserAccessLog(accessScreenTitle, pageActionName);
  }

  static AppBar commonAppBarHeader(
    String title,
    context,
    accessScreenTitle,
    pageActionName,
  ) {
    AllInProvider provider = Provider.of(context, listen: false);
    if (accessScreenTitle != "Quiz") {
      provider.updateUserAccessLog(accessScreenTitle, pageActionName);
    }

    return AppBar(
      elevation: 0,
      backgroundColor: CommonTheme.headerCommonColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/logo.png.png',
            width: 50,
          ),
          Expanded(
            child: Text(
              "$title",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Image.asset(
                    'assets/images/kavach.png',
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
