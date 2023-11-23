import 'package:flutter/material.dart';
import 'package:ntpc/model/index_model.dart';
import 'package:ntpc/theme/common_theme.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CommonTheme.headerCommonColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'सचेतन',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png.png',
                    width: 50,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Image.asset(
                      'assets/images/kavach.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: indexModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: indexModel[index].color,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Image.asset(
                    indexModel[index].image,
                    width: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      indexModel[index].title,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
