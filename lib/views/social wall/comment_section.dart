import 'package:flutter/material.dart';
import 'package:ntpc/common_theme/common_dialog.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:provider/provider.dart';
import '../../theme/common_theme.dart';
import '../commonheader/common_header.dart';

class CommentSectionScreen extends StatefulWidget {
  const CommentSectionScreen({super.key});

  @override
  State<CommentSectionScreen> createState() => _CommentSectionScreenState();
}

class _CommentSectionScreenState extends State<CommentSectionScreen> {
  TextEditingController message = TextEditingController();

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

  image(imageurl) {
    print("Url $imageurl");
    return imageurl;
  }

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Social Wall Post Details", "View"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        provider.singlePost['title'],
                        style: TextStyle(
                          color: CommonTheme.headerCommonColor,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(provider.singlePost['description']),
                    ),
                  ),
                  Image.network(
                    "${provider.socialBaseUrl}${provider.singlePost['post_image']}",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: formKey,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      child: TextFormField(
                        controller: message,
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
                          hintText: 'Write your comment',
                          hintStyle: TextStyle(
                            color: Color(0xFFA1A1A1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (message.text.isNotEmpty) {
                        Map requestData = {
                          'comment': message.text,
                          'post_id': provider.singlePostID,
                          'user_id': provider.userId
                        };
                        provider.addCommentOnPost(context, requestData);
                        message.text = "";
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Consumer<AllInProvider>(builder: ((context, value, child) {
              return Column(
                children: [
                  ...provider.socialPostCommentList.map(
                    (pData) => Padding(
                      padding: const EdgeInsets.all(0),
                      child: Card(
                        child: ListTile(
                          // leading: Text(
                          //   image(
                          //       "${pData['userImagePath']}/${pData['user_image']}"),
                          // ),

                          leading: pData['user_image'] == null
                              ? Text("Not found")
                              : InkWell(
                                  onTap: () {
                                    print(" ${pData['userId']}");
                                    provider.getOtehrUserProfile(
                                        pData['userId'], context, pData);
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage(
                                      "${pData['userImagePath']}/${pData['user_image']}",
                                    ),
                                  ),
                                ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(pData['username'].toString()),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                pData['comment'] == null
                                    ? "0"
                                    : pData['comment'].toString(),
                              ),
                            ],
                          ),
                          trailing: pData['userId'].toString() ==
                                  provider.userId.toString()
                              ? SizedBox()
                              : InkWell(
                                  onTap: () {
                                    reportUser(
                                        pData['post_id'], pData['userId']);
                                  },
                                  child: Text(
                                    "Report",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  )

                  //   Row(
                  //     children: [
                  //       ,
                  //       Flexible(
                  //         child: Container(
                  //             padding: EdgeInsets.all(10),
                  //             margin: EdgeInsets.only(
                  //               top: 20,
                  //               left: 10,
                  //               right: 10,
                  //             ),
                  //             decoration: BoxDecoration(
                  //                 border: Border.all(
                  //                     color:
                  //                         Color(0xFF8D69E3).withAlpha(20)),
                  //                 color: Color(0xFFefefef),
                  //                 borderRadius: BorderRadius.circular(2)),
                  //             child:
                  //              ,
                  //       ),

                  //       // e['chat'] != 1 ? Text(e['time']) : SizedBox(),
                  //     ],
                  //   ),
                  // )
                  // .toList(),
                ],
              );
            })),
          ]),
        ),
      ),
    );
  }
}
