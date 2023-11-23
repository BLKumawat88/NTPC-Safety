import 'dart:convert';
import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/all_in_provider.dart';
import '../../../theme/common_theme.dart';
import '../../commonheader/common_header.dart';

class raklodingupdate extends StatefulWidget {
  const raklodingupdate({super.key});
  @override
  State<raklodingupdate> createState() => _raklodingupdateState();
}

class _raklodingupdateState extends State<raklodingupdate> {
  final _formKey = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();
  TextEditingController id = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController two = TextEditingController();

  // TextEditingController dateinput = TextEditingController();
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
  TextEditingController durason = TextEditingController();

  TextEditingController timeinputfore = TextEditingController();
  TextEditingController timeinputfive = TextEditingController();
  TextEditingController timeinputsix = TextEditingController();

  TextEditingController trataione = TextEditingController();
  TextEditingController trataitwo = TextEditingController();
  TextEditingController trataithree = TextEditingController();

  TextEditingController Completion_Time = TextEditingController();
  TextEditingController PlacementtoCompletionTime = TextEditingController();
  TextEditingController DrawoutTime = TextEditingController();
  TextEditingController TotaltimePlacementtoDrawout = TextEditingController();
  TextEditingController TimetakeninDrawoutaftercompletion =
      TextEditingController();
  TextEditingController TimeLagbetweenDrawoutandnextplacement =
      TextEditingController();

  TextEditingController timeinputseven = TextEditingController();
  TextEditingController flutter = TextEditingController();

  late final String label, initialValue;
  late final bool obscureText;

  List sidingData = [
    {"text": "S"},
    {"text": "N"},
    {"text": "EX-S"}
  ];

  String sidingValue = "";

  @override
  void initState() {
    AllInProvider provider = Provider.of(context, listen: false);
    durason.text = "";
    provider.placementTimeDiffFromSiding =
        provider.raklodingupdate[0]['total_time_placement_to_drawout_W'];
    timeinputtwo.text = "";
    timeinputthree.text = "";
    timeinputfore.text = "";
    timeinputfive.text = "";
    timeinputsix.text = "";
    Completion_Time.text = "";
    PlacementtoCompletionTime.text = "";
    DrawoutTime.text = "";
    TotaltimePlacementtoDrawout.text = "";
    sidingValue = provider.raklodingupdate[0]['siding_D'];
    timeinputseven.text = ""; //set the initial value of text field

    placementToCompletionTimeValue =
        provider.raklodingupdate[0]['placement_to_completion_time_U'];
    super.initState();
  }

