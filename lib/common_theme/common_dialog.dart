import 'package:flutter/material.dart';
import 'package:ntpc/theme/common_theme.dart';

class CommanDialog {
  static showLoading(context, {String title = 'Loading...'}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularProgressIndicator.adaptive(
                backgroundColor: CommonTheme.buttonBackgrooundCommonColor,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      },
    );
  }

  static refereshScreen(context, {String title = 'Loading...'}) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: CommonTheme.buttonBackgrooundCommonColor,
          ),
        );
      },
    );
  }

  static hideLoading(context) {
    Navigator.pop(context);
  }

  static showErrorDialog(
    context, {
    String title = "Oops Error",
    String description = "Something went wrong ",
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Container(
            height: 100,
            child: Column(children: [
              Text(description),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ]),
          ),
        );
      },
    );
  }
}
