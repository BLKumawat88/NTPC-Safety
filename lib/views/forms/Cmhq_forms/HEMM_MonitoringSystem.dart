import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/all_in_provider.dart';
import '../../commonheader/common_header.dart';

class Hemmsytemfrom extends StatefulWidget {
  const Hemmsytemfrom({super.key});
  @override
  State<Hemmsytemfrom> createState() => _HemmsytemfromState();
}

class _HemmsytemfromState extends State<Hemmsytemfrom> {
  final _formKey = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();
  String? selectedDateForBackendDeveloper;
  final timeController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController s_no_A = TextEditingController();
  TextEditingController equipment_number_B = TextEditingController();
  TextEditingController equipment_description_C = TextEditingController();
  TextEditingController capacity_D = TextEditingController();
  TextEditingController category_E = TextEditingController();
  TextEditingController no_of_days_F = TextEditingController();
  TextEditingController total_hrs_H = TextEditingController();
  TextEditingController running_hrs_I = TextEditingController();
  TextEditingController maint_hrs_J = TextEditingController();
  TextEditingController b_d_hrs_K = TextEditingController();
  TextEditingController available_hrs_L = TextEditingController();
  TextEditingController Availability_M = TextEditingController();
  TextEditingController Utilization_N = TextEditingController();
  TextEditingController OEE_O = TextEditingController();
  TextEditingController onefive = TextEditingController();
  TextEditingController onesix = TextEditingController();
  TextEditingController oneseven = TextEditingController();
  TextEditingController oneeight = TextEditingController();
  TextEditingController onenine = TextEditingController();
  TextEditingController oneten = TextEditingController();
  TextEditingController twoone = TextEditingController();
  TextEditingController twotwo = TextEditingController();
  TextEditingController twothree = TextEditingController();
  TextEditingController twofoure = TextEditingController();
  TextEditingController twofive = TextEditingController();

  @override
  void initState() {
    dateinput.text = "";

    super.initState();
  }

  @override
  String vehicleIdDefaultId = "";
  String totalHours = "";

