import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:provider/provider.dart';
import '../../theme/common_theme.dart';
import '../commonheader/common_header.dart';

class QuizCategoryLIstScreen extends StatefulWidget {
  const QuizCategoryLIstScreen({super.key});

  @override
  State<QuizCategoryLIstScreen> createState() => _QuizCategoryLIstScreenState();
}

class _QuizCategoryLIstScreenState extends State<QuizCategoryLIstScreen> {
  String cvalue = "";

  // String showDate = 'Select Year';
  // DateTime _selectedDate = DateTime.now();
  // datePickerSce(context) async {
  //   print("Calling date picker");
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text("Select Year"),
  //         content: Container(
  //           // Need to use container to add size constraint.
  //           width: 300,
  //           height: 300,
  //           child: YearPicker(
  //             firstDate: DateTime(DateTime.now().year - 10, 1),
  //             // lastDate: DateTime.now(),
  //             lastDate: DateTime(2025),
  //             initialDate: DateTime.now(),
  //             selectedDate: _selectedDate,
  //             onChanged: (DateTime dateTime) {
  //               print(dateTime.year);
  //               setState(() {
  //                 _selectedDate = dateTime;
  //                 showDate = "${dateTime.year}";
  //               });
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Safety Quiz", "View"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 0,
              ),
              child: Text(
                'Safety Quiz',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              child: DropdownButton<String>(
                underline: SizedBox(),
                value: cvalue,
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      'Select Category',
                    ),
                    value: '',
                  ),
                  ...provider.quizCategoryList
                      .map<DropdownMenuItem<String>>((ce) {
                    return DropdownMenuItem(
                      child: Text(
                        ce['short_name'],
                      ),
                      value: ce['id'].toString(),
                    );
                  }).toList(),
                ],
                onChanged: (cvalue) {
                  setState(() {
                    this.cvalue = cvalue!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 15,
            //     vertical: 15,
            //   ),
            //   margin: EdgeInsets.only(top: 15),
            //   decoration: BoxDecoration(
            //     border: Border.all(),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   width: MediaQuery.of(context).size.width,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         '${showDate}',
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           datePickerSce(context);
            //         },
            //         child: Icon(
            //           Icons.calendar_month,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  if (cvalue == "") {
                    provider.showSnakeBar("Please Select Category", context);
                  } else {
                    provider.updateUserAccessLog("Safety Quiz Start", "View");
                    provider.getQuizData(context, cvalue);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CommonTheme.buttonBackgrooundCommonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Start Quiz',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
