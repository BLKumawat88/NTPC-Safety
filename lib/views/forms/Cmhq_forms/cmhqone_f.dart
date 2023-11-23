import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ntpc/views/forms/Cmhq_forms/viewcmhfrom.dart';
import 'package:provider/provider.dart';
import '../../../controller/all_in_provider.dart';
import '../../../theme/common_theme.dart';
import '../../commonheader/common_header.dart';
import 'cmhqupdate.dart';

class Cmhq extends StatefulWidget {
  const Cmhq({super.key});
  @override
  State<Cmhq> createState() => _CmhqState();
}

class _CmhqState extends State<Cmhq> {
  final _formKey = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();
  String? selectedDateForBackendDeveloper;
  TextEditingController dateinput = TextEditingController();
  TextEditingController two = TextEditingController();
  TextEditingController three = TextEditingController();
  TextEditingController foure = TextEditingController();
  TextEditingController five = TextEditingController();
  TextEditingController six = TextEditingController();
  TextEditingController seven = TextEditingController();
  TextEditingController eight = TextEditingController();
  TextEditingController nine = TextEditingController();
  TextEditingController ten = TextEditingController();
  TextEditingController oneone = TextEditingController();
  TextEditingController onetwo = TextEditingController();
  TextEditingController onethree = TextEditingController();
  TextEditingController onefoure = TextEditingController();
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
  String vehicleIdDefaultId = "";
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "CMHQ production dispatch form", "View"),
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
                            provider.getCmhqview(context);
                          },
                          child: Text('VIEW'),
                        )),
                  ]),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: CommonTheme.headerCommonColor,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'CMHQ production dispatch form ',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    // TextFormField(
                    //    controller: Date,
                    //     decoration: InputDecoration(
                    //     labelText: "Current_Date",
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //    ),
                    //   ),
                    // ),
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
                      controller: two,
                      decoration: InputDecoration(
                        labelText: "Coal Production from Pakri Barwadih",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: three,
                      decoration: InputDecoration(
                        labelText: "Coal Production from Dulanga",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: foure,
                      decoration: InputDecoration(
                        labelText: "Coal Production from Talaipalli",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: five,
                      decoration: InputDecoration(
                        labelText: "Coal Production from Chhatti Bariatu",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: CommonTheme.headerCommonColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Coal Despatch from Pakri Barwadih",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'No. of Rakes :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: six,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Quantity :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                flex: 2,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      int data = (nine.text == ""
                                              ? 0
                                              : int.parse(nine.text)) +
                                          (value == "" ? 0 : int.parse(value));
                                      print("Data $data");
                                      ten.text = data.toString();
                                    });
                                  },
                                  controller: seven,
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Trips to Unchahar  :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: eight,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Quantity :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                onChanged: (value) {
                                  print(value.runtimeType);
                                  setState(() {
                                    int data = (seven.text == ""
                                            ? 0
                                            : int.parse(seven.text)) +
                                        (value == "" ? 0 : int.parse(value));

                                    ten.text = data.toString();
                                  });
                                },
                                keyboardType: TextInputType.number,
                                controller: nine,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Total Quantity :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                enabled: false,
                                keyboardType: TextInputType.number,
                                controller: ten,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          color: CommonTheme.headerCommonColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Coal Despatch from Dulanga",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'No. of Rakes :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: oneone,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Quantity : ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    int data = (onefoure.text == ""
                                            ? 0
                                            : int.parse(onefoure.text)) +
                                        (value == "" ? 0 : int.parse(value));
                                    print("Data $data");
                                    onefive.text = data.toString();
                                  });
                                },
                                controller: onetwo,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Trips ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: onethree,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Quantity ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: onefoure,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    int data = (onetwo.text == ""
                                            ? 0
                                            : int.parse(onetwo.text)) +
                                        (value == "" ? 0 : int.parse(value));
                                    print("Data $data");
                                    onefive.text = data.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Total Quantity ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                enabled: false,
                                controller: onefive,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: CommonTheme.headerCommonColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Coal Despatch from Talaipalli",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'No. of Rakes :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: onesix,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Quantity :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: oneseven,
                                onChanged: (value) {
                                  setState(() {
                                    int data = (onenine.text == ""
                                            ? 0
                                            : int.parse(onenine.text)) +
                                        (value == "" ? 0 : int.parse(value));
                                    print("Data $data");
                                    oneten.text = data.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Trips :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: oneeight,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Quantity :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    int data = (oneseven.text == ""
                                            ? 0
                                            : int.parse(oneseven.text)) +
                                        (value == "" ? 0 : int.parse(value));
                                    print("Data $data");
                                    oneten.text = data.toString();
                                  });
                                },
                                controller: onenine,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Total Quantity :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                enabled: false,
                                controller: oneten,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          color: CommonTheme.headerCommonColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Coal Despatch from Chhatti Bariatu",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'No. of Rakes :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: twoone,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Quantity : ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: twotwo,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    int data = (twofoure.text == ""
                                            ? 0
                                            : int.parse(twofoure.text)) +
                                        (value == "" ? 0 : int.parse(value));
                                    print("Data $data");
                                    twofive.text = data.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Trips ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: twothree,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Quantity ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: twofoure,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    int data = (twotwo.text == ""
                                            ? 0
                                            : int.parse(twotwo.text)) +
                                        (value == "" ? 0 : int.parse(value));
                                    print("Data $data");
                                    twofive.text = data.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Total Quantity ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                enabled: false,
                                controller: twofive,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Map requiredData = {
                            'user_id': provider.userId,
                            'location_id': provider.location_id,
                            'date': dateinput.text,
                            'coal_production_from_pakribarwadih': two.text,
                            'coal_production_from_dulanga': three.text,
                            'coal_production_from_talaipalli': foure.text,
                            'coal_production_from_chhattibariatu': five.text,
                            'no_of_rakes_despatch_from_pakribarwadih': six.text,
                            'rakes_quantity_despatch_from_pakribarwadih':
                                seven.text,
                            'trips_despatch_from_pakribarwadih': eight.text,
                            'trips_quantity_despatch_from_pakribarwadih':
                                nine.text,
                            'total_quantity_despatch_from_pakribarwadih':
                                ten.text,
                            'no_of_rakes_despatch_from_dulanga': oneone.text,
                            'rakes_quantity_despatch_from_dulanga': onetwo.text,
                            'trips_despatch_from_dulanga': onethree.text,
                            'trips_quantity_despatch_from_dulanga':
                                onefoure.text,
                            'total_quantity_despatch_from_dulanga':
                                onefive.text,
                            'no_of_rakes_despatch_from_talaipalli': onesix.text,
                            'rakes_quantity_despatch_from_talaipalli':
                                oneseven.text,
                            'trips_despatch_from_talaipalli': oneeight.text,
                            'trips_quantity_despatch_from_talaipalli':
                                onenine.text,
                            'total_quantity_despatch_from_talaipalli':
                                oneten.text,
                            'no_of_rakes_despatch_from_chhattibariatu':
                                twoone.text,
                            'rakes_quantity_despatch_from_chhattibariatu':
                                twotwo.text,
                            'trips_despatch_from_chhattibariatu': twothree.text,
                            'trips_quantity_despatch_from_chhattibariatu':
                                twofoure.text,
                            'total_quantity_despatch_from_chhattibariatu':
                                twofive.text,
                            "LineItem_ID": json.encode(provider.checkListData),
                          };

                          provider.Cmhq(context, requiredData);
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
