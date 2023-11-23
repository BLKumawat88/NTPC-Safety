import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:ntpc/model/home_screen_model.dart';
import 'package:ntpc/theme/common_theme.dart';
import 'package:ntpc/views/side_drawer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<HomeScreenModelData> homeScreen = [
    HomeScreenModelData('dashboard'.tr(), 'assets/images/dashboard.png'),
    HomeScreenModelData('ntpc_safety'.tr(), 'assets/images/feedback.png'),
    HomeScreenModelData('digital_library'.tr(), 'assets/images/digitallib.png'),
    HomeScreenModelData('incident_reporting'.tr(), 'assets/images/hazards.png'),
    HomeScreenModelData('eSMP'.tr(), 'assets/images/esmp.png'),
    HomeScreenModelData('check_lists'.tr(), 'assets/images/clipboard.png'),
    HomeScreenModelData('event_calendar'.tr(), 'assets/images/calendar.png'),
    HomeScreenModelData('social_wall'.tr(), 'assets/images/network.png'),
    HomeScreenModelData('notifications'.tr(), 'assets/images/notification.png'),
    HomeScreenModelData('safety_quiz'.tr(), 'assets/images/feedback.png'),
    HomeScreenModelData(
        'administrator_module'.tr(), 'assets/images/adminmodule.png'),
    HomeScreenModelData('animation_video'.tr(), 'assets/images/feedback.png'),
  ];
  // List<HomeScreenModelData> homeScreen = [
  //   HomeScreenModelData('dashboard'.tr(), 'assets/images/dashboard.png'),
  //   HomeScreenModelData('NTPC Safety', 'assets/images/feedback.png'),
  //   HomeScreenModelData('Digital library', 'assets/images/digitallib.png'),
  //   HomeScreenModelData('Incident Reporting', 'assets/images/hazards.png'),
  //   HomeScreenModelData('eSMP', 'assets/images/esmp.png'),
  //   HomeScreenModelData('Check Lists', 'assets/images/clipboard.png'),
  //   HomeScreenModelData('Event Calendar', 'assets/images/calendar.png'),
  //   HomeScreenModelData('Social Wall', 'assets/images/network.png'),
  //   HomeScreenModelData('Notifications', 'assets/images/notification.png'),
  //   HomeScreenModelData(
  //       'VTC feedback test & Safety Quiz', 'assets/images/feedback.png'),
  //   HomeScreenModelData('Admin Module', 'assets/images/adminmodule.png'),
  // ];

  Future<void> _launchUrl(_url) async {
    try {
      final Uri urlTwitter = Uri.parse(_url);

      await launchUrl(
        urlTwitter,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {}
  }

  late AllInProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AllInProvider>(context, listen: false);
    provider.isDeviceInfo();
    provider.getUserDeviceInfo();
    return Scaffold(
      backgroundColor: CommonTheme.headerCommonColor,
      drawer: SideDrawer(),
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
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: 30,
                top: 30,
              ),
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
                      top: 10,
                      bottom: 10,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFF5039C1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GridView.builder(
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,
                      itemCount: homeScreen.length,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 8,
                        childAspectRatio: (600 / 650),
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              if (index == 0) {
                                provider.getDashBoardCategoryList(
                                    context,
                                    context.locale.toString() == "hi_IN"
                                        ? "hi"
                                        : "en");
                              }
                              if (index == 2) {
                                provider.category(context);
                              }
                              if (index == 3) {
                                provider.getUnsafeLocationList(context, true);
                              }
                              if (index == 4) {
                                Navigator.pushNamed(context, '/esmp_dashboard');
                                // provider.getUserInfo();
                              }
                              if (index == 5) {
                                provider.getTalaipalliFormsList(context);
                              }
                              if (index == 6) {
                                provider.getAllEvent(context);
                              }
                              if (index == 1) {
                                Navigator.pushNamed(context, '/safety_list');
                              }
                              if (index == 8) {
                                provider.getNotificationsForDozerDaily(context);
                              }
                              if (index == 9) {
                                provider.getQuizCategoryList(context);
                              }
                              if (index == 10) {
                                _launchUrl('https://coalmining.ntpc.co.in/');
                              }
                              if (index == 7) {
                                provider.getAllSocialPost(context, true);
                              }
                              if (index == 11) {
                                provider.getAnimationVideoList(context);
                              }
                            },
                            child: Consumer<AllInProvider>(
                              builder: ((context, value, child) => Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          homeScreen[index].image,
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
                                            textAlign: TextAlign.center,
                                            homeScreen[index].title,
                                            style: provider.iPadSize
                                                ? TextStyle(
                                                    color: Color(0xFF5039C1),
                                                    fontSize:
                                                        provider.textFontSize,
                                                  )
                                                : TextStyle(
                                                    color: Color(0xFF5039C1),
                                                  ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ));
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
