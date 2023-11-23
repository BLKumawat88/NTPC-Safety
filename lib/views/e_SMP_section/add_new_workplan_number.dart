import 'package:flutter/material.dart';
import 'package:ntpc/common_theme/common_dialog.dart';
import 'package:provider/provider.dart';
import '../../controller/all_in_provider.dart';
import '../commonheader/common_header.dart';

class AddNewWorkPlanNumber extends StatefulWidget {
  const AddNewWorkPlanNumber({super.key});

  @override
  State<AddNewWorkPlanNumber> createState() => _AddNewWorkPlanNumberState();
}

class _AddNewWorkPlanNumberState extends State<AddNewWorkPlanNumber> {
  String workPlanID = "";
  String workPlanSubId = "";
  TextEditingController workPalnNumber = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    AllInProvider provider = Provider.of(context, listen: false);
    provider.workPlanMechanismSubList.clear();
  }

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
        "Add New WorkPlan NUmber",
        context,
        "Add New WorkPlan NUmber",
        "View",
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          Text(
            "Select Mechanism",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    underline: SizedBox(),
                    value: workPlanID,
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down_rounded,
                        color: Colors.black),
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Select Mechanism',
                        ),
                        value: '',
                      ),
                      ...provider.workPlanMechanismList
                          .map<DropdownMenuItem<String>>(
                        (e) {
                          return DropdownMenuItem(
                            child: Text(
                              e['mechanism'],
                            ),
                            value: e['mechanism'],
                          );
                        },
                      ).toList(),
                    ],
                    onChanged: (value) {
                      setState(() {
                        workPlanID = value!;
                        workPlanSubId = "";
                        Map requestData = {
                          'location': provider.location_id,
                          'mechanism': workPlanID
                        };
                        provider.getworkPlanMechanismSubList(
                            context, requestData);
                        print("Selected workplan id $requestData");
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Consumer<AllInProvider>(
            builder: (context, value, child) =>
                provider.workPlanMechanismSubList.isEmpty
                    ? SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Control",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 40,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  margin: EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: DropdownButton<String>(
                                    underline: SizedBox(),
                                    value: workPlanSubId,
                                    isExpanded: true,
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.black),
                                    items: [
                                      DropdownMenuItem(
                                        child: Text(
                                          'Select Control',
                                        ),
                                        value: '',
                                      ),
                                      ...provider.workPlanMechanismSubList
                                          .map<DropdownMenuItem<String>>(
                                        (e) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              e['control'],
                                            ),
                                            value: e['id'].toString(),
                                          );
                                        },
                                      ).toList(),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        workPlanSubId = value!;
                                      });
                                      print("control id $workPlanSubId");
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
          ),

          Consumer<AllInProvider>(
            builder: (context, value, child) => workPlanSubId == ""
                ? SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Enter Work Plan Number",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 48,
                        child: TextFormField(
                          controller: workPalnNumber,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (workPalnNumber.text == "") {
                              CommanDialog.showErrorDialog(context,
                                  description: "Please Enter work paln number");
                              return;
                            }
                            Map requestData = {
                              'id': workPlanSubId,
                              'work_plan_number': workPalnNumber.text
                            };
                            provider.addNewWorkPalnNumber(context, requestData);
                            print("Req $requestData");
                          },
                          child: Text("   SUBMIT   "),
                        ),
                      )
                    ],
                  ),
          ),

          //add new textfield here Enter work plan number
        ]),
      ),
    );
  }
}