  String placementToCompletionTimeValue = "";
  placementToCompletionTime() {
    var format = DateFormat("HH:mm");
    print("KKKKKK ${timeinput.text} ${DrawoutTime.text}");
    var one = format.parse(timeinput.text == "" ? "00:00" : timeinput.text);
    var two = format
        .parse(Completion_Time.text == "" ? "00:00" : Completion_Time.text);
    print("Diffrenece11111 ${timeinput.text}");
    print("CompletionTime.text${Completion_Time.text}");
    String result = two.difference(one).toString();

    String resultFinal = result.substring(0, result.indexOf('.'));

    setState(() {
      placementToCompletionTimeValue = resultFinal;
      print("Resulttt12345 $placementToCompletionTimeValue");
    });
  }

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);

    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "CMHQ production Update", "View"),
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
                  'Rakloding production UPDATE  ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ...provider.raklodingupdate.map(
                (e) => Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),

                      SizedBox(
                        height: 8,
                      ),

                      TextFormField(
                        onSaved: (value) {
                          dateinput.text = value!;
                        },
                        enabled: false,
                        initialValue: "${e['date_A']}",
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
                        height: 9,
                      ),
                      Text(
                        'Sl No',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          SlNo.text = value!;
                        },
                        initialValue: "${e['si_no_B']}",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        'Rake No',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        onSaved: (value) {
                          RakeNo.text = value!;
                        },
                        initialValue: " ${e['rake_no_C']}",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      // SizedBox(
                      //   height: 9,
                      // ),
                      // Text(
                      //   'Siding',
                      //   style: TextStyle(
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.blue,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // TextFormField(
                      //   onSaved: (value) {
                      //     Siding.text = value!;
                      //   },
                      //   initialValue: "${e['siding_D']}",
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Placement Time',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        onSaved: (save) {
                          timeinput.text = save!;
                        },
                        onChanged: (value) {
                          timeinput.text = value;
                        },
                        controller: timeinput,
                        decoration: InputDecoration(
                          hintText: " ${e['placement_time_E']}",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onTap: () async {
                          print('timeinput');
                          TimeOfDay? pickedTime = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );
                          if (pickedTime != null) {
                            //output 10:51 PM
                            DateTime parsedTime = DateFormat.jm()
                                .parse(pickedTime.format(context).toString());
                            // converting to DateTime so that we can further format on different pattern.
                            print(parsedTime); //output 1970-01-01 22:53:00.000
                            String formattedTime =
                                DateFormat('HH:mm:ss').format(parsedTime);
                            print(formattedTime);
                            //output 14:59:00
                            //DateFormat() is from intl package, you can format the time on any pattern you need.
                            setState(() {
                              timeinput.text = formattedTime;
                              // print('timeinput');
                            });
                            //set the value of text field.
                          } else {
                            print('not select data');
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Siding",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          )),
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

                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        'Wagons Supplied',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          WagonsSupplied.text = value!;
                        },
                        initialValue: "${e['wagons_supplied_F']}",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Damaged Wagons Supplied',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          DamagedWagonsSupplied.text = value!;
                        },
                        initialValue: "${e['damaged_wagons_supplied_G']}",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Wagons Repaired',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          WagonsRepaired.text = value!;
                        },
                        initialValue: "${e['wagons_repaired_H']}",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Loaded Wagons',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        onSaved: (value) {
                          LoadedWagons.text = value!;
                        },
                        initialValue: "${e['loaded_wagons_I']}",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Rejected Wagons',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        onSaved: (value) {
                          RejectedWagons.text = value!;
                        },
                        initialValue: "${e['rejected_wagons_J']}",
                        decoration: InputDecoration(
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
                                  decoration: InputDecoration(
                                    //icon of text field
                                    hintText: "${e['start_time_wbi_K']}",
                                    //  border: OutlineInputBorder(
                                    //  borderRadius: BorderRadius.circular(10))
                                    //label text of field
                                  ),
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );
                                    if (pickedTime != null) {
                                      //output 10:51 PM
                                      DateTime parsedTime = DateFormat.jm()
                                          .parse(pickedTime
                                              .format(context)
                                              .toString());
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
                                  decoration: InputDecoration(
                                    //icon of text field
                                    hintText: "${e['end_time_wbi_L']}",
                                  ),
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );
                                    if (pickedTime != null) {
                                      //output 10:51 PM
                                      DateTime parsedTime = DateFormat.jm()
                                          .parse(pickedTime
                                              .format(context)
                                              .toString());
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
                                        durason.text = ii + ":" + minVal;
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
                                  controller: durason,
                                  // controller: timeinputsix,
                                  decoration: InputDecoration(
                                    hintText: "${e['duration_wbi_M']}",
                                  ),
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

                                  //  onSaved: (value) {

                                  //   timeinputtwo.text = value!;
                                  //  },

                                  // initialValue: "${e['start_time_wbi_K']}",

                                  decoration: InputDecoration(
                                    //icon of text field
                                    hintText: "${e['start_time_loading_N']}",
                                    //  border: OutlineInputBorder(
                                    //  borderRadius: BorderRadius.circular(10))
                                    //label text of field
                                  ),

                                  //
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );
                                    if (pickedTime != null) {
                                      //output 10:51 PM
                                      DateTime parsedTime = DateFormat.jm()
                                          .parse(pickedTime
                                              .format(context)
                                              .toString());
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
                                  decoration: InputDecoration(
                                    //icon of text field
                                    hintText: "${e['end_time_loading_O']}",
                                  ),
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );
                                    if (pickedTime != null) {
                                      //output 10:51 PM
                                      DateTime parsedTime = DateFormat.jm()
                                          .parse(pickedTime
                                              .format(context)
                                              .toString());
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
                                  controller: timeinputsix,
                                  decoration: InputDecoration(
                                    hintText: "${e['duration_loading_P']}",
                                  ),
                                  //  initialValue: "${e['duration_loading_P']}",
                                  enabled: false,
                                  keyboardType: TextInputType.number,
                                  // onSaved: (value) {
                                  //  timeinputsix.text = value!;
                                  //  },
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
                                  //  onSaved: (value) {

                                  //   timeinputtwo.text = value!;
                                  //  },

                                  // initialValue: "${e['start_time_wbi_K']}",

                                  decoration: InputDecoration(
                                    //icon of text field
                                    hintText: "${e['start_time_tarpaulin_Q']}",
                                    //  border: OutlineInputBorder(
                                    //  borderRadius: BorderRadius.circular(10))
                                    //label text of field
                                  ),

                                  //
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );
                                    if (pickedTime != null) {
                                      //output 10:51 PM
                                      DateTime parsedTime = DateFormat.jm()
                                          .parse(pickedTime
                                              .format(context)
                                              .toString());
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
                                  decoration: InputDecoration(
                                    //icon of text field
                                    hintText: "${e['end_time_tarpaulin_R']}",
                                  ),
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );
                                    if (pickedTime != null) {
                                      //output 10:51 PM
                                      DateTime parsedTime = DateFormat.jm()
                                          .parse(pickedTime
                                              .format(context)
                                              .toString());
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
                                  controller: trataithree,

                                  decoration: InputDecoration(
                                    hintText: "${e['duration_tarpaulin_S']}",
                                  ),
                                  //  initialValue: "${e['duration_loading_P']}",
                                  enabled: false,
                                  keyboardType: TextInputType.number,
                                  // onSaved: (value) {
                                  //  timeinputsix.text = value!;
                                  //  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Completion Time',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: Completion_Time,
                            decoration: InputDecoration(
                              //icon of text field
                              hintText: "${e['completion_time_T']}",
                            ),
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
                                    DateFormat('HH:mm:ss').format(parsedTime);
                                //print(formattedTime);
                                //output 14:59:00
                                //DateFormat() is from intl package, you can format the time on any pattern you need.
                                var time1 = timeinput.text;
                                print(time1);
                                var time2 = formattedTime;
                                //print('a $time1');
                                //print('b $time2');
                                DateFormat dateFormat =
                                    DateFormat("yyyy-MM-dd");

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
                                  Completion_Time.text =
                                      formattedTime; //set the value of text field.
                                  placementToCompletionTime();
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
                          Text(
                            'Placement to Completion Time',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Text(placementToCompletionTimeValue),
                          // TextFormField(
                          //   controller: PlacementtoCompletionTime,
                          //   decoration: InputDecoration(
                          //     hintText:
                          //         "${e['placement_to_completion_time_U']}",
                          //   ),
                          //   //  initialValue: "${e['duration_loading_P']}",
                          //   enabled: false,
                          //   keyboardType: TextInputType.number,
                          // ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Drawout Time',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: DrawoutTime,
                            decoration: InputDecoration(
                              hintText: "${e['drawout_time_V']}",
                            ),
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
                                    DateFormat('HH:mm:ss').format(parsedTime);
                                //print(formattedTime);
                                //output 14:59:00
                                //DateFormat() is from intl package, you can format the time on any pattern you need.
                                var time1 = timeinput.text;
                                //  var time3 = CompletionTime.text;
                                print(time1);

                                print(time1);
                                var time2 = formattedTime;
                                //print('a $time1');
                                //print('b $time2');
                                DateFormat dateFormat =
                                    DateFormat("yyyy-MM-dd");

                                var _date = dateFormat.format(DateTime.now());
                                DateTime a = DateTime.parse('$_date $time1');
                                DateTime b = DateTime.parse('$_date $time2');

//log($a)
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

                          // TextFormField(
                          //   controller: TotaltimePlacementtoDrawout,
                          //   enabled: false,
                          //   decoration: InputDecoration(
                          //     hintText:
                          //         "${e['total_time_placement_to_drawout_W']}",
                          //   ),
                          // ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Time taken in Drawout after completion',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText:
                                  "${e['time_taken_in_drawout_after_completion_X']}",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            // 'Total time Placement to Drawout',
                            'Time Lag between Drawout and next placement',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Consumer<AllInProvider>(
                              builder: (context, value, child) =>
                                  Text(provider.placementTimeDiffFromSiding)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // TextField(

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
                              'duration_wbi_M': durason.text,
                              'start_time_loading_N': timeinputfore.text,
                              'end_time_loading_O': timeinputfive.text,
                              'duration_loading_P': timeinputsix.text,
                              'start_time_tarpaulin_Q': trataione.text,
                              'end_time_tarpaulin_R': trataitwo.text,
                              'duration_tarpaulin_S': trataithree.text,
                              'completion_time_T': Completion_Time.text,
                              'placement_to_completion_time_U':
                                  placementToCompletionTimeValue,
                              'drawout_time_V': DrawoutTime.text,
                              'total_time_placement_to_drawout_W':
                                  provider.placementTimeDiffFromSiding,
                              'time_taken_in_drawout_after_completion_X':
                                  TimetakeninDrawoutaftercompletion.text,
                              'time_lag_between_drawout_and_next_placement_Y':
                                  provider.placementTimeDiffFromSiding,
                              "LineItem_ID":
                                  json.encode(provider.checkListData),
                            };

                            print("sfsfs123456 $requiredData");

                            provider.raklodingupdatefrome(
                                context, requiredData);
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
