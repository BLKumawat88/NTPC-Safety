import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../commonheader/common_header.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Safety Quiz Result", "View"),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text(
                provider.userPercentage < 50
                    ? "Try Again"
                    : provider.userPercentage >= 50 &&
                            provider.userPercentage <= 99
                        ? "You Passed"
                        : "Perfect Score ",
                style: TextStyle(
                    fontFamily: 'TanseekModernProArabic',
                    fontSize: 22,
                    letterSpacing: 1,
                    color:
                        provider.userPercentage < 50 ? Colors.red : Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 8.0,
                    animation: true,
                    percent: provider.userPercentage / 100,
                    center: Text(
                      '  ${provider.userPercentage}% ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'TanseekModernProArabic',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: provider.userPercentage < 60
                            ? Colors.red
                            : const Color(0xFF437B85),
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: provider.userPercentage < 60
                        ? Colors.red
                        : const Color(0xFF437B85),
                    backgroundColor: Color(0xFFE8914F),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Your Final Result is ${provider.userPercentage}%',
                style: TextStyle(
                  fontFamily: 'TanseekModernProArabic',
                  fontSize: 22,
                  color:
                      provider.userPercentage < 50 ? Colors.red : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // const Text(
              //   "12 correct answers out of 50 questions",
              //   style: AppCommonTheme.subTitleStyle,
              // ),

              // :${controller.seconds}
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Total Right Answers : ${provider.totalRight}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Total Wrong Answers : ${provider.wrongQ}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Total Omitted Questions : ${provider.ommitedQuestion}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
