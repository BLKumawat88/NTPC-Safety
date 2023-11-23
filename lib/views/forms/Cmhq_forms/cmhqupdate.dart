import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/all_in_provider.dart';
import '../../../theme/common_theme.dart';
import '../../commonheader/common_header.dart';

class Cmhqupdate extends StatefulWidget {
  const Cmhqupdate({super.key});
  @override
  State<Cmhqupdate> createState() => _CmhqupdateState();
}

class _CmhqupdateState extends State<Cmhqupdate> {
  final _formKey = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();
  TextEditingController id = TextEditingController();
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
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);

    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "CMHQ production dispatch form Update", "View"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
                  'CMHQ production dispatch form UPDATE  ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ...provider.Cmhqupdate.map(
                (e) => Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      //  Padding(
                      //    padding: const EdgeInsets.only(
                      //     top: 3,
                      //    right: 310,
                      //  ),
                      //   child: Text(
                      //   ' Date',
                      //     style: TextStyle(
                      //      fontSize: 30,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      //  ),
                      //  ),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        enabled: false,
                        initialValue: "${e['date']}",
                        // controller: dateinput,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            //icon of text field
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                            //label text of field
                            ),

                        //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate:
                                DateTime.now().subtract(Duration(days: 1)),
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
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 3,
                          right: 120,
                        ),
                        child: Text(
                          'Coal production from pakribarwadih',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        onSaved: (value) {
                          two.text = value!;
                        },
                        initialValue:
                            "${e['coal_production_from_pakribarwadih']}",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          top: 3,
                          right: 130,
                        ),
                        child: Text(
                          'Coal production from dulanga',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        onSaved: (value) {
                          three.text = value!;
                        },
                        initialValue: " ${e['coal_production_from_dulanga']}",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 3,
                          right: 130,
                        ),
                        child: Text(
                          'Coal production from talaipalli',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          five.text = value!;
                        },
                        initialValue: "${e['coal_production_from_talaipalli']}",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          top: 3,
                          right: 130,
                        ),
                        child: Text(
                          'Coal production from chhattibariatu',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          foure.text = value!;
                        },
                        initialValue:
                            "${e['coal_production_from_chhattibariatu']}",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                                    onSaved: (value) {
                                      six.text = value!;
                                    },
                                    initialValue:
                                        " ${e['no_of_rakes_despatch_from_pakribarwadih']}",
                                    decoration: InputDecoration()),
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
                                        e['rakes_quantity_despatch_from_pakribarwadih'] =
                                            value;

                                        int data = int.parse(
                                                e['rakes_quantity_despatch_from_pakribarwadih'] ==
                                                        ""
                                                    ? "0"
                                                    : e[
                                                        'rakes_quantity_despatch_from_pakribarwadih']) +
                                            int.parse(
                                                e['trips_quantity_despatch_from_pakribarwadih'] ==
                                                        ""
                                                    ? "0"
                                                    : e['trips_quantity_despatch_from_pakribarwadih']);
                                        print("data $data");
                                        e['total_quantity_despatch_from_pakribarwadih'] =
                                            data;
                                        ten.text = data.toString();
                                      });
                                    },
                                    onSaved: (value) {
                                      seven.text = value!;
                                    },
                                    initialValue:
                                        "${e['rakes_quantity_despatch_from_pakribarwadih']}",
                                    decoration: InputDecoration()),
                              ),
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
                                    onSaved: (value) {
                                      eight.text = value!;
                                    },
                                    initialValue:
                                        " ${e['trips_despatch_from_pakribarwadih']}",
                                    decoration: InputDecoration()),
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
                                    onSaved: (value) {
                                      nine.text = value!;
                                    },
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        e['trips_quantity_despatch_from_pakribarwadih'] =
                                            value;

                                        int data = int.parse(
                                                e['rakes_quantity_despatch_from_pakribarwadih'] ==
                                                        ""
                                                    ? "0"
                                                    : e[
                                                        'rakes_quantity_despatch_from_pakribarwadih']) +
                                            int.parse(
                                                e['trips_quantity_despatch_from_pakribarwadih'] ==
                                                        ""
                                                    ? "0"
                                                    : e['trips_quantity_despatch_from_pakribarwadih']);
                                        print("data $data");
                                        e['total_quantity_despatch_from_pakribarwadih'] =
                                            data;
                                        ten.text = data.toString();
                                      });
                                    },
                                    initialValue:
                                        "${e['trips_quantity_despatch_from_pakribarwadih']}",
                                    decoration: InputDecoration()),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Total Quantity :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Text(
                                  "${e['total_quantity_despatch_from_pakribarwadih']}"),
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
                                    onSaved: (value) {
                                      oneone.text = value!;
                                    },
                                    initialValue:
                                        " ${e['no_of_rakes_despatch_from_dulanga']}",
                                    decoration: InputDecoration()),
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
                                    onSaved: (value) {
                                      onetwo.text = value!;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        e['rakes_quantity_despatch_from_dulanga'] =
                                            value;

                                        int data = int.parse(
                                                e['rakes_quantity_despatch_from_dulanga'] ==
                                                        ""
                                                    ? "0"
                                                    : e[
                                                        'rakes_quantity_despatch_from_dulanga']) +
                                            int.parse(
                                                e['trips_quantity_despatch_from_dulanga'] ==
                                                        ""
                                                    ? "0"
                                                    : e['trips_quantity_despatch_from_dulanga']);
                                        print("data $data");
                                        e['total_quantity_despatch_from_dulanga'] =
                                            data;
                                        onefive.text = data.toString();
                                      });
                                    },
                                    initialValue:
                                        "${e['rakes_quantity_despatch_from_dulanga']}",
                                    decoration: InputDecoration()),
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
                                    onSaved: (value) {
                                      onethree.text = value!;
                                    },
                                    initialValue:
                                        "${e['trips_despatch_from_dulanga']}",
                                    decoration: InputDecoration()),
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
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        e['trips_quantity_despatch_from_dulanga'] =
                                            value;

                                        int data = int.parse(
                                                e['rakes_quantity_despatch_from_dulanga'] ==
                                                        ""
                                                    ? "0"
                                                    : e[
                                                        'rakes_quantity_despatch_from_dulanga']) +
                                            int.parse(
                                                e['trips_quantity_despatch_from_dulanga'] ==
                                                        ""
                                                    ? "0"
                                                    : e['trips_quantity_despatch_from_dulanga']);
                                        print("data $data");
                                        e['total_quantity_despatch_from_dulanga'] =
                                            data;
                                        onefive.text = data.toString();
                                      });
                                    },
                                    onSaved: (value) {
                                      onefoure.text = value!;
                                    },
                                    initialValue:
                                        "${e['trips_quantity_despatch_from_dulanga']}",
                                    decoration: InputDecoration()),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Total Quantity ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Expanded(
                                  child: Text(
                                      "${e['total_quantity_despatch_from_dulanga']}"))
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
                                    onSaved: (value) {
                                      onesix.text = value!;
                                    },
                                    initialValue:
                                        " ${e['no_of_rakes_despatch_from_talaipalli']}",
                                    decoration: InputDecoration()),
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
                                        e['rakes_quantity_despatch_from_talaipalli'] =
                                            value;

                                        int data = int.parse(
                                                e['rakes_quantity_despatch_from_talaipalli'] ==
                                                        ""
                                                    ? "0"
                                                    : e[
                                                        'rakes_quantity_despatch_from_talaipalli']) +
                                            int.parse(
                                                e['trips_quantity_despatch_from_talaipalli'] ==
                                                        ""
                                                    ? "0"
                                                    : e['trips_quantity_despatch_from_talaipalli']);
                                        print("data $data");
                                        e['total_quantity_despatch_from_talaipalli'] =
                                            data;
                                        oneten.text = data.toString();
                                      });
                                    },
                                    onSaved: (value) {
                                      oneseven.text = value!;
                                    },
                                    initialValue:
                                        "${e['rakes_quantity_despatch_from_talaipalli']}",
                                    decoration: InputDecoration()),
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
                                    onSaved: (value) {
                                      oneeight.text = value!;
                                    },
                                    initialValue:
                                        " ${e['trips_despatch_from_talaipalli']}",
                                    decoration: InputDecoration()),
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
                                        e['trips_quantity_despatch_from_talaipalli'] =
                                            value;

                                        int data = int.parse(
                                                e['rakes_quantity_despatch_from_talaipalli'] ==
                                                        ""
                                                    ? "0"
                                                    : e[
                                                        'rakes_quantity_despatch_from_talaipalli']) +
                                            int.parse(
                                                e['trips_quantity_despatch_from_talaipalli'] ==
                                                        ""
                                                    ? "0"
                                                    : e['trips_quantity_despatch_from_talaipalli']);
                                        print("data $data");
                                        e['total_quantity_despatch_from_talaipalli'] =
                                            data;
                                        oneten.text = data.toString();
                                      });
                                    },
                                    onSaved: (value) {
                                      onenine.text = value!;
                                    },
                                    initialValue:
                                        "${e['trips_quantity_despatch_from_talaipalli']}",
                                    decoration: InputDecoration()),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Total Quantity :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Expanded(
                                  child: Text(
                                      "${e['total_quantity_despatch_from_talaipalli']}"))
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
                                    onSaved: (value) {
                                      twoone.text = value!;
                                    },
                                    initialValue:
                                        " ${e['no_of_rakes_despatch_from_chhattibariatu']}",
                                    decoration: InputDecoration()),
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
                                        e['rakes_quantity_despatch_from_chhattibariatu'] =
                                            value;
                                        int data = int.parse(
                                                e['rakes_quantity_despatch_from_chhattibariatu'] ==
                                                        ""
                                                    ? "0"
                                                    : e[
                                                        'rakes_quantity_despatch_from_chhattibariatu']) +
                                            int.parse(
                                                e['trips_quantity_despatch_from_chhattibariatu'] ==
                                                        ""
                                                    ? "0"
                                                    : e['trips_quantity_despatch_from_chhattibariatu']);
                                        print("data $data");
                                        e['total_quantity_despatch_from_chhattibariatu'] =
                                            data;
                                        twofive.text = data.toString();
                                      });
                                    },
                                    onSaved: (value) {
                                      twotwo.text = value!;
                                    },
                                    initialValue:
                                        "${e['rakes_quantity_despatch_from_chhattibariatu']}",
                                    decoration: InputDecoration()),
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
                                    onSaved: (value) {
                                      twothree.text = value!;
                                    },
                                    initialValue:
                                        " ${e['trips_despatch_from_chhattibariatu']}",
                                    decoration: InputDecoration()),
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
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        e['trips_quantity_despatch_from_chhattibariatu'] =
                                            value;
                                        int data = int.parse(
                                                e['rakes_quantity_despatch_from_chhattibariatu'] ==
                                                        ""
                                                    ? "0"
                                                    : e[
                                                        'rakes_quantity_despatch_from_chhattibariatu']) +
                                            int.parse(
                                                e['trips_quantity_despatch_from_chhattibariatu'] ==
                                                        ""
                                                    ? "0"
                                                    : e['trips_quantity_despatch_from_chhattibariatu']);
                                        print("data $data");
                                        e['total_quantity_despatch_from_chhattibariatu'] =
                                            data;
                                        twofive.text = data.toString();
                                      });
                                    },
                                    onSaved: (value) {
                                      twofoure.text = value!;
                                    },
                                    initialValue:
                                        "${e['trips_quantity_despatch_from_chhattibariatu']}",
                                    decoration: InputDecoration()),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Total Quantity ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Expanded(
                                  child: Text(
                                      "${e['total_quantity_despatch_from_chhattibariatu']}"))
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
                            print("IDDD ${provider.Id}");
                            _formKey.currentState?.save();
                            Map requiredData = {
                              'id': provider.Id,
                              'user_id': provider.userId,
                              'location_id': provider.location_id,
                              'date': "${e['date']}",
                              'coal_production_from_pakribarwadih': two.text,
                              'coal_production_from_dulanga': three.text,
                              'coal_production_from_talaipalli': five.text,
                              'coal_production_from_chhattibariatu': foure.text,
                              'no_of_rakes_despatch_from_pakribarwadih':
                                  six.text,
                              'rakes_quantity_despatch_from_pakribarwadih':
                                  seven.text,
                              'trips_despatch_from_pakribarwadih': eight.text,
                              'trips_quantity_despatch_from_pakribarwadih':
                                  nine.text,
                              'total_quantity_despatch_from_pakribarwadih': e[
                                  'total_quantity_despatch_from_pakribarwadih'],
                              'no_of_rakes_despatch_from_dulanga': oneone.text,
                              'rakes_quantity_despatch_from_dulanga':
                                  onetwo.text,
                              'trips_despatch_from_dulanga': onethree.text,
                              'trips_quantity_despatch_from_dulanga':
                                  onefoure.text,
                              'total_quantity_despatch_from_dulanga':
                                  e['total_quantity_despatch_from_dulanga'],
                              'no_of_rakes_despatch_from_talaipalli':
                                  onesix.text,
                              'rakes_quantity_despatch_from_talaipalli':
                                  oneseven.text,
                              'trips_despatch_from_talaipalli': oneeight.text,
                              'trips_quantity_despatch_from_talaipalli':
                                  onenine.text,
                              'total_quantity_despatch_from_talaipalli':
                                  e['total_quantity_despatch_from_talaipalli'],
                              'no_of_rakes_despatch_from_chhattibariatu':
                                  twoone.text,
                              'rakes_quantity_despatch_from_chhattibariatu':
                                  twotwo.text,
                              'trips_despatch_from_chhattibariatu':
                                  twothree.text,
                              'trips_quantity_despatch_from_chhattibariatu':
                                  twofoure.text,
                              'total_quantity_despatch_from_chhattibariatu': e[
                                  'total_quantity_despatch_from_chhattibariatu'],
                              "LineItem_ID":
                                  json.encode(provider.checkListData),
                            };

                            print(" sfsfs $requiredData");

                            provider.Cmhqupdatee(context, requiredData);
                          },
                          child: Text("update "),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
