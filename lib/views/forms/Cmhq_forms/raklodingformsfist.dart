import 'dart:convert';
import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/all_in_provider.dart';
import '../../../theme/common_theme.dart';
import '../../commonheader/common_header.dart';

class rakloding extends StatefulWidget {
  const rakloding({super.key});
  @override
  State<rakloding> createState() => _raklodingState();
}

class _raklodingState extends State<rakloding> {
  final _formKey = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();
  String? selectedDateForBackendDeveloper;
  final timeController = TextEditingController();
  dynamic draoutTime = "";

  TextEditingController dateinput = TextEditingController();
  TextEditingController SlNo = TextEditingController();
  TextEditingController RakeNo = TextEditingController();
  TextEditingController Siding = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController WagonsSupplied = TextEditingController();
  TextEditingController DamagedWagonsSupplied = TextEditingController();
  TextEditingController WagonsRepaired = TextEditingController();
  TextEditingController LoadedWagons = TextEditingController();
  TextEditingController RejectedWagons = TextEditingController();

  TextEditingController timeinputtwo = TextEditingController();
  TextEditingController timeinputthree = TextEditingController();
  TextEditingController flutterr = TextEditingController();

  TextEditingController timeinputfore = TextEditingController();
  TextEditingController timeinputfive = TextEditingController();
  TextEditingController timeinputsix = TextEditingController();

  TextEditingController trataione = TextEditingController();
  TextEditingController trataitwo = TextEditingController();
  TextEditingController trataithree = TextEditingController();

  TextEditingController CompletionTime = TextEditingController();
  TextEditingController PlacementtoCompletionTime = TextEditingController();
  TextEditingController DrawoutTime = TextEditingController();
  TextEditingController TotaltimePlacementtoDrawout = TextEditingController();
  TextEditingController TimetakeninDrawoutaftercompletion =
      TextEditingController();
  TextEditingController TimeLagbetweenDrawoutandnextplacement =
      TextEditingController();

  TextEditingController timeinputseven = TextEditingController();
  TextEditingController flutter = TextEditingController();

  List sidingData = [
    {"text": "S"},
    {"text": "N"},
    {"text": "EX-S"}
  ];

  String sidingValue = "";

  @override
  void initState() {
    timeinput.text = "";
    timeinputtwo.text = "";
    timeinputthree.text = "";
    timeinputfore.text = "";
    timeinputfive.text = "";
    timeinputsix.text = "";
    CompletionTime.text = "";
    PlacementtoCompletionTime.text = "";
    DrawoutTime.text = "";
    TotaltimePlacementtoDrawout.text = "";
    timeinputseven.text = ""; //set the initial value of text field
    super.initState();
  }

  String getTotalTimePlacementToDrawoutValue = "";
  getTotalTimePlacementToDrawout() {
    var format = DateFormat("HH:mm");

    var one = format.parse(timeinput.text == "" ? "00:00" : timeinput.text);
    var two = format.parse(DrawoutTime.text == "" ? "00:00" : DrawoutTime.text);

    String result = two.difference(one).toString();
    String resultFinal = result.substring(0, result.indexOf('.'));
    getTotalTimePlacementToDrawoutValue = resultFinal;
    return resultFinal;
  }

  String placementToCompletionTimeValue = "";
  placementToCompletionTime() {
    var format = DateFormat("HH:mm");
    print("KKKKKK ${timeinput.text} ${DrawoutTime.text}");
    var one = format.parse(timeinput.text == "" ? "00:00" : timeinput.text);
    var two =
        format.parse(DrawoutTime.text == "" ? "00:00" : CompletionTime.text);
    print("Diffrenece11111 ${timeinput.text}");
    print("CompletionTime.text${CompletionTime.text}");
    String result = two.difference(one).toString();

    String resultFinal = result.substring(0, result.indexOf('.'));

    setState(() {
      placementToCompletionTimeValue = resultFinal;
      print("Resulttt12345 $placementToCompletionTimeValue");
    });
  }

