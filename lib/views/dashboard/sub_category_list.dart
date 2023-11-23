import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/all_in_provider.dart';
import '../commonheader/common_header.dart';
import '../viewpdf/pdf_viewer.dart';

class SubCagegoryList extends StatelessWidget {
  const SubCagegoryList({super.key});

  getFileExtension(String fileName) {
    try {
      return "." + fileName.split('.').last;
    } catch (e) {
      return "null";
    }
  }

  @override
  Widget build(BuildContext context) {
    AllInProvider provider = Provider.of<AllInProvider>(context, listen: false);
    return Scaffold(
      appBar: CommonHeaderClass.commonAppBarHeader(
          "सचेतन", context, provider.dashboardSubCategoryTitle, "View"),
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
                provider.dashboardSubCategoryTitle,
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
                itemCount: provider.dashBoardSubCategoryListData.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: provider.iPadSize ? 3 : 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      provider.updateUserAccessLog(
                          "${provider.dashboardSubCategoryTitle}-> ${provider.dashBoardSubCategoryListData[index]['sub_category_title']}",
                          "View");

                      String url = provider.pdfSubPath +
                          provider.dashBoardSubCategoryListData[index]
                              ['uploads'];
                      print("${url}");

                      String ex = getFileExtension(provider
                          .dashBoardSubCategoryListData[index]['uploads']);

                      if (ex != ".pdf") {
                        provider.commonMethodForNTPCSafetyOpenPDF(url);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PDFViewerScreen(
                              pdfUrl: url,
                              pdfName:
                                  provider.dashBoardSubCategoryListData[index]
                                      ['uploads'],
                            ),
                          ),
                        );
                      }

// OLD WAYYYY
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => WebViewExample(
                      //       urlOfPDF:
                      //           "${provider.pdfSubPath}${provider.dashBoardSubCategoryListData[index]['uploads']}",
                      //     ),
                      //   ),
                      // );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFF8E00),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image.network(
                          //         "${provider.iconSubPath}${provider.dashBoardSubCategoryListData[index]['category_icon']}",
                          //         width: 20,
                          //       ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              provider.dashBoardSubCategoryListData[index]
                                  ['sub_category_title'],
                              style: provider.iPadSize
                                  ? TextStyle(
                                      color: Colors.white,
                                      fontSize: provider.textFontSize,
                                    )
                                  : TextStyle(
                                      color: Colors.white, fontSize: 20),
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
