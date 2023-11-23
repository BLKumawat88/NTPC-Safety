import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/all_in_provider.dart';
import '../commonheader/common_header.dart';

class ESMPDashboard extends StatelessWidget {
  const ESMPDashboard({super.key});

  void commonMethodForNTPCSafetyOpenPDF(_url) async {
    try {
      final Uri urlTwitter = Uri.parse(_url);

      await launchUrl(
        urlTwitter,
        mode: LaunchMode.inAppWebView,
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "eSMP", "View"),
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
                'NTPC eSMP',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              children: [
                InkWell(
                  onTap: () {
                    provider.getESMPData(
                        context, "list_of_hazard_category", "hazard");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    margin: EdgeInsets.only(right: 5, bottom: 10),
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8E00),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "List of Hazards",
                        textAlign: TextAlign.center,
                        style: provider.iPadSize
                            ? TextStyle(
                                color: Colors.white,
                                fontSize: provider.textFontSize,
                              )
                            : TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    provider.getESMPData(
                        context, "list_of_hazard_sub_category", "subhazard");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    margin: EdgeInsets.only(right: 5, bottom: 10),
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8E00),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "List of Sub Hazards ",
                        textAlign: TextAlign.center,
                        style: provider.iPadSize
                            ? TextStyle(
                                color: Colors.white,
                                fontSize: provider.textFontSize,
                              )
                            : TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    provider.getMyHazardsData(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    margin: EdgeInsets.only(right: 5, bottom: 10),
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8E00),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Work plan actions pending with me",
                        textAlign: TextAlign.center,
                        style: provider.iPadSize
                            ? TextStyle(
                                color: Colors.white,
                                fontSize: provider.textFontSize,
                              )
                            : TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),

                //add new ui list of principle

                InkWell(
                  onTap: () {
                    provider.getESMPData(context, "list_of_principle_hazards",
                        "principlehazard");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    margin: EdgeInsets.only(right: 5, bottom: 10),
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8E00),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "List of Principle Hazards ",
                        textAlign: TextAlign.center,
                        style: provider.iPadSize
                            ? TextStyle(
                                color: Colors.white,
                                fontSize: provider.textFontSize,
                              )
                            : TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                //List_of_hazard_ControlPlans

                provider.userRoleId == "4"
                    ? InkWell(
                        onTap: () {
                          provider.gethazadrdview(context);
                          // provider.getisshazardsOrSubhazardsss(
                          //  context, "List_of_hazard_ControlPlans",false);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          margin: EdgeInsets.only(right: 5, bottom: 10),
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF8E00),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Add New Action To Work Plan ",
                              textAlign: TextAlign.center,
                              style: provider.iPadSize
                                  ? TextStyle(
                                      color: Colors.white,
                                      fontSize: provider.textFontSize,
                                    )
                                  : TextStyle(
                                      color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                provider.userRoleId == "4"
                    ? InkWell(
                        onTap: () {
                          provider.getworkPlanMechanism(context);
                          // provider.getisshazardsOrSubhazardsss(
                          //  context, "List_of_hazard_ControlPlans",false);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          margin: EdgeInsets.only(right: 5, bottom: 10),
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF8E00),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Add New WorkPlan Number",
                              textAlign: TextAlign.center,
                              style: provider.iPadSize
                                  ? TextStyle(
                                      color: Colors.white,
                                      fontSize: provider.textFontSize,
                                    )
                                  : TextStyle(
                                      color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
