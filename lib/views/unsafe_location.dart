import 'package:flutter/material.dart';
import 'package:ntpc/theme/common_theme.dart';
import 'package:provider/provider.dart';

import '../controller/all_in_provider.dart';

class UnsafeLocation extends StatelessWidget {
  const UnsafeLocation({super.key});

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of<AllInProvider>(context, listen: false);
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Unsafe Condition',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              children: [
                ...provider.plantData
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          provider.requiredDataToGetUnsafe_act_list[
                              'plant_id'] = e['id'];
                          provider.requiredDataToGetUnsafe_act_list[
                              'plant_name'] = e['plant_name'];
                          // provider.getUnsafeLocationList(
                          //     context, {"plant_id": e['id']});
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              margin: EdgeInsets.only(right: 5),
                              width: MediaQuery.of(context).size.width / 2.4,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF8E00),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                e['plant_name'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
