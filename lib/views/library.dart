import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ntpc/controller/all_in_provider.dart';
import 'package:ntpc/theme/common_theme.dart';
import 'package:ntpc/views/viewpdf/pdf_viewer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'commonheader/common_header.dart';

class LibraryScreen extends StatefulWidget {
  LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late AllInProvider provider;

  Map getDigitalLibraryList = {
    'category_id': '',
    'sub_category_id': '',
  };

  Future<void> _launchUrl(_url) async {
    try {
      final Uri urlTwitter = Uri.parse(_url);

      await launchUrl(
        urlTwitter,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {}
  }

  List librarySearchData = [];
  @override
  void initState() {
    provider = Provider.of<AllInProvider>(context, listen: false);
    super.initState();
    librarySearchData = provider.digitalLibraryData;
  }

  void searchUsers(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = provider.digitalLibraryData;
    } else {
      results = provider.digitalLibraryData
          .where((item) => item['title']
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();

      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      librarySearchData = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AllInProvider>(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, "Digital Library", "View"),
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
                'Digital Library',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                onChanged: (value) {
                  searchUsers(value);
                },
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Search',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  hintStyle: TextStyle(
                    color: Color(0xFF828282),
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    size: 24,
                    color: Color(0xFF999999),
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xFFDEDEDE),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(
                      color: Color(0xFFDEDEDE),
                      style: BorderStyle.none,
                      width: 0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(
                      color: Color(0xFFDEDEDE),
                      style: BorderStyle.none,
                      width: 0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CommonTheme.buttonBackgrooundCommonColor,
                    ),
                    onPressed: () {
                      _launchUrl(
                          'https://www.dgms.gov.in/UserView/index?mid=1313');
                    },
                    child: Text(
                      'latest_circulars'.tr(),
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CommonTheme.buttonBackgrooundCommonColor,
                    ),
                    onPressed: () {
                      _launchUrl('https://www.dgms.net/legislation.html');
                    },
                    child: Text(
                      'mining_books'.tr(),
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CommonTheme.buttonBackgrooundCommonColor,
                ),
                onPressed: () {
                  _launchUrl('https://www.dgms.gov.in/UserView/index?mid=1437');
                },
                child: Text(
                  'latest_gazette_notifications'.tr(),
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<AllInProvider>(
              builder: (context, value, child) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(),
                ),
                child: DropdownButton<String>(
                  underline: SizedBox(),
                  value: provider.defaultMainValue,
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        'categories'.tr(),
                      ),
                      value: '',
                    ),
                    ...provider.categoryList
                        .map<DropdownMenuItem<String>>((ce) {
                      return DropdownMenuItem(
                        child: Text(
                          ce['category_title'],
                        ),
                        value: ce['id'].toString(),
                      );
                    }).toList(),
                  ],
                  onChanged: (cvalue) {
                    getDigitalLibraryList['category_id'] =
                        provider.defaultMainValue;
                    provider.updateCategoryId(context, cvalue);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<AllInProvider>(
              builder: (context, value, child) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(),
                  ),
                  child: DropdownButton<String>(
                    underline: SizedBox(),
                    value: provider.defaultSubValue,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'sub_categories'.tr(),
                        ),
                        value: '',
                      ),
                      ...provider.subcategoryList
                          .map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(
                          child: Text(
                            e['sub_category_title'],
                          ),
                          value: e['id'].toString(),
                        );
                      }).toList(),
                    ],
                    onChanged: (value) {
                      getDigitalLibraryList['sub_category_id'] = value;
                      provider.updateSubCategoryId(value);
                    },
                  ),
                );
              },
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 10,
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CommonTheme.buttonBackgrooundCommonColor,
                ),
                onPressed: () {
                  provider.getDigitalLibraryList(
                    context,
                    getDigitalLibraryList,
                  );
                },
                child: Text('Submit'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<AllInProvider>(
              builder: (context, value, child) {
                return librarySearchData.isNotEmpty
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0)),
                        child: DataTable(
                          horizontalMargin: 10,
                          columnSpacing: 10,
                          border: TableBorder.all(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(0)),
                          dataRowHeight: 40,
                          headingRowColor: MaterialStateProperty.all(
                            CommonTheme.buttonBackgrooundCommonColor,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          columns: <DataColumn>[
                            DataColumn(
                              label: Text(
                                'S.No.',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Container(
                                child: Text(
                                  'PDF Title',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            DataColumn(
                                label: Icon(
                              Icons.download,
                              color: Colors.white,
                            )),
                          ],
                          rows: <DataRow>[
                            ...librarySearchData.map(
                              (e) {
                                return DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Center(
                                        child: Text(
                                          '${provider.digitalLibraryData.indexOf(e) + 1}',
                                          style: TextStyle(
                                            color: Color(0xFF767676),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        e['title'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Color(0xFF767676),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      InkWell(
                                        onTap: () {
                                          String url =
                                              provider.baseUrlToGetPdf +
                                                  e['attachment'];
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PDFViewerScreen(
                                                pdfUrl: url,
                                                pdfName: e['attachment'],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.download,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ).toList()
                          ],
                        ),
                      )
                    : SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
