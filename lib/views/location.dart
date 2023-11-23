import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/all_in_provider.dart';
import 'commonheader/common_header.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of<AllInProvider>(context, listen: false);

    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Incident Reporting", "View"),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
              ),
              child: Text(
                'Incident Reporting',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                itemCount: provider.unsafeLocationList.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: provider.iPadSize ? 3 : 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      provider.requiredDataToGetUnsafe_act_list['location_id'] =
                          provider.unsafeLocationList[index]['id'];
                      provider.requiredDataToGetUnsafe_act_list[
                              'location_name'] =
                          provider.unsafeLocationList[index]['location_name'];
                      // provider.getUnsafe_act_list_data(context);
                      Navigator.pushNamed(context, '/unsafe_act_list');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFF8E00),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            provider.iconsPath +
                                provider.unsafeLocationList[index]['icon'],
                            width: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              provider.unsafeLocationList[index]
                                  ['location_name'],
                              style: provider.iPadSize
                                  ? TextStyle(
                                      color: Colors.white,
                                      fontSize: provider.textFontSize,
                                    )
                                  : TextStyle(
                                      color: Colors.white,
                                    ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
