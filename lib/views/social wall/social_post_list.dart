import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:provider/provider.dart';
import '../../theme/common_theme.dart';
import '../commonheader/common_header.dart';

class SocialPostListScreen extends StatelessWidget {
  SocialPostListScreen({super.key});

  final List socialPostData = [
    {
      "id": 3,
      "title": "asdfdsf",
      "description": "sdfdsf",
      "post_image": "1671517632.jpg",
      "user_id": null,
      "Totallikes": 1,
      "TotalDislikes": 1,
      "comments": null,
      "status": 1,
      "created_at":
          "https://graphicsfamily.com/wp-content/uploads/edd/2021/01/Free-Social-Media-Post-Design-for-Cosmetics-Business-Digital-Marketing-scaled.jpg",
      "updated_at": "2022-12-21 10:52:36"
    },
    {
      "id": 4,
      "title": "khkhkjh",
      "description": "iutyutyut",
      "post_image": "1671599995.png",
      "user_id": null,
      "Totallikes": null,
      "TotalDislikes": null,
      "comments": null,
      "status": 1,
      "created_at": "2022-12-21 10:49:55",
      "updated_at": "2022-12-21 10:49:55"
    }
  ];

  Future referesh(context) async {
    AllInProvider provider = Provider.of(context, listen: false);

    provider.getAllSocialPost(context, false);
  }

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);

    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Social Wall", "View"),
      body: RefreshIndicator(
        onRefresh: () async {
          await referesh(context);
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 0,
                ),
                child: Text(
                  '  Social Wall',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<AllInProvider>(
                builder: ((context, value, child) => ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: provider.socialWallData.length,
                      itemBuilder: ((context, index) => Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      provider.socialWallData[index]['title'],
                                      style: TextStyle(
                                        color: CommonTheme.headerCommonColor,
                                      ),
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(provider.socialWallData[index]
                                        ['description']),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    provider.getAllComment(
                                        context,
                                        provider.socialWallData[index]
                                            ['post_id'],
                                        provider.socialWallData[index],
                                        true);
                                  },
                                  child: Image.network(
                                    "${provider.socialBaseUrl}${provider.socialWallData[index]['post_image']}",
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromARGB(
                                              255, 200, 199, 199),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Map requestData = {
                                                    'Like_DisLike': '1',
                                                    'post_id':
                                                        provider.socialWallData[
                                                            index]['post_id'],
                                                    'user_id': provider.userId
                                                  };
                                                  provider.likeSocialWallPost(
                                                      context,
                                                      requestData,
                                                      provider.socialWallData
                                                          .indexOf(provider
                                                                  .socialWallData[
                                                              index]));
                                                },
                                                child: Icon(
                                                  Icons.thumb_up,
                                                  color:
                                                      provider.socialWallData[
                                                                      index]
                                                                  ['like'] ==
                                                              1
                                                          ? Colors.red
                                                          : Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(provider
                                                  .socialWallData[index]
                                                      ['Totallikes']
                                                  .toString()),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                color: Colors.black45,
                                                height: 20,
                                                width: 2,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Map requestData = {
                                                    'Like_DisLike': '2',
                                                    'post_id':
                                                        provider.socialWallData[
                                                            index]['post_id'],
                                                    'user_id': provider.userId
                                                  };
                                                  provider.dislikeSocialWallPost(
                                                      context,
                                                      requestData,
                                                      provider.socialWallData
                                                          .indexOf(provider
                                                                  .socialWallData[
                                                              index]));
                                                },
                                                child: Icon(
                                                  Icons.thumb_down,
                                                  color:
                                                      provider.socialWallData[
                                                                      index]
                                                                  ['deslike'] ==
                                                              1
                                                          ? Colors.red
                                                          : Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                provider.socialWallData[index]
                                                        ['TotalDislikes']
                                                    .toString(),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          provider.getAllComment(
                                              context,
                                              provider.socialWallData[index]
                                                  ['post_id'],
                                              provider.socialWallData[index],
                                              true);
                                        },
                                        child: Row(
                                          children: [
                                            Icon(Icons.comment),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(provider.socialWallData[index]
                                                    ['TotalComments']
                                                .toString()),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
