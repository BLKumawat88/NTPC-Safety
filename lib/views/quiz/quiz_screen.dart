import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:provider/provider.dart';
import '../../theme/common_theme.dart';
import '../commonheader/common_header.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _pageController = PageController(initialPage: 0);
  int questionINdex = 0;
  List quizData = [
    {
      "id": 1,
      "title": "MVTR Means :",
      "answer": "None of these",
      "is_answered": false,
      "answer_status": 0,
      "options": [
        {
          "option": "A",
          "value": "Mines Vocational Train Rules",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "B",
          "value": "Mines Vocational Training Rules",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "C",
          "value": "Mines Vocational Trainee Rules",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "D",
          "value": "Mines Vocational Training Regulations",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "E",
          "value": "None of these",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 1,
      "title": "Mines Vocational Train Rules:",
      "answer": "None of these",
      "is_answered": false,
      "answer_status": 0,
      "options": [
        {
          "option": "A",
          "value": "Mines Vocational Train Rules",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "B",
          "value": "Mines Vocational Training Rules",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "C",
          "value": "Mines Vocational Trainee Rules",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "D",
          "value": "Mines Vocational Training Regulations",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "E",
          "value": "None of these",
          "color": "0xFFFFFFFF",
        },
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xFF053251),
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Quiz", "View"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question :${questionINdex + 1}/${provider.quizData.length}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: provider.quizData.length,
                  onPageChanged: (page) {
                    setState(() {
                      questionINdex = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFFFAB40),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                provider.quizData[index]['title'],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          provider.quizData[index]['answer_status'] == 2
                              ? Text(
                                  "Sorry : Right answer is -> ${provider.quizData[index]['answer']} ",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 20,
                          ),
                          ...provider.quizData[index]['options']
                              .map(
                                (data) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    width: double.infinity,
                                    child: Card(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Color(
                                            int.parse(
                                              data['color'],
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (provider.quizData[index]
                                                  ['is_answered'] ==
                                              0) {
                                            setState(() {
                                              if (data['value'] ==
                                                  provider.quizData[index]
                                                      ['answer']) {
                                                data['color'] = "0xFF31CD63";
                                                provider.quizData[index]
                                                    ['answer_status'] = 1;
                                              } else {
                                                data['color'] = "0xFFFF0000";
                                                provider.quizData[index]
                                                    ['answer_status'] = 2;
                                              }

                                              provider.quizData[index]
                                                  ['is_answered'] = 1;
                                            });
                                          } else {}
                                        },
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0),
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  color: Color(
                                                    int.parse(
                                                      data['color'],
                                                    ),
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    data['option']
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                data['value'],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: CommonTheme.headerCommonColor,
        onPressed: () {
          if (_pageController.page?.toInt() == provider.quizData.length - 1) {
            provider.quizResult(context);
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 5),
              curve: Curves.easeIn,
            );
          }
        },
        label: Text(
            questionINdex == provider.quizData.length - 1 ? "Submit" : "Next"),
      ),
    );
  }
}