  String availableHoursDummyToGetAvalibality = "";
  String returnAvailableHours() {
    availableHoursDummyToGetAvalibality =
        "${int.parse(totalHours == "" ? "0" : totalHours) - (int.parse(maint_hrs_J.text == "" ? "0" : maint_hrs_J.text) + int.parse(b_d_hrs_K.text == "" ? "0" : b_d_hrs_K.text))}";
    return " ${int.parse(totalHours == "" ? "0" : totalHours) - (int.parse(maint_hrs_J.text == "" ? "0" : maint_hrs_J.text) + int.parse(b_d_hrs_K.text == "" ? "0" : b_d_hrs_K.text))}";
  }

  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "CopyOf_HEMM_MonitoringSystem_CmhqRecord", "View"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(elevation: 5),
                          onPressed: () {},
                          child: Text('FORM'),
                        )),
                    Container(
                        margin: EdgeInsets.all(9.0),
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(elevation: 5),
                          onPressed: () {
                            provider.getHemmsytemfromview(context);
                          },
                          child: Text('View'),
                        )),
                  ]),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 35,
                  left: 0,
                ),
                child: Text(
                  'HEMM Monitoring System  CMHQ Record',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: dateinput,
                      decoration: InputDecoration(
                          //icon of text field
                          labelText: "Enter  Date",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))
                          //label text of field
                          ),
                      //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement
                          setState(() {
                            dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: s_no_A,
                      decoration: InputDecoration(
                        labelText: "Sl No",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: equipment_number_B,
                      decoration: InputDecoration(
                        labelText: "Equipment_number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: equipment_description_C,
                      decoration: InputDecoration(
                        labelText: "Equipment Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: capacity_D,
                      decoration: InputDecoration(
                        labelText: "Capacity",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: category_E,
                      decoration: InputDecoration(
                        labelText: "Category",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        if (value != "") {
                          print(" Total hours${int.parse(value) * 24}");
                          setState(() {
                            int totalHoursDummy = int.parse(value) * 24;
                            totalHours = totalHoursDummy.toString();
                          });
                        } else {
                          setState(() {
                            totalHours = "";
                          });
                        }
                      },
                      controller: no_of_days_F,
                      decoration: InputDecoration(
                        labelText: "No. of Days",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Text(" Total Hrs : "),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black)),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: totalHours != ""
                              ? Text(
                                  "  ${totalHours} Hours",
                                  textAlign: TextAlign.left,
                                )
                              : Text("")),
                    ),

                    // TextFormField(
                    //   controller: total_hrs_H,
                    //   decoration: InputDecoration(
                    //     labelText: "Total Hrs",
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
                      controller: running_hrs_I,
                      decoration: InputDecoration(
                        labelText: "Running ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: maint_hrs_J,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Maintenance. Hrs",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: b_d_hrs_K,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "  B/D Hrs",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Available Hrs"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(returnAvailableHours()),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Text("Availability"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                            "${int.parse(availableHoursDummyToGetAvalibality == "" ? "0" : availableHoursDummyToGetAvalibality) / int.parse(totalHours == "" ? "0" : totalHours) * 100}" ==
                                    "NaN"
                                ? ""
                                : " ${int.parse(availableHoursDummyToGetAvalibality == "" ? "0" : availableHoursDummyToGetAvalibality) / int.parse(totalHours == "" ? "0" : totalHours) * 100}%"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Utilization"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                            "${int.parse(running_hrs_I.text == "" ? "0" : running_hrs_I.text) / int.parse(returnAvailableHours()) * 100}" ==
                                    "NaN"
                                ? ""
                                : " ${int.parse(running_hrs_I.text == "" ? "0" : running_hrs_I.text) / int.parse(returnAvailableHours()) * 100}%"),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Text("OEE"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                            "${(int.parse(availableHoursDummyToGetAvalibality == "" ? "0" : availableHoursDummyToGetAvalibality) / int.parse(totalHours == "" ? "0" : totalHours) * 100 * int.parse(running_hrs_I.text == "" ? "0" : running_hrs_I.text) / int.parse(returnAvailableHours()) * 100) / 100}" ==
                                    "NaN"
                                ? ""
                                : " ${(int.parse(availableHoursDummyToGetAvalibality == "" ? "0" : availableHoursDummyToGetAvalibality) / int.parse(totalHours == "" ? "0" : totalHours) * 100 * int.parse(running_hrs_I.text == "" ? "0" : running_hrs_I.text) / int.parse(returnAvailableHours()) * 100) / 100}"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // TextFormField(
                    //   controller: OEE_O,
                    //   decoration: InputDecoration(
                    //     labelText: "  OEE",
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Map requiredData = {
                            'user_id': provider.userId,
                            'location_id': provider.location_id,
                            'date': dateinput.text,
                            's_no_A': s_no_A.text,
                            'equipment_number_B': equipment_number_B.text,
                            'equipment_description_C':
                                equipment_description_C.text,
                            'capacity_D': capacity_D.text,
                            'category_E': category_E.text,
                            'no_of_days_F': no_of_days_F.text,
                            'total_hrs_H': totalHours,
                            'running_hrs_I': running_hrs_I.text,
                            'maint_hrs_J': maint_hrs_J.text,
                            'b_d_hrs_K': b_d_hrs_K.text,
                            'available_hrs_L':
                                "${int.parse(totalHours == "" ? "0" : totalHours) - (int.parse(maint_hrs_J.text == "" ? "0" : maint_hrs_J.text) + int.parse(b_d_hrs_K.text == "" ? "0" : b_d_hrs_K.text))}",
                            'Availability_M':
                                "${int.parse(availableHoursDummyToGetAvalibality == "" ? "0" : availableHoursDummyToGetAvalibality) / int.parse(totalHours == "" ? "0" : totalHours) * 100}",
                            'Utilization_N':
                                "${int.parse(running_hrs_I.text == "" ? "0" : running_hrs_I.text) / int.parse(returnAvailableHours()) * 100}",
                            'OEE_O':
                                "${(int.parse(availableHoursDummyToGetAvalibality == "" ? "0" : availableHoursDummyToGetAvalibality) / int.parse(totalHours == "" ? "0" : totalHours) * 100 * int.parse(running_hrs_I.text == "" ? "0" : running_hrs_I.text) / int.parse(returnAvailableHours()) * 100) / 100}",
                            "LineItem_ID": json.encode(provider.checkListData),
                          };

                          provider.Hemmsytemfromm(context, requiredData);
                        },
                        child: Text("Submit"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
