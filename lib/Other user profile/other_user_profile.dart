import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:ntpc/theme/common_theme.dart';
import 'package:provider/provider.dart';
import '../common_theme/common_dialog.dart';
import '../views/commonheader/common_header.dart';

class OtherUserProfileScreen extends StatefulWidget {
  const OtherUserProfileScreen({super.key});

  @override
  State<OtherUserProfileScreen> createState() => _OtherUserProfileScreenState();
}

class _OtherUserProfileScreenState extends State<OtherUserProfileScreen> {
  TextEditingController reportTxt = TextEditingController();
  void reportUser(postid, commentuserid) {
    reportTxt.text = "";
    AllInProvider provider = Provider.of(context, listen: false);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: reportTxt,
                    toolbarOptions: ToolbarOptions(
                      copy: false,
                      cut: false,
                      paste: false,
                      selectAll: false,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFFA1A1A1),
                        ),
                      ),
                      hintText: 'Enter Reason',
                      hintStyle: TextStyle(
                        color: Color(0xFFA1A1A1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      if (reportTxt.text == "") {
                        CommanDialog.showErrorDialog(context,
                            description: "Please Enter Reason");
                      } else {
                        Map<String, String> userReportData = {
                          'user_id': "${provider.userId}",
                          'post_id': '$postid',
                          'comment_user_id': '$commentuserid',
                          'comment': '${reportTxt.text}',
                          'report_summary': '${reportTxt.text}',
                        };
                        provider.reportUser(userReportData, context);
                        print("User report data $userReportData");
                      }
                    },
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  showAlertDialog(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.pop(context);
        provider.blockUser(context, "${provider.otherUserData[0]['id']}");
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you sure ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    late NavigatorState _navigator;
    AllInProvider provider = Provider.of(context, listen: false);
    print("AVV ${provider.socialBaseUrl}${provider.otherUserData[0]['photo']}");
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Other user profile", "View"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              width: provider.iPadSize ? 200 : 150,
              height: provider.iPadSize ? 200 : 150,
              child: ClipOval(
                child: Image.network(
                  "${provider.otherUserImagePath}/${provider.otherUserData[0]['photo']}",
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Text(
                      'Image Not Found😢',
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${provider.otherUserData[0]['name']}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${provider.otherUserData[0]['designation']}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${provider.otherUserData[0]['email']}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              provider.otherUserData[0]['id'].toString() ==
                      provider.userId.toString()
                  ? SizedBox()
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      CommonTheme.headerCommonColor,
                                ),
                                onPressed: () {
                                  showAlertDialog(context);
                                },
                                child: Text("Block User"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                onPressed: () {
                                  reportUser(
                                      provider.commentDataToReportUserFromProfile[
                                          'post_id'],
                                      provider.commentDataToReportUserFromProfile[
                                          'userId']);
                                },
                                child: Text("Report User"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
            ],
          )
        ],
      ),
    );
  }
}
