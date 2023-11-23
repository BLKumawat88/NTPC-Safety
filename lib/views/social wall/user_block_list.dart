import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:provider/provider.dart';

import '../commonheader/common_header.dart';

class UserBlockList extends StatelessWidget {
  const UserBlockList({super.key});

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
        appBar: CommonHeaderClass.commonAppBarHeader(
            "सचेतन", context, "Other user profile", "View"),
        body: Consumer<AllInProvider>(
          builder: (context, value, child) {
            return ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                ...provider.userBlockList
                    .map(
                      (e) => Card(
                        child: ListTile(
                          leading: e['photo'] != null
                              ? CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      "${provider.userBlockListFilePath}/${e['photo']}"))
                              : Text(
                                  "Image",
                                ),
                          title: Text("${e['blocked_person_name']}"),
                          trailing: ElevatedButton(
                            onPressed: () {
                              provider.activeUser(
                                  context, e['blocked_user_id']);
                            },
                            child: Text("Unblock"),
                          ),
                        ),
                      ),
                    )
                    .toList()
              ],
            );
          },
        ));
  }
}
