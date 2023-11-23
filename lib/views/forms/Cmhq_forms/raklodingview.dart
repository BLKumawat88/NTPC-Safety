import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:provider/provider.dart';
import '../../commonheader/common_header.dart';

class rakevieww extends StatelessWidget {
  const rakevieww({super.key});
  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Cmhq List", "View"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
              ),
              child: Text(
                'View Data',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ...provider.rakeview
                .map(
                  (e) => Card(
                    child: ListTile(
                      leading: Text(
                          " ${provider.rakeview.indexOf(e) + 1}  ${e['date_A']}"),
                      onTap: () {
                        print(e);
                        provider.getraklodingupdate(context, e['id']);
                        provider.Id = e['id'].toString();
                      },
                      trailing: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
