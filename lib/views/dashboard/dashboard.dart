import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ntpc/controller/all_in_provider.dart';

import 'package:ntpc/theme/common_theme.dart';
import 'package:ntpc/views/webview/web_view.dart';
import 'package:provider/provider.dart';

import '../viewpdf/pdf_viewer.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  File? selectedImage;
  Future<void> chooseImage(context, type) async {
    AllInProvider provider = Provider.of(context, listen: false);
    Navigator.pop(context);
    // ignore: prefer_typing_uninitialized_variables
    var image;
    if (type == "camera") {
      image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 10);
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 25);
    }
    if (image != null) {
      selectedImage = File(image.path);

      provider.editProfile(context, selectedImage!.path);

      // won't have any error now
    }
  }

  getFileExtension(String fileName) {
    try {
      return "." + fileName.split('.').last;
    } catch (e) {
      return "null";
    }
  }

  void bottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
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
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  color: CommonTheme.headerCommonColor,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            chooseImage(context, "camera");
                          },
                          child: Text("Image From Camera",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  color: CommonTheme.headerCommonColor,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            chooseImage(context, "Gallery");
                          },
                          child: Text("Image From Gallery",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    provider.isDeviceInfo();
    provider.updateUserAccessLog("Dashboard", "view");
    return Scaffold(
      backgroundColor: CommonTheme.headerCommonColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png.png',
              width: 50,
              color: CommonTheme.headerCommonColor,
            ),
            Expanded(
              child: Text(
                "सचेतन",
                style: TextStyle(
                  color: Colors.green,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                bottom: 20,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 50),
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 10,
                      bottom: 10,
                    ),
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                      left: 20,
                      right: 20,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        Consumer<AllInProvider>(
                            builder: ((context, value, child) => Center(
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Container(
                                          width: provider.iPadSize ? 100 : 80,
                                          height: provider.iPadSize ? 100 : 80,
                                          child: ClipOval(
                                              child: Image.network(
                                            provider.userImage,
                                            fit: BoxFit.cover,
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return const Text(
                                                'Image Not Found😢',
                                              );
                                            },
                                          )),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: InkWell(
                                          onTap: () {
                                            bottomSheet(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(Icons.edit),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    provider.username,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: provider.iPadSize
                                        ? TextStyle(
                                            color: Color(0xFF5039C1),
                                            fontSize: provider.textFontSize,
                                          )
                                        : TextStyle(
                                            color: Color(0xFF5039C1),
                                          ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    provider.userEmail,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: provider.iPadSize
                                        ? TextStyle(
                                            color: Color(0xFF5039C1),
                                            fontSize: provider.textFontSize,
                                          )
                                        : TextStyle(
                                            color: Color(0xFF5039C1),
                                          ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    provider.location_name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: provider.iPadSize
                                        ? TextStyle(
                                            color: Color(0xFF5039C1),
                                            fontSize: provider.textFontSize,
                                          )
                                        : TextStyle(
                                            color: Color(0xFF5039C1),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: Color(0xFF5039C1),
                    child: GridView.builder(
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,
                      // itemCount: dashboardModel.length,
                      itemCount: provider.dashBoardCategoryListData.length,

                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (provider.dashBoardCategoryListData[index]
                                    ['sub_category_status'] ==
                                1) {
                              provider.updateUserAccessLog(
                                  "${provider.dashBoardCategoryListData[index]['category_title']}",
                                  "View");

                              provider.getDashBoardSubCategoryList(
                                  context,
                                  provider.dashBoardCategoryListData[index]
                                      ['id'],
                                  provider.dashBoardCategoryListData[index]
                                      ['category_title']);
                            } else {
                              provider.updateUserAccessLog(
                                  "${provider.dashBoardCategoryListData[index]['category_title']}",
                                  "View");
                              String ex = getFileExtension(provider
                                  .dashBoardCategoryListData[index]['uploads']);

                              String url = provider.pdfPath +
                                  provider.dashBoardCategoryListData[index]
                                      ['uploads'];
                              print("URL $url");
                              if (ex != ".pdf") {
                                print(ex);
                                provider.commonMethodForNTPCSafetyOpenPDF(url);
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PDFViewerScreen(
                                      pdfUrl: url,
                                      pdfName: provider
                                              .dashBoardCategoryListData[index]
                                          ['uploads'],
                                    ),
                                  ),
                                );
                              }

                              // OLD WAY

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => WebViewExample(
                              //       urlOfPDF:
                              //           "${provider.pdfPath}${provider.dashBoardCategoryListData[index]['uploads']}",
                              //     ),
                              //   ),
                              // );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Image.asset(
                                //   dashboardModel[index].image,
                                //   width: 30,
                                //   color: Color(0xFF5039C1),
                                // ),

                                Image.network(
                                  "${provider.iconPath}${provider.dashBoardCategoryListData[index]['category_icon']}",
                                  width: provider.iPadSize
                                      ? provider.imageSize
                                      : 30,
                                  color: Color(0xFF5039C1),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Text(
                                    // dashboardModel[index].text,
                                    "${provider.dashBoardCategoryListData[index]['category_title']}",
                                    style: provider.iPadSize
                                        ? TextStyle(
                                            color: Color(0xFF5039C1),
                                            fontSize: provider.textFontSize,
                                          )
                                        : TextStyle(
                                            color: Color(0xFF5039C1),
                                          ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