  @override
  String vehicleIdDefaultId = "";
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "RakeLoadingDetailsMonitored_CmhqRecord", "View"),
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
                            provider.getrakeview(context);
                          },
                          child: Text('VIEW'),
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
                  'Rake Loading Details  ',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
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
                      controller: SlNo,
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
                      controller: RakeNo,
                      decoration: InputDecoration(
                        labelText: "Rake No",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: timeinput,
                      decoration: InputDecoration(
                        labelText: "Placement Time",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if (pickedTime != null) {
                          //output 10:51 PM
                          DateTime parsedTime = DateFormat.jm()
                              .parse(pickedTime.format(context).toString());
                          //converting to DateTime so that we can further format on different pattern.
                          print(parsedTime); //output 1970-01-01 22:53:00.000
                          String formattedTime =
                              DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime);
                          //output 14:59:00
                          //DateFormat() is from intl package, you can format the time on any pattern you need.

                          setState(() {
                            timeinput.text =
                                formattedTime; //set the value of text field.
                          });
                        } else {
                          print("Time is not selected");
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(alignment: Alignment.topLeft, child: Text("Siding")),
                    Container(
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
                        value: sidingValue,
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down_rounded,
                            color: Colors.black),
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              'Select Siding',
                            ),
                            value: '',
                          ),
                          ...sidingData.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem(
                              child: Text(
                                e['text'],
                              ),
                              value: e['text'],
                            );
                          }).toList(),
                        ],
                        onChanged: (value) {
                          setState(() {
                            sidingValue = value!;
                          });
                          provider.getSidingTime(
                              context, sidingValue, timeinput.text);
                        },
                      ),
                    ),
                    // TextFormField(
                    //   controller: Siding,
                    //   decoration: InputDecoration(
                    //     labelText: "Siding",
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: WagonsSupplied,
                      decoration: InputDecoration(
                        labelText: "Wagons Supplied",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: DamagedWagonsSupplied,
                      decoration: InputDecoration(
                        labelText: "Damaged Wagons Supplied",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: WagonsRepaired,
                      decoration: InputDecoration(
                        labelText: "Wagons Repaired",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: LoadedWagons,
                      decoration: InputDecoration(
                        labelText: "Loaded Wagons",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: RejectedWagons,
                      decoration: InputDecoration(
                        labelText: "  Rejected Wagons",
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
                              "Wire Binding/Inspection",
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
                                'Start time :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: timeinputtwo,
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    context: context,
                                  );
                                  if (pickedTime != null) {
                                    //output 10:51 PM
                                    DateTime parsedTime = DateFormat.jm().parse(
                                        pickedTime.format(context).toString());
                                    //converting to DateTime so that we can further format on different pattern.
                                    print(
                                        parsedTime); //output 1970-01-01 22:53:00.000
                                    String formattedTime =
                                        DateFormat('HH:mm:ss')
                                            .format(parsedTime);
                                    print(formattedTime);
                                    //output 14:59:00
                                    //DateFormat() is from intl package, you can format the time on any pattern you need.
                                    setState(() {
                                      timeinputtwo.text =
                                          formattedTime; //set the value of text field.
                                    });
                                  } else {
                                    print("Time is not selected");
                                  }
                                },
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'End time : ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: timeinputthree,
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    context: context,
                                  );
                                  if (pickedTime != null) {
                                    //output 10:51 PM
                                    DateTime parsedTime = DateFormat.jm().parse(
                                        pickedTime.format(context).toString());
                                    //converting to DateTime so that we can further format on different pattern.
                                    //  print(parsedTime); //output 1970-01-01 22:53:00.000
                                    String formattedTime =
                                        DateFormat('HH:mm:ss')
                                            .format(parsedTime);
                                    //print(formattedTime);
                                    //output 14:59:00
                                    //DateFormat() is from intl package, you can format the time on any pattern you need.
                                    var time1 = timeinputtwo.text;
                                    print(time1);
                                    var time2 = formattedTime;
                                    //print('a $time1');
                                    //print('b $time2');
                                    DateFormat dateFormat =
                                        DateFormat("yyyy-MM-dd");

                                    var _date =
                                        dateFormat.format(DateTime.now());

                                    DateTime a =
                                        DateTime.parse('$_date $time1');
                                    DateTime b =
                                        DateTime.parse('$_date $time2');
//log($a);
                                    //print('a $a');
                                    /* print('b $b');

                                  print("${b.difference(a).inHours}");
                                  print("${b.difference(a).inMinutes}");
                                  print("${b.difference(a).inSeconds}");*/
                                    var ii = "${b.difference(a).inHours}";
                                    var ik = "${b.difference(a).inMinutes}";
                                    int diffMin =
                                        int.parse(ik) - (int.parse(ii) * 60);
                                    var minVal = diffMin.toString();
                                    if (diffMin < 10) {
                                      minVal = "0" + diffMin.toString();
                                    }

                                    setState(() {
                                      timeinputthree.text =
                                          formattedTime; //set the value of text field.
                                      flutterr.text = ii + ":" + minVal;
                                      //timeinputseven.text = ik + ":" + ;
                                    });
                                  } else {
                                    print("Time is not selected");
                                  }
                                },
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Duration ',
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
                                controller: flutterr,
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
                              "Loading",
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
                                'Start time :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: timeinputfore,
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    context: context,
                                  );
                                  if (pickedTime != null) {
                                    //output 10:51 PM
                                    DateTime parsedTime = DateFormat.jm().parse(
                                        pickedTime.format(context).toString());
                                    //converting to DateTime so that we can further format on different pattern.
                                    print(
                                        parsedTime); //output 1970-01-01 22:53:00.000
                                    String formattedTime =
                                        DateFormat('HH:mm:ss')
                                            .format(parsedTime);
                                    print(formattedTime);
                                    //output 14:59:00
                                    //DateFormat() is from intl package, you can format the time on any pattern you need.
                                    setState(() {
                                      timeinputfore.text =
                                          formattedTime; //set the value of text field.
                                    });
                                  } else {
                                    print("Time is not selected");
                                  }
                                },
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    int data = (timeinputsix.text == ""
                                            ? 0
                                            : int.parse(timeinputsix.text)) +
                                        (value == "" ? 0 : int.parse(value));
                                    print("Data $data");
                                    flutter.text = data.toString();
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
                                'End time : ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: timeinputfive,
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    context: context,
                                  );
                                  if (pickedTime != null) {
                                    //output 10:51 PM
                                    DateTime parsedTime = DateFormat.jm().parse(
                                        pickedTime.format(context).toString());
                                    //converting to DateTime so that we can further format on different pattern.
                                    //  print(parsedTime); //output 1970-01-01 22:53:00.000
                                    String formattedTime =
                                        DateFormat('HH:mm:ss')
                                            .format(parsedTime);
                                    //print(formattedTime);
                                    //output 14:59:00
                                    //DateFormat() is from intl package, you can format the time on any pattern you need.
                                    var time1 = timeinputfore.text;
                                    print(time1);
                                    var time2 = formattedTime;
                                    //print('a $time1');
                                    //print('b $time2');
                                    DateFormat dateFormat =
                                        DateFormat("yyyy-MM-dd");

                                    var _date =
                                        dateFormat.format(DateTime.now());

                                    DateTime a =
                                        DateTime.parse('$_date $time1');
                                    DateTime b =
                                        DateTime.parse('$_date $time2');
//log($a);
                                    //print('a $a');
                                    /* print('b $b');

                                  print("${b.difference(a).inHours}");
                                  print("${b.difference(a).inMinutes}");
                                  print("${b.difference(a).inSeconds}");*/
                                    var ii = "${b.difference(a).inHours}";
                                    var ik = "${b.difference(a).inMinutes}";
                                    int diffMin =
                                        int.parse(ik) - (int.parse(ii) * 60);
                                    var minVal = diffMin.toString();
                                    if (diffMin < 10) {
                                      minVal = "0" + diffMin.toString();
                                    }

                                    setState(() {
                                      timeinputfive.text =
                                          formattedTime; //set the value of text field.
                                      timeinputsix.text = ii + ":" + minVal;
                                      //timeinputseven.text = ik + ":" + ;
                                    });
                                  } else {
                                    print("Time is not selected");
                                  }
                                },
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    int data = (timeinputfive.text == ""
                                            ? 0
                                            : int.parse(timeinputfive.text)) +
                                        (value == "" ? 0 : int.parse(value));
                                    print("Data $data");
                                    flutter.text = data.toString();
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
                                'Duration ',
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
                                controller: timeinputsix,
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
                              "Tarpaulin",
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
                                'Start time :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: trataione,
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    context: context,
                                  );
                                  if (pickedTime != null) {
                                    //output 10:51 PM
                                    DateTime parsedTime = DateFormat.jm().parse(
                                        pickedTime.format(context).toString());
                                    //converting to DateTime so that we can further format on different pattern.
                                    print(
                                        parsedTime); //output 1970-01-01 22:53:00.000
                                    String formattedTime =
                                        DateFormat('HH:mm:ss')
                                            .format(parsedTime);
                                    print(formattedTime);
                                    //output 14:59:00
                                    //DateFormat() is from intl package, you can format the time on any pattern you need.

                                    setState(() {
                                      trataione.text =
                                          formattedTime; //set the value of text field.
                                    });
                                  } else {
                                    print("Time is not selected");
                                  }
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
                                'End time :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: trataitwo,
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    context: context,
                                  );
                                  if (pickedTime != null) {
                                    //output 10:51 PM
                                    DateTime parsedTime = DateFormat.jm().parse(
                                        pickedTime.format(context).toString());
                                    //converting to DateTime so that we can further format on different pattern.
                                    //  print(parsedTime); //output 1970-01-01 22:53:00.000
                                    String formattedTime =
                                        DateFormat('HH:mm:ss')
                                            .format(parsedTime);
                                    //print(formattedTime);
                                    //output 14:59:00
                                    //DateFormat() is from intl package, you can format the time on any pattern you need.
                                    var time1 = trataione.text;
                                    print(time1);
                                    var time2 = formattedTime;
                                    //print('a $time1');
                                    //print('b $time2');
                                    DateFormat dateFormat =
                                        DateFormat("yyyy-MM-dd");

                                    var _date =
                                        dateFormat.format(DateTime.now());

                                    DateTime a =
                                        DateTime.parse('$_date $time1');
                                    DateTime b =
                                        DateTime.parse('$_date $time2');
//log($a);
                                    //print('a $a');
                                    /* print('b $b');

                                  print("${b.difference(a).inHours}");
                                  print("${b.difference(a).inMinutes}");
                                  print("${b.difference(a).inSeconds}");*/
                                    var ii = "${b.difference(a).inHours}";
                                    var ik = "${b.difference(a).inMinutes}";
                                    int diffMin =
                                        int.parse(ik) - (int.parse(ii) * 60);
                                    var minVal = diffMin.toString();
                                    if (diffMin < 10) {
                                      minVal = "0" + diffMin.toString();
                                    }

                                    setState(() {
                                      trataitwo.text =
                                          formattedTime; //set the value of text field.
                                      trataithree.text = ii + ":" + minVal;
                                      //timeinputseven.text = ik + ":" + ;
                                    });
                                  } else {
                                    print("Time is not selected");
                                  }
                                },
                                keyboardType: TextInputType.number,
                                // controller: oneseven,
                                onChanged: (value) {
                                  setState(() {
                                    int data = (timeinputsix.text == ""
                                            ? 0
                                            : int.parse(timeinputsix.text)) +
                                        (value == "" ? 0 : int.parse(value));
                                    print("Data $data");
                                    timeinputsix.text = data.toString();
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
                                'Duration :',
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
                                controller: trataithree,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: DrawoutTime,
                          decoration: InputDecoration(
                            labelText: "Drawout Time",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );
                            if (pickedTime != null) {
//BL Work

                              print(pickedTime.hour);
                              print(pickedTime.minute);
                              print("${pickedTime.period.name}");

                              draoutTime = pickedTime;
                              print(
                                  "${pickedTime.hour}:${pickedTime.minute}${pickedTime.period.name.toString().toUpperCase()}");

// BL WOrk

                              //output 10:51 PM
                              DateTime parsedTime = DateFormat.jm()
                                  .parse(pickedTime.format(context).toString());
                              //converting to DateTime so that we can further format on different pattern.
                              //  print(parsedTime); //output 1970-01-01 22:53:00.000
                              String formattedTime =
                                  DateFormat('HH:mm:ss').format(parsedTime);
                              //print(formattedTime);
                              //output 14:59:00
                              //DateFormat() is from intl package, you can format the time on any pattern you need.
                              var time1 = timeinput.text;
                              var time3 = CompletionTime.text;
                              print(time3);

                              print(time1);
                              var time2 = formattedTime;

                              DateFormat dateFormat = DateFormat("yyyy-MM-dd");

                              var _date = dateFormat.format(DateTime.now());

                              DateTime a = DateTime.parse('$_date $time1');
                              DateTime b = DateTime.parse('$_date $time2');
                              // DateTime c = DateTime.parse('$_date $time3');// Commented BY BL
//log($a);
                              //print('a $a');
                              /* print('b $b');

                                  print("${b.difference(a).inHours}");
                                  print("${b.difference(a).inMinutes}");
                                  print("${b.difference(a).inSeconds}");*/
                              var ii = "${b.difference(a).inHours}";
                              var ik = "${b.difference(a).inMinutes}";
                              int diffMin =
                                  int.parse(ik) - (int.parse(ii) * 60);
                              var minVal = diffMin.toString();
                              if (diffMin < 10) {
                                minVal = "0" + diffMin.toString();
                              }

                              setState(() {
                                DrawoutTime.text = formattedTime;
                                DrawoutTime.text =
                                    formattedTime; //set the value of text field.
                                TimetakeninDrawoutaftercompletion.text =
                                    ii + ":" + minVal;
                                TimetakeninDrawoutaftercompletion.text =
                                    ii + ":" + minVal;
                                //timeinputseven.text = ik + ":" + ;
                              });
                            } else {
                              print("Time is not selected");
                            }
                          },
                          keyboardType: TextInputType.number,
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Text('Total time Placement to Drawout '),
                        SizedBox(
                          height: 10,
                        ),
                        Consumer<AllInProvider>(
                          builder: (context, value, child) => Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(getTotalTimePlacementToDrawout()),
                              // Text(
                              //   "${provider.placementTimeDiffFromSiding}",
                              // ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: CompletionTime,
                          decoration: InputDecoration(
                            labelText: "Completion Time",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );
                            if (pickedTime != null) {
                              //output 10:51 PM
                              DateTime parsedTime = DateFormat.jm()
                                  .parse(pickedTime.format(context).toString());
                              //converting to DateTime so that we can further format on different pattern.
                              //  print(parsedTime); //output 1970-01-01 22:53:00.000
                              String formattedTime =
                                  DateFormat('HH:mm:ss').format(parsedTime);
                              //print(formattedTime);
                              //output 14:59:00
                              //DateFormat() is from intl package, you can format the time on any pattern you need.
                              var time1 = timeinput.text;
                              print(time1);
                              var time2 = formattedTime;
                              //print('a $time1');
                              //print('b $time2');
                              DateFormat dateFormat = DateFormat("yyyy-MM-dd");

                              var _date = dateFormat.format(DateTime.now());

                              DateTime a = DateTime.parse('$_date $time1');
                              DateTime b = DateTime.parse('$_date $time2');
//log($a);
                              //print('a $a');
                              /* print('b $b');

                                  print("${b.difference(a).inHours}");
                                  print("${b.difference(a).inMinutes}");
                                  print("${b.difference(a).inSeconds}");*/
                              var ii = "${b.difference(a).inHours}";
                              var ik = "${b.difference(a).inMinutes}";
                              int diffMin =
                                  int.parse(ik) - (int.parse(ii) * 60);
                              var minVal = diffMin.toString();
                              if (diffMin < 10) {
                                minVal = "0" + diffMin.toString();
                              }

                              setState(() {
                                CompletionTime.text = formattedTime;
                                placementToCompletionTime(); //set the value of text field.
                                PlacementtoCompletionTime.text =
                                    ii + ":" + minVal;
                                //timeinputseven.text = ik + ":" + ;
                              });
                            } else {
                              print("Time is not selected");
                            }
                          },
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text('Placement to Completion Time'),
                        SizedBox(
                          height: 10,
                        ),
                        Consumer<AllInProvider>(
                          builder: (context, value, child) => Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(placementToCompletionTimeValue),
                              // Text(
                              //   "${provider.placementTimeDiffFromSiding}",
                              // ),
                            ),
                          ),
                        ),
                        // TextFormField(
                        //   controller: PlacementtoCompletionTime,
                        //   decoration: InputDecoration(
                        //     enabled: false,
                        //     labelText: "Placement to Completion Time",
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //   ),
                        // ),

                        // Text("${DrawoutTime.text},${timeinput.text}"),
                        // TextFormField(
                        //  controller: TotaltimePlacementtoDrawout,
                        //   decoration: InputDecoration(
                        //     enabled: false,
                        //     labelText: "Total time Placement to Drawout",
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //   ),

                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: TimetakeninDrawoutaftercompletion,
                          decoration: InputDecoration(
                            labelText: "Time taken in Drawout after completion",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text('Time Lag between Drawout and next placement'),
                        SizedBox(
                          height: 10,
                        ),
                        Consumer<AllInProvider>(
                          builder: (context, value, child) => Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "${provider.placementTimeDiffFromSiding}",
                              ),
                            ),
                          ),
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
                            'date_A': dateinput.text,
                            'si_no_B': SlNo.text,
                            'rake_no_C': RakeNo.text,
                            'siding_D': sidingValue,
                            'placement_time_E': timeinput.text,
                            'wagons_supplied_F': WagonsSupplied.text,
                            'damaged_wagons_supplied_G':
                                DamagedWagonsSupplied.text,
                            'wagons_repaired_H': WagonsRepaired.text,
                            'loaded_wagons_I': LoadedWagons.text,
                            'rejected_wagons_J': RejectedWagons.text,
                            'start_time_wbi_K': timeinputtwo.text,
                            'end_time_wbi_L': timeinputthree.text,
                            'duration_wbi_M': flutterr.text,
                            'start_time_loading_N': timeinputfore.text,
                            'end_time_loading_O': timeinputfive.text,
                            'duration_loading_P': timeinputsix.text,
                            'start_time_tarpaulin_Q': trataione.text,
                            'end_time_tarpaulin_R': trataitwo.text,
                            'duration_tarpaulin_S': trataithree.text,
                            'completion_time_T': CompletionTime.text,
                            'placement_to_completion_time_U':
                                placementToCompletionTimeValue,
                            'drawout_time_V': DrawoutTime.text,
                            'total_time_placement_to_drawout_W':
                                getTotalTimePlacementToDrawoutValue,
                            'time_taken_in_drawout_after_completion_X':
                                TimetakeninDrawoutaftercompletion.text,
                            'time_lag_between_drawout_and_next_placement_Y':
                                TimeLagbetweenDrawoutandnextplacement.text,
                            "LineItem_ID": json.encode(provider.checkListData),
                          };

                          provider.rakloding(context, requiredData);
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
