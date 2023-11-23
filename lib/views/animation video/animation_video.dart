import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:provider/provider.dart';
import '../../theme/common_theme.dart';
import '../commonheader/common_header.dart';

class AnimationVideoScreen extends StatelessWidget {
  const AnimationVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of<AllInProvider>(context, listen: false);
    return Scaffold(
        appBar: CommonHeaderClass.commonAppBarHeader(
            "सचेतन", context, "CMHQ production dispatch form", "View"),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Animation Videos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: provider.animationVideoListData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: CommonTheme.headerCommonColor,
                          width: 2.0,
                        ),
                      ),
                      child: ListTile(
                        onTap: () {
                          print(provider.videoBaseUrl);
                          print(provider.animationVideoListData[index]
                              ['animation_video']);

                          provider.playVideo(
                              "${provider.videoBaseUrl}/${provider.animationVideoListData[index]['animation_video']}");
                        },
                        title: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            provider.animationVideoListData[index]['title'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "By : ${provider.animationVideoListData[index]['uploaded_by']} - ${provider.animationVideoListData[index]['plant_name']}",
                            ),
                          ],
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Icon(
                            Icons.play_circle_fill_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
