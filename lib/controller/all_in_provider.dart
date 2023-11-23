import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:ntpc/common_theme/common_dialog.dart';
import 'package:ntpc/services/services.dart';
import 'package:ntpc/theme/common_theme.dart';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../auth/otp_screen.dart';

class AllInProvider with ChangeNotifier {
  // static String apiBaseUri =
  //     'https://ntpcsafety.solarman.in/api/'; //need to update api url from ?????

  // static String apiBaseUri = 'https://coalmining.ntpc.co.in/api';

  static String apiBaseUri = '';

  void showSnakeBar(String title, context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: CommonTheme.headerCommonColor,
        content: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        behavior: SnackBarBehavior.fixed,
        dismissDirection: DismissDirection.down,
      ),
    );
  }

  var created_by_user_id = "";
  var work_plan_id = "";
  var Id = "";
  var userToken = "";
  var userId = "";
  var location_id = "";
  String userImage = "";
  String username = "";
  String userEmail = "";
  String location_name = "";
  String safetyPerformanceStatisticsBaseUrl = "";

  String opt = "";

  String userRoleId = "";

  Future<void> login(Map<String, String> loginData, context) async {
    if (!await checkInternetAvailableOrNot()) {
      CommanDialog.showErrorDialog(context,
          description: "No Internet Connection");
      return;
    } else {
      CommanDialog.showLoading(context, title: 'Please wait...');
      try {
        var result = await APICall().postRequestNew('login', loginData);

        CommanDialog.hideLoading(context);
        if (result['status'] != null) {
          if (result['status'] == 200) {
            userToken = result['token'];
            userId = result['user']['id'].toString();
            opt = result['user']['otp'].toString();
            userRoleId = result['user']['role'].toString();
            location_id = result['user']['location'];
            location_name = result['location_name'][0]['plant_name'];
            // result['location_name'][008]['plant_name'];
            userEmail = result['user']['email'];
            username = result['user']['name'];
            userImage = "${result['filePath']}/${result['user']['photo']}";
            Map userInfo = {
              "user_id": userId,
              "user_token": userToken,
              "location_id": location_id,
              "userRoleId": userRoleId,
              "location_name": location_name,
              "email": userEmail,
              "image": userImage,
              "name": username
            };
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(data: userInfo),
              ),
            );
          }
          if (result['status'] == 401) {
            CommanDialog.showErrorDialog(
              context,
              description: result['message'],
            );
          }
        } else {
          CommanDialog.showErrorDialog(context, description: "null $result");
        }
      } catch (error) {
        CommanDialog.showErrorDialog(context, description: "Error $error");
      }
    }
  }

  Future<bool> checkInternetAvailableOrNot() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("Connected with Mobile");
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("Connected with Wifi");
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isUserLogedIn(context) async {
    getBaseUrlForApp(context);
    final _storage = const FlutterSecureStorage();
    final readDta = await _storage.read(key: 'isuser_login');

    if (readDta != null) {
      final userInfo = json.decode(readDta);
      userId = userInfo['user_id'];
      userToken = userInfo['user_token'];
      location_id = userInfo['location_id'];
      userEmail = userInfo['email'];
      userImage = userInfo['image'];
      username = userInfo['name'];
      userRoleId = userInfo['userRoleId'];
      location_name = userInfo["location_name"];
      return true;
    } else {
      return false;
    }

    // if (await GetStorage().read("isuser_login") != null) {
    //   final userINfo = await GetStorage().read("isuser_login");
    //   userId = userINfo['user_id'];
    //   userToken = userINfo['user_token'];
    //   location_id = userINfo['location_id'];
    //   userEmail = userINfo['email'];
    //   userImage = userINfo['image'];
    //   username = userINfo['name'];
    //   location_name = userINfo["location_name"];

    //   return true;
    // } else {
    //   return false;
    // }
  }

  List categoryList = [];
  void category(context) async {
    digitalLibraryData.clear();
    categoryList.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    var result = await APICall().getRequest('digital_library_category');
    CommanDialog.hideLoading(context);
    categoryList.addAll(result['data']);
    getDigitalLibraryAllList(context);
  }

  List subcategoryList = [];
  void getSubCategoryData(context, Map subcategoryRequiredData) async {
    subcategoryList.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');

    var result = await APICall().postRequest(
        'digital_library_sub_category_search', subcategoryRequiredData);
    CommanDialog.hideLoading(context);
    if (result['status'] == 'true') {
      subcategoryList.addAll(result['data']);

      notifyListeners();
    }
    if (result['status'] == 401) {
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

  List checkListData = [];
  List dailyCheckListFormDetails = [];
  List dropDownData = [];

  void getCheckList(context) async {
    checkListData.clear();
    dropDownData.clear();
    dailyCheckListFormDetails.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().getRequest('show_mst_dozer_maintainace_daily_record');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        dailyCheckListFormDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(dailyCheckListFormDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }

        checkListData.addAll(result['data']);

        notifyListeners();
        Navigator.pushNamed(context, '/daily_check_list');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  List talaipalliFormsList = [];
  void getTalaipalliFormsList(context) async {
    talaipalliFormsList.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    Map requiredData = {'location_id': location_id};
    var result = await APICall().postRequest('talaipalli_forms', requiredData);
    CommanDialog.hideLoading(context);
    if (result['status'] == 'true') {
      talaipalliFormsList.addAll(result['data']);
      Navigator.pushNamed(context, '/check_list');
    }
    if (result['status'] == 401) {
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

  String placementTimeDiffFromSiding = "";
  void getSidingTime(context, sidingValue, placementTime) async {
    talaipalliFormsList.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    Map requiredData = {'siding_D': sidingValue};
    var result = await APICall().postRequest('rake_siding', requiredData);
    CommanDialog.hideLoading(context);
    print("result $result");
    if (result['status'] == 'true') {
      print(result['data']);
      print("placementTime $placementTime");
      var format = DateFormat("HH:mm");
      var one = format.parse(placementTime);
      var two = format.parse(result['data']['drawout_time_V']);
      print("Diffrenece12345555 ${one.difference(two)}");
      placementTimeDiffFromSiding = one.difference(two).toString();
      placementTimeDiffFromSiding = placementTimeDiffFromSiding.substring(
          0, placementTimeDiffFromSiding.indexOf('.'));

      notifyListeners();
      // var timeDiffrence =
      //     DateUtils.getTimeDifference(placementTime, placementTime);
      // print("timeDiffrence $timeDiffrence");
    }
    if (result['status'] == 401) {
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

  void getBaseUrlForApp(context) async {
    var result = await APICall()
        .getRequest1('https://coalmining.ntpc.co.in/api/server_url');
    // .getRequest1('https://ntpcsafety.solarman.in/api/server_url');
    print(result);

    if (result['status'] == 'true') {
      apiBaseUri = "${result['data'][0]['url']}/api/";
      print("APi baseurl $apiBaseUri");
      return;
    }
    if (result['status'] == 401) {
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

  void updateCheckBoxConditionValue(value, outerIndex, innerINdex) {
    if (value) {
      checkListData[outerIndex]['data'][innerINdex]['condition'] = 1;
      notifyListeners();
    } else {
      checkListData[outerIndex]['data'][innerINdex]['condition'] = 0;
      notifyListeners();
    }
  }

  void updateCheckBoxConponentValue(value, outerIndex, innerINdex) {
    if (value) {
      checkListData[outerIndex]['data'][innerINdex]['components'] = 1;
      notifyListeners();
    } else {
      checkListData[outerIndex]['data'][innerINdex]['components'] = 0;
      notifyListeners();
    }
  }

  List formDataOfDailyCheckList = [];
  void getFormDataOfDailyCheckList(context, Map subcategoryRequiredData) async {
    subcategoryList.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    var result = await APICall().postRequest(
        'digital_library_sub_category_search', subcategoryRequiredData);
    CommanDialog.hideLoading(context);
    if (result['status'] == 'true') {
      subcategoryList.addAll(result['data']);

      notifyListeners();
    }
    if (result['status'] == 401) {
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

  List digitalLibraryData = [];
  String baseUrlToGetPdf = '';
  void getDigitalLibraryList(context, Map getDigitalLibraryList) async {
    digitalLibraryData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');

    var result = await APICall()
        .postRequest('digital_library_search', getDigitalLibraryList);
    CommanDialog.hideLoading(context);
    if (result['status'] == 'true') {
      baseUrlToGetPdf = result['filePath'];
      digitalLibraryData.addAll(result['data']);
      notifyListeners();
    }
    if (result['status'] == 401) {
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

  bool validateValue = true;
  void submitDailyCheckListFormData(context, requiredData) async {
    validateValue = true;
    CommanDialog.showLoading(context, title: 'Please wait...');

    if (validateValue) {
      try {
        var result = await APICall()
            .postRequest('dozer_maintainace_daily_record', requiredData);
        CommanDialog.hideLoading(context);
        if (result['status'] == 'true') {
          showSnakeBar('Your Data has been successfully uploaded', context);
          CommanDialog.hideLoading(context);
          CommanDialog.hideLoading(context);
        }
        if (result['status'] == 401) {
          showSnakeBar(
            result['message'],
            context,
          );
        }
      } catch (error) {}
    } else {}
  }

  void getDigitalLibraryAllList(context) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    digitalLibraryData.clear();
    Map requiredData = {
      'category_id': '',
      'sub_category_id': '',
    };

    var result =
        await APICall().postRequest('digital_library_search', requiredData);
    CommanDialog.hideLoading(context);
    if (result['status'] == 'true') {
      baseUrlToGetPdf = result['filePath'];
      digitalLibraryData.addAll(result['data']);

      notifyListeners();
      Navigator.pushNamed(context, '/library_screen');
    }
    if (result['status'] == 401) {
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

  List plantData = [];
  void getPlants(context) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    plantData.clear();
    try {
      var result = await APICall().getRequest('plants');

      CommanDialog.hideLoading(context);
      if (result['status'] == "true") {
        plantData.addAll(result['data']);
        Navigator.pushNamed(context, '/unsafe_location');
      }
    } catch (error) {}
  }

  List unsafeLocationList = [];
  String iconsPath = "";

  bool flagValue = true;
  void getUnsafeLocationList(context, bool flag) async {
    flagValue = flag;
    Map requiredData = {"plant_id": location_id};
    CommanDialog.showLoading(context, title: 'Please wait...');
    unsafeLocationList.clear();
    try {
      var result = await APICall().postRequest('location_search', requiredData);

      CommanDialog.hideLoading(context);
      if (result['status'] == "true") {
        iconsPath = result['filePath'];

        unsafeLocationList.addAll(result['data']);
        Navigator.pushNamed(context, '/location_screen');
      }
    } catch (error) {}
  }

  Map requiredDataToGetUnsafe_act_list = {
    "plant_id": "",
    "plant_name": "",
    "location_id": "",
    "location_name": ""
  };
  List getUnsafe_act_list = [];
  String imageDownloadLink = "";

  void getUnsafe_act_list_data(context) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    getUnsafe_act_list.clear();
    requiredDataToGetUnsafe_act_list['plant_id'] = location_id;
    requiredDataToGetUnsafe_act_list['user_id'] = userId;
    notifyListeners();
    try {
      var result = await APICall()
          .postRequest('unsafe_act_list', requiredDataToGetUnsafe_act_list);

      CommanDialog.hideLoading(context);
      if (result['status'] == "true") {
        imageDownloadLink = result['filePath'];

        getUnsafe_act_list.clear();
        getUnsafe_act_list.addAll(result['data']);
        notifyListeners();
        // Navigator.pushNamed(context, '/upload_screen');
        // Navigator.pushNamed(context, '/unsafe_act_list');
      }
      if (result['status'] == "false") {}
    } catch (error) {}
  }

  void getUnsafe_act_list_data1(context) async {
    getUnsafe_act_list.clear();
    try {
      var result = await APICall()
          .postRequest('unsafe_act_list', requiredDataToGetUnsafe_act_list);

      if (result['status'] == "true") {
        imageDownloadLink = result['filePath'];

        getUnsafe_act_list.addAll(result['data']);
        // Navigator.pushNamed(context, '/upload_screen');
        Navigator.pushNamed(context, '/unsafe_act_list');
      }
      if (result['status'] == "false") {
        Navigator.pushNamed(context, '/unsafe_act_list');
      }
    } catch (error) {}
  }

  String defaultSubValue = '';
  String defaultMainValue = '';

  updateCategoryId(context, id) {
    defaultMainValue = id!;

    subcategoryList.clear();
    defaultSubValue = '';
    notifyListeners();
    getSubCategoryData(context, {'category_id': defaultMainValue});
  }

  updateSubCategoryId(id) {
    defaultSubValue = id!;

    notifyListeners();
  }

  createNewIncident(context, Map requiredData) async {
    Map<String, String> requestDataToSend = {
      'incident_subject': requiredData['name'],
      'incident_discription': requiredData['description'],
      // 'plant_id': requiredDataToGetUnsafe_act_list['plant_id'].toString(),
      'plant_id': location_id,
      'location_id': requiredDataToGetUnsafe_act_list['location_id'].toString(),
      'user_id': "$userId",
      'unsafe_id': requiredData['unsafe_id']
    };

    String imageUrl = requiredData['image_path'].toString();

    CommanDialog.showLoading(context, title: 'Please wait...');
    var request =
        http.MultipartRequest('POST', Uri.parse('${apiBaseUri}unsafe_act'));
    request.fields.addAll(requestDataToSend);
    request.files.add(
      await http.MultipartFile.fromPath('incident_image', imageUrl),
    );

    http.StreamedResponse response = await request.send();
    CommanDialog.hideLoading(context);
    if (response.statusCode == 200) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/unsafe_act_list');
      showSnakeBar("Your Data has been successfully uploaded", context);
      // getUnsafe_act_list_data1(context);
    } else {}
  }

//Forms Section
  // 2. SATART
  List dozerMaintainaceWeekData = [];
  List dozerMaintainaceWeekDetails = [];
  void getDozerMaintainaceWeekData(context) async {
    dozerMaintainaceWeekData.clear();
    dozerMaintainaceWeekDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().getRequest('show_mst_dozer_maintainace_week');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        dozerMaintainaceWeekData.addAll(result['data']);
        dozerMaintainaceWeekDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(dozerMaintainaceWeekDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }
        notifyListeners();
        Navigator.pushNamed(context, '/dozer_maintainace_week');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitWeeklyCheckListFormData(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('dozer_maintainace_week_record', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  //Forms Section drill_maintainace_daily
  // 3. SATART
  List drillMaintainaceDailyData = [];
  List drillMaintainaceDailyDetails = [];
  void getDrillMaintainaceDailyData(context) async {
    drillMaintainaceDailyData.clear();
    drillMaintainaceDailyDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().getRequest('show_mst_drill_maintainace_daily');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        drillMaintainaceDailyData.addAll(result['data']);
        drillMaintainaceDailyDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(drillMaintainaceDailyDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }

        notifyListeners();
        Navigator.pushNamed(context, '/drill_maintainace_daily');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitDrillMaintainaceDailyData(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      // Map requiredData = {
      //   "LineItem_ID": json.encode(drillMaintainaceDailyData),
      //   'location_id': location_id,
      //   'user_id': userId
      // };
      var result = await APICall()
          .postRequest('drill_maintainace_daily_record', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  //Form Number 4 . Drill_maintainace_weekly  SATART
  List drillMaintainaceWeeklyData = [];
  List drillMaintainaceWeeklyDetails = [];
  void getdrillMaintainaceWeeklyData(context) async {
    drillMaintainaceWeeklyData.clear();
    drillMaintainaceWeeklyDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().getRequest('show_mst_drill_maintainace_weekly');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        drillMaintainaceWeeklyData.addAll(result['data']);
        drillMaintainaceWeeklyDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(drillMaintainaceWeeklyDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }
        notifyListeners();
        Navigator.pushNamed(context, '/drill_maintainace_weekly');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitDrillMaintainaceWeeklyData(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('drill_maintainace_weekly_record', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }
  //Form Number 4 . Drill_maintainace_weekly  END

//Forms Section show_mst_excavator_maintainace_daily
  // 5. SATART
  List excavatorMaintainaceDailyData = [];
  List excavatorMaintainaceDailyDetails = [];
  void getexcavatorMaintainaceDailyData(context) async {
    excavatorMaintainaceDailyData.clear();
    excavatorMaintainaceDailyDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().getRequest('show_mst_excavator_maintainace_daily');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        excavatorMaintainaceDailyData.addAll(result['data']);
        excavatorMaintainaceDailyDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(excavatorMaintainaceDailyDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }
        notifyListeners();
        Navigator.pushNamed(context, '/excavator_maintainace_daily');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitExcavatorMaintainaceDailyData(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      // Map requiredData = {
      //   "LineItem_ID": json.encode(excavatorMaintainaceDailyData),
      //   'location_id': location_id,
      //   'user_id': userId,
      // };
      var result = await APICall()
          .postRequest('excavator_maintainace_daily_record', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  //Form Number 6 . show_mst_explosive_van_maintainace_daily  SATART
  List explosiveVanMaintainaceDailyData = [];
  List explosiveVanMaintainaceDailyDetails = [];
  void getExplosiveVanMaintainaceDailyData(context) async {
    explosiveVanMaintainaceDailyData.clear();
    explosiveVanMaintainaceDailyDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .getRequest('show_mst_explosive_van_maintainace_daily');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        explosiveVanMaintainaceDailyData.addAll(result['data']);
        explosiveVanMaintainaceDailyDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(explosiveVanMaintainaceDailyDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }
        notifyListeners();
        Navigator.pushNamed(context, '/explosive_van_maintainace_daily');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitExplosiveVanMaintainaceDailyData(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      // Map requiredData = {
      //   "LineItem_ID": json.encode(explosiveVanMaintainaceDailyData),
      //   'location_id': location_id,
      //   'user_id': userId
      // };
      var result = await APICall()
          .postRequest('explosive_van_maintainace_daily', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }
  //Form Number 6 . Drill_maintainace_weekly  END

  //Form Number 7 . show_mst_explosive_van_maintainace_daily  SATART
  List explosiveVanMaintainaceweeklyData = [];
  List explosiveVanMaintainaceweeklyDetails = [];
  void getExplosiveVanMaintainaceweeklyData(context) async {
    explosiveVanMaintainaceweeklyData.clear();
    explosiveVanMaintainaceweeklyDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .getRequest('show_mst_explosive_van_maintainace_weekly');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        explosiveVanMaintainaceweeklyData.addAll(result['data']);
        explosiveVanMaintainaceweeklyDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(explosiveVanMaintainaceDailyDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }

        notifyListeners();
        Navigator.pushNamed(context, '/explosive_van_maintainace_weekly');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitExplosiveVanMaintainaceweeklyData(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('explosive_van_maintainace_weekly_record', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }
  //Form Number 7 . Drill_maintainace_weekly  END

  //Form Number 9 . show_mst_explosive_van_maintainace_daily  SATART
  List showMstGraderMaintainaceweeklyData = [];
  List showMstGraderMaintainaceweeklyDetails = [];
  String formTilte = "";
  int formNumberData = 0;
  void getshowMstGraderMaintainaceweeklyData(
      context, String title, String endPoint, formnumber) async {
    formNumberData = formnumber;
    formTilte = title;
    showMstGraderMaintainaceweeklyData.clear();
    showMstGraderMaintainaceweeklyDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall().getRequest('$endPoint');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showMstGraderMaintainaceweeklyData.addAll(result['data']);
        showMstGraderMaintainaceweeklyDetails.addAll(result['details']);
        for (int i = 0;
            i <
                int.parse(
                    showMstGraderMaintainaceweeklyDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }
        notifyListeners();
        Navigator.pushNamed(context, '/show_mst_grader_maintainace_weekly');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitshowMstGraderMaintainaceweeklyData(
      context, String endPoint, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall().postRequest('$endPoint', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }
  //Form Number 9 . Drill_maintainace_weekly  END

  void ntpcSafetyPlicy(context) {}

  void ntpcSafetyAndHealth(context) {}
  List notificationListForDozerDaily = [];
  void getNotificationsForDozerDaily(context) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    notificationListForDozerDaily.clear();
    try {
      var result = await APICall().postRequest(
          'notification', {"user_id": userId, "location": location_id});
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        notificationListForDozerDaily.addAll(result['data']);
        Navigator.pushNamed(context, '/notifications');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  String ishazardsOrSubhazards = "";
  void getESMPData(context, endPoint,
      hazardsOrSubhazardsorprinciplehazardFlagtoShowData) async {
    ishazardsOrSubhazards = hazardsOrSubhazardsorprinciplehazardFlagtoShowData;
    CommanDialog.showLoading(context, title: 'Please wait...');
    eSMPData.clear();
    try {
      var result =
          await APICall().postRequest('$endPoint', {"location": location_id});
      CommanDialog.hideLoading(context);
      if (result['status'] == 'True') {
        eSMPData.addAll(result['data']);

        Navigator.pushNamed(context, '/esmp_list');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }
  //list of prinples

  bool isshazardsOrSubhazards = true;
  void getsESMPData(context, endPoint, hazardsOrSubhazardss) async {
    isshazardsOrSubhazards = hazardsOrSubhazardss;
    CommanDialog.showLoading(context, title: 'Please wait...');
    eSMPData.clear();
    try {
      var result =
          await APICall().postRequest('$endPoint', {"location": location_id});
      CommanDialog.hideLoading(context);
      if (result['status'] == 'True') {
        eSMPData.addAll(result['data']);

        Navigator.pushNamed(context, '/esmp_list');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  //hazadrdview
  List hazadrdview = [];
  void gethazadrdview(context) async {
    hazadrdview.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    Map requiredData1 = {"location_project_id": location_id};
    print("request data $requiredData1");
    var result = await APICall()
        .postRequest('List_of_hazard_ControlPlans', requiredData1);

    CommanDialog.hideLoading(context);
    if (result['status'] == 'True') {
      hazadrdview.addAll(result['data']);
      notifyListeners();
      log("$hazadrdview");
      Navigator.pushNamed(context, '/listofhazardcontrolpansview');
    } else {
      showSnakeBar(
        result['message'],
        context,
      );
    }
    if (result['status'] == 200) {
      //log("$hazadrdview");
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

//work_plan_by_id
  List Workpanbyid = [];

  void getWorkpanbyid(context, id) async {
    Workpanbyid.clear();

    CommanDialog.showLoading(context, title: 'Please wait...');

    Map requiredData = {
      'id': id,
      // 'location': location_id,
    };
    var result = await APICall().postRequest('work_plan_by_id', requiredData);
    CommanDialog.hideLoading(context);
    if (result['status'] == 'True') {
      Workpanbyid.addAll(result['data']);
      notifyListeners();
      log("Data $Workpanbyid");

      Navigator.pushNamed(context, '/getWorkpanbyid');
    }

    if (result['status'] == 200) {
      log("checkListData");
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

//viewesmpcontrolpans
  List viewesmpcontrolpans = [];

  void getviewesmpcontrolpans(context, id) async {
    Workpanbyid.clear();

    CommanDialog.showLoading(context, title: 'Please wait...');

    Map requiredData = {
      'id': id,
      'location': location_id,
    };
    var result = await APICall().postRequest('work_plan_by_id', requiredData);
    CommanDialog.hideLoading(context);
    if (result['status'] == 'True') {
      Workpanbyid.addAll(result['data']);
      notifyListeners();

      Navigator.pushNamed(context, '/getviewesmpcontrolpans');
    }

    if (result['status'] == 200) {
      log("checkListData");
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

  //Responsibility
  List Responsibility = [];

  void getResponsibility(context) async {
    Responsibility.clear();

    Map requiredData = {
      'location': location_id,
    };
    var result =
        await APICall().postRequest('user_list_by_location', requiredData);
    if (result['status'] == 'True') {
      Responsibility.addAll(result['data']);
      notifyListeners();
    }
    if (result['status'] == 200) {
      log("checkListData");
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

  //submitformesmps
  void submitformesmps(
    context,
    requiredDataToSend,
  ) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('add_new_action_to_work_plan', requiredDataToSend);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully  created', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      } else {
        log("result of else condition $result");
        showSnakeBar(result['message'], context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 422) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  List eSMPData = [];

  List myHazardsData = [];
  void getMyHazardsData(context) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    myHazardsData.clear();
    try {
      var result =
          await APICall().postRequest('hazard_alert', {"user_id": userId});
      CommanDialog.hideLoading(context);
      if (result['status'] == 'True') {
        log("result ${result['data']}");
        myHazardsData.addAll(result['data']);
        Navigator.pushNamed(context, '/my_hazards_data');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  //Get Events
  List eventData = [];
  var baseUrlForShowingEventImages = "";
  void getAllEvent(context) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    eventData.clear();
    try {
      var result = await APICall()
          .postRequest('event_list', {"location_id": location_id});
      CommanDialog.hideLoading(context);
      print(result);
      if (result['status'] == 'True') {
        baseUrlForShowingEventImages = result['filePath'];
        eventData.addAll(result['data']);
        Navigator.pushNamed(context, '/event_calendar');
      }
      if (result['status'] == 'false') {
        showSnakeBar(
          result['title'],
          context,
        );
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  //Get Events
  List dataOfSafetyPerformanceStatics = [];
  void getDataOfSafetyPerformanceStatics(context) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    dataOfSafetyPerformanceStatics.clear();
    try {
      var result = await APICall().getRequest('incident_report_pdf_list');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'True') {
        safetyPerformanceStatisticsBaseUrl = result['filePath'];
        dataOfSafetyPerformanceStatics.addAll(result['data']);
        Navigator.pushNamed(context, '/safety_performance_staticsScreen');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  //Quiz Section  Start
  List quizCategoryList = [];
  void getQuizCategoryList(context) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    quizCategoryList.clear();
    try {
      var result = await APICall().getRequest('quiz_category');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'True') {
        quizCategoryList.addAll(result['data']);

        Navigator.pushNamed(context, '/quiz_category_list');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  List quizData = [];
  void getQuizData(context, id) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    quizData.clear();
    try {
      var result = await APICall().postRequest('quiz_question', {'id': id});
      CommanDialog.hideLoading(context);
      if (result['status'] == 'True') {
        quizData.addAll(result['data']);

        Navigator.pushNamed(context, '/quiz_screen');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  int userPercentage = 0;
  int wrongQ = 0;
  int ommitedQuestion = 0;
  int totalRight = 0;
  void quizResult(context) {
    userPercentage = 0;
    wrongQ = 0;
    ommitedQuestion = 0;
    totalRight = 0;
    int totalRightAnswers = 0;

    for (int i = 0; i < quizData.length; i++) {
      if (quizData[i]['answer_status'] == 0) {
        ommitedQuestion++;
      }
      if (quizData[i]['answer_status'] == 1) {
        totalRightAnswers++;
      }
      if (quizData[i]['answer_status'] == 2) {
        wrongQ++;
      }
    }
    userPercentage = ((totalRightAnswers / quizData.length) * 100).round();
    totalRight = totalRightAnswers;
    CommanDialog.hideLoading(context);
    Navigator.pushNamed(context, '/quiz_result_screen');
    submitPaper(context);
  }

  void submitPaper(context) async {
    // Map requestData = {
    //   "user_id": userId,
    //   "location_id": location_id,
    //   "Data": quizData
    // };
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('${apiBaseUri}quiz_record'));
      request.fields.addAll({
        'user_id': userId,
        'location_id': location_id,
        'Data': json.encode(quizData)
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
      } else {}
    } catch (error) {}

    // try {
    //   var result = await APICall().postRequest('quiz_record', requestData);
    //   if (result['status'] == 'True') {}
    //   if (result['status'] == 401) {
    //     showSnakeBar(
    //       result['message'],
    //       context,
    //     );
    //   }
    // } catch (error) {

    // }
  }

  //Quiz Section End

  //Social Wall Section Start
  List socialWallData = [];
  String socialBaseUrl = "";
  void getAllSocialPost(context, status) async {
    if (status) {
      CommanDialog.showLoading(context, title: 'Please wait...');
    } else {
      CommanDialog.refereshScreen(context, title: 'Please wait...');
    }

    socialWallData.clear();
    try {
      var result =
          await APICall().postRequest('social_post_list', {"user_id": userId});
      print(result);

      CommanDialog.hideLoading(context);
      if (result['status'] == 'True') {
        socialBaseUrl = result['filePath'];
        socialWallData.addAll(result['data']);
        notifyListeners();
        if (status) {
          Navigator.pushNamed(context, '/social_post_list');
        }
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {
      print("Error $error");
    }
  }

  void likeSocialWallPost(context, Map requestData, index) async {
    if (socialWallData[index]['like'] == 1) {
      socialWallData[index]['like'] = 0;
      socialWallData[index]['Totallikes'] =
          socialWallData[index]['Totallikes'] - 1;
    } else {
      socialWallData[index]['like'] = 1;
      if (socialWallData[index]['deslike'] != 0) {
        socialWallData[index]['TotalDislikes'] =
            socialWallData[index]['TotalDislikes'] - 1;
        socialWallData[index]['deslike'] = 0;
      }
      socialWallData[index]['Totallikes'] =
          socialWallData[index]['Totallikes'] + 1;
    }
    notifyListeners();

    try {
      var result = await APICall().postRequest('social_post_like', requestData);
      if (result['status'] == 'True') {}
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void dislikeSocialWallPost(context, Map requestData, index) async {
    if (socialWallData[index]['deslike'] == 1) {
      socialWallData[index]['deslike'] = 0;
      socialWallData[index]['TotalDislikes'] =
          socialWallData[index]['TotalDislikes'] - 1;
    } else {
      socialWallData[index]['deslike'] = 1;
      if (socialWallData[index]['like'] != 0) {
        socialWallData[index]['Totallikes'] =
            socialWallData[index]['Totallikes'] - 1;
        socialWallData[index]['like'] = 0;
      }
      socialWallData[index]['TotalDislikes'] =
          socialWallData[index]['TotalDislikes'] + 1;
    }
    notifyListeners();

    try {
      var result = await APICall().postRequest('social_post_like', requestData);
      if (result['status'] == 'True') {}
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  List socialPostCommentList = [];
  Map singlePost = {};
  int singlePostID = 0;

  void getAllComment(context, postID, singlePostData, status) async {
    socialPostCommentList.clear();
    singlePostID = postID;
    singlePost.addAll(singlePostData);
    CommanDialog.showLoading(context, title: 'Please wait...');

    try {
      var result = await APICall()
          .postRequest('total_comment', {"post_id": postID, "user_id": userId});
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        socialPostCommentList.addAll(result['data']);
        log("ll $socialPostCommentList");
        notifyListeners();
        if (status) {
          Navigator.pushNamed(context, '/social_comment');
        }
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {
      print(error);
    }
  }

  void refreshCommentData(context) async {
    socialPostCommentList.clear();

    try {
      var result = await APICall().postRequest(
          'total_comment', {"post_id": singlePostID, "user_id": userId});

      if (result['status'] == 'true') {
        socialPostCommentList.addAll(result['data']);
        notifyListeners();
        refereshSocialPost(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {
      print(error);
    }
  }

  void refereshSocialPost(context) async {
    socialWallData.clear();
    try {
      var result =
          await APICall().postRequest('social_post_list', {"user_id": userId});
      if (result['status'] == 'True') {
        socialBaseUrl = result['filePath'];
        socialWallData.addAll(result['data']);
        notifyListeners();
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {
      print("Error $error");
    }
  }

  void addCommentOnPost(
    context,
    requestData,
  ) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().postRequest('social_post_comment', requestData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        getAllComment(context, singlePostID, singlePost, false);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void blockUser(
    context,
    blockId,
  ) async {
    print(blockId);
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var request = http.Request(
          'POST',
          Uri.parse(
              '${apiBaseUri}block_profile?user_id=$userId&blocked_user_id=$blockId'));

      http.StreamedResponse response = await request.send();
      CommanDialog.hideLoading(context);

      if (response.statusCode == 200) {
        Map data = json.decode(await response.stream.bytesToString());
        print("API Send Media Respionse $data");
        refreshCommentData(context);
        blockList(context, true);
        // CommanDialog.showErrorDialog(context, description: "User has blocked");
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {}
  }

  List userBlockList = [];
  String userBlockListFilePath = '';
  void blockList(context, status) async {
    userBlockList.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var request = http.Request('GET',
          Uri.parse('${apiBaseUri}blocked_profile_list?user_id=$userId'));

      http.StreamedResponse response = await request.send();
      CommanDialog.hideLoading(context);
      if (response.statusCode == 200) {
        Map data = json.decode(await response.stream.bytesToString());
        print("Block List $data");
        userBlockList.addAll(data['data']);
        userBlockListFilePath = data['filepath'];
        notifyListeners();
        if (status) {
          Navigator.pop(
            context,
          );
          Navigator.pushNamed(context, '/blocked_list_list');
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {}
  }

  void activeUser(
    context,
    blockId,
  ) async {
    print(blockId);
    CommanDialog.showLoading(context, title: 'Please wait...');

    print(
        '${apiBaseUri}active_profile?user_id=$userId?blocked_user_id=$blockId');
    try {
      var request = http.Request(
          'POST',
          Uri.parse(
              '${apiBaseUri}active_profile?user_id=$userId&blocked_user_id=$blockId'));
      http.StreamedResponse response = await request.send();
      CommanDialog.hideLoading(context);
      if (response.statusCode == 200) {
        Map data = json.decode(await response.stream.bytesToString());
        print("API Send Media Respionse $data");
        blockList(context, false);
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {}
  }

  void removeUser(
    context,
    idToRemoveUser,
  ) async {
    print(idToRemoveUser);
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var request = http.Request(
        'GET',
        Uri.parse(
            '${apiBaseUri}remove_profile?user_id=$userId&remove_user_id=$idToRemoveUser'),
      );
      http.StreamedResponse response = await request.send();
      CommanDialog.hideLoading(context);

      if (response.statusCode == 200) {
        Map data = json.decode(await response.stream.bytesToString());
        print("API Send Media Respionse $data");
        // CommanDialog.showErrorDialog(context, description: "User has blocked");
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {}
  }

  //Social wall section end

  //Edit Profile Section Start
  void editProfile(
    context,
    requestData,
  ) async {
    // CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${apiBaseUri}edit_profile/$userId'),
      );

      request.files
          .add(await http.MultipartFile.fromPath('photo', '$requestData'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Map data = json.decode(await response.stream.bytesToString());

        userImage = "${data['filePath']}${data['data']['photo']}";

        notifyListeners();

        Map userInfo = {
          "user_id": userId,
          "user_token": userToken,
          "location_id": location_id,
          "location_name": location_name,
          "email": userEmail,
          "image": userImage,
          "name": username,
          "userRoleId": userRoleId
        };
        final _storage = const FlutterSecureStorage();
        final userDataLocal = json.encode(userInfo);
        await _storage.write(key: 'isuser_login', value: userDataLocal);
      } else {}
    } catch (error) {}
  }
  //Edit Profile Section End

  //DashBoard Section Start

  List dashBoardCategoryListData = [];
  String iconPath = "";
  String pdfPath = "";
  void getDashBoardCategoryList(context, String lang) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    dashBoardCategoryListData.clear();
    try {
      var result = await APICall()
          .postRequest('category_list', {"language_type": "$lang"});
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        dashBoardCategoryListData.addAll(result['data']);
        iconPath = result['filePath'];
        pdfPath = result['pdf_link'];

        Navigator.pushNamed(context, '/dashboard_screen');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  List dashBoardSubCategoryListData = [];
  String iconSubPath = "";
  String pdfSubPath = "";
  String dashboardSubCategoryTitle = "";
  void getDashBoardSubCategoryList(
      context, id, dashboardSubCategoryTitle) async {
    this.dashboardSubCategoryTitle = dashboardSubCategoryTitle;
    CommanDialog.showLoading(context, title: 'Please wait...');
    dashBoardSubCategoryListData.clear();
    try {
      var result =
          await APICall().postRequest('subcategory_list', {'category_id': id});
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        dashBoardSubCategoryListData.addAll(result['data']);
        pdfSubPath = result['filePath'];

        Navigator.pushNamed(context, '/sub_category_list');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  //DashBoard Section End

  //work plan action pending with me submit  // Start

  void submitPendingWork(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');

    try {
      var result =
          await APICall().postRequest('work_plan_feedback', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'True') {
        showSnakeBar(
          "Data Submitted Successfully",
          context,
        );
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  //work plan action pending with me submit  // End

  //Submit User Activicity Logs Start
  String deviceName = "";
  String deviceIPAddress = "";

  Future<void> getUserDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    var deviceData = <String, dynamic>{};
    final info = NetworkInfo();
    var ipAddress = await info.getWifiIP();

    deviceIPAddress = ipAddress.toString();

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);

        deviceName = deviceData['device'];
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);

        deviceName = deviceData['name'];
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'displaySizeInches':
          ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': build.displayMetrics.widthPx,
      'displayWidthInches': build.displayMetrics.widthInches,
      'displayHeightPixels': build.displayMetrics.heightPx,
      'displayHeightInches': build.displayMetrics.heightInches,
      'displayXDpi': build.displayMetrics.xDpi,
      'displayYDpi': build.displayMetrics.yDpi,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Future<void> updateUserAccessLog(accessScreenName, pageAction) async {
    Map<String, String> requestRequiredData = {
      'user_id': "$userId",
      'page_name': "$accessScreenName",
      'page_action': "$pageAction",
      'phone_details': "$deviceName",
      "ip_address": "$deviceIPAddress"
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${apiBaseUri}user_access_log'),
    );
    request.fields.addAll({
      'user_id': "$userId",
      'page_name': "$accessScreenName",
      'page_action': "$pageAction",
      'phone_details': "$deviceName",
      "ip_address": "$deviceIPAddress"
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    } else {}
  }

  //Submit user Activicity Logs End

  bool iPadSize = false;
  double imageSize = 35;
  double textFontSize = 30;
  double sideBarSize = 18;
  Future<void> isDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo info = await deviceInfo.iosInfo;
    if (info.name != null) {
      if (info.name!.toLowerCase().contains("ipad")) {
        iPadSize = true;
        notifyListeners();
      } else {
        iPadSize = false;
        notifyListeners();
      }
    }
  }

  // Get other user profile Start

  List otherUserData = [];
  String otherUserImagePath = "";
  Map commentDataToReportUserFromProfile = {};
  Future<void> getOtehrUserProfile(id, context, data) async {
    commentDataToReportUserFromProfile = data;
    otherUserData.clear();
    var request = http.MultipartRequest(
        'POST', Uri.parse('${apiBaseUri}user_profile_details'));
    request.fields.addAll({'user_id': '$id'});

    CommanDialog.showLoading(context);
    http.StreamedResponse response = await request.send();
    CommanDialog.hideLoading(context);

    if (response.statusCode == 200) {
      Map data = json.decode(await response.stream.bytesToString());

      otherUserData.addAll(data['data']);

      print("otherUserData $otherUserData");
      otherUserImagePath = data['filepath'];

      Navigator.pushNamed(context, '/get_other_user_profile');
    } else {}
  }

  reportUser(Map<String, String> requiredData, context) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${apiBaseUri}user_report_profile'));
    request.fields.addAll(requiredData);
    CommanDialog.showLoading(context);
    http.StreamedResponse response = await request.send();
    CommanDialog.hideLoading(context);
    CommanDialog.hideLoading(context);

    if (response.statusCode == 200) {
      Map data = json.decode(await response.stream.bytesToString());
      CommanDialog.showErrorDialog(context, description: "User has reported");
    } else {}
  }

  // Get other user profile ENd

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<bool> initPlatformState() async {
    bool jailbroken;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      jailbroken = await FlutterJailbreakDetection.jailbroken;
    } on PlatformException {
      jailbroken = true;
    }
    return jailbroken;
  }

  /// OPen Files
  void commonMethodForNTPCSafetyOpenPDF(_url) async {
    print("_url $_url");
    try {
      final Uri urlTwitter = Uri.parse(_url);
      await launchUrl(
        urlTwitter,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      print("Error $e");
    }
  }

  //ADD THRIVENIS FROMS

// thriveni froms 1

  List DailyInspectionChecklistData = [];
  List DailyInspectionChecklistDetails = [];

  void getDailyInspectionChecklistData(context) async {
    DailyInspectionChecklistData.clear();
    DailyInspectionChecklistDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().getRequest('show_daily_inspection_checklist');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        DailyInspectionChecklistData.addAll(result['data']);
        DailyInspectionChecklistDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(DailyInspectionChecklistDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }
        notifyListeners();
        Navigator.pushNamed(context, '/Daily Inspection Checklist');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitDailyInspectionChecklistFormData(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('daily_inspection_checklist_store', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  // thriveni froms 2

  List prestartcheckinEveryshiftinLineData = [];
  List prestartcheckinEveryshiftinLineDetails = [];

  void getprestartcheckinEveryshiftinLineData(context) async {
    prestartcheckinEveryshiftinLineData.clear();
    prestartcheckinEveryshiftinLineDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .getRequest('show_pre_start_check_in_every_shift_in_line');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        prestartcheckinEveryshiftinLineData.addAll(result['data']);
        prestartcheckinEveryshiftinLineDetails.addAll(result['details']);
        for (int i = 0;
            i <
                int.parse(
                    prestartcheckinEveryshiftinLineDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }
        notifyListeners();
        Navigator.pushNamed(context, '/prestart checkin Every shift in Line');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitprestartcheckinEveryshiftinLineFormData(
      context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall().postRequest(
          'pre_start_check_in_every_shift_in_line_store', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  // thriveni froms 3

  List dailychecksheetData = [];
  List dailychecksheetDetails = [];

  void getdailychecksheetData(context) async {
    dailychecksheetData.clear();
    dailychecksheetDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall().getRequest('show_daily_check_sheet');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        dailychecksheetData.addAll(result['data']);
        dailychecksheetDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(dailychecksheetDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }
        notifyListeners();
        Navigator.pushNamed(context, '/daily checks sheet');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitdailychecksheetFormData(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().postRequest('daily_check_sheet_store', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  // thriveni froms 4

  List dailypreshiftchecksheetData = [];
  List dailypreshiftchecksheetDetails = [];

  void getdailypreshiftchecksheetData(context) async {
    dailypreshiftchecksheetData.clear();
    dailypreshiftchecksheetDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().getRequest('show_daily_pre_shiftcheck_sheet');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        dailypreshiftchecksheetData.addAll(result['data']);
        dailypreshiftchecksheetDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(dailypreshiftchecksheetDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }
        notifyListeners();
        Navigator.pushNamed(context, '/daily pre shift check sheet');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitdailypreshiftchecksheetFormData(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('daily_preshift_check_sheet_store', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  // thriveni froms 5

  List operatorsafetychecklistData = [];
  List operatorsafetychecklistDetails = [];

  void getoperatorsafetychecklistData(context) async {
    operatorsafetychecklistData.clear();
    operatorsafetychecklistDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall().getRequest('show_Operator_Safety_Checklist');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        operatorsafetychecklistData.addAll(result['data']);
        operatorsafetychecklistDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(operatorsafetychecklistDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }
        notifyListeners();
        Navigator.pushNamed(context, '/operator safety check list');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitoperatorsafetychecklistFormData(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('Operator_Safety_Checklist_store', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

// thriveni froms 6

  List shovelprestartchecklistData = [];
  List shovelprestartchecklistDetails = [];

  void getshovelprestartchecklistData(context) async {
    shovelprestartchecklistData.clear();
    shovelprestartchecklistDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().getRequest('show_shovel_pre_start_checklist');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        shovelprestartchecklistData.addAll(result['data']);
        shovelprestartchecklistDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(shovelprestartchecklistDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }
        notifyListeners();
        Navigator.pushNamed(context, '/shovel pre start check list');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitshovelprestartchecklistFormData(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('shovel_pre_start_checklist_record', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  // thriveni froms 7

  List dailymaintenacechecklistData = [];
  List dailymaintenacechecklistDetails = [];

  void getdailymaintenacechecklistData(context) async {
    dailymaintenacechecklistData.clear();
    dailymaintenacechecklistDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().getRequest('show_daily_maintenance_check_list');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        dailymaintenacechecklistData.addAll(result['data']);
        dailymaintenacechecklistDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(dailymaintenacechecklistDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }
        notifyListeners();
        Navigator.pushNamed(context, '/daily maintenace check list');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitdailymaintenacechecklistFormData(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('daily_maintenance_check_list_record', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  //thriveni froms 8

  List excavatordailychecklistData = [];
  List excavatordailychecklistDetails = [];

  void getexcavatordailychecklistData(context) async {
    excavatordailychecklistData.clear();
    excavatordailychecklistDetails.clear();
    dropDownData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall().getRequest('show_excavator_daily_checklist');
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        excavatordailychecklistData.addAll(result['data']);
        excavatordailychecklistDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(excavatordailychecklistDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }
        notifyListeners();
        Navigator.pushNamed(context, '/excavator daily check list');
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  void submitexcavatordailychecklistFormData(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('excavator_daily_checklist_record', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  //addcmhfrom

  void Cmhq(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().postRequest('cmhq_form_record', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully uploaded', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      } else {
        showSnakeBar('Your Form is already has been with same Date.', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  //cmhqformupdate
  void Cmhqupdatee(context, requiredData) async {
    log("Required Data $requiredData");
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().postRequest('update_cmhq_form_record', requiredData);
      CommanDialog.hideLoading(context);
      print("result $result");
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully update', context);
        // CommanDialog.hideLoading(context);
        // CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  ///add viewcmhfrome
  List Cmhqview = [];
  void getCmhqview(context) async {
    Cmhqview.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    Map requiredData = {
      'id': Id,
      // 'user_id':userId,
      'location': location_id,
    };
    var result = await APICall().postRequest('cmhq_filled_list', requiredData);

    CommanDialog.hideLoading(context);
    if (result['status'] == 'true') {
      Cmhqview.addAll(result['data']);
      notifyListeners();
      log("$Cmhqview");
      Navigator.pushNamed(context, '/getCmhqview');
    }
    if (result['status'] == 200) {
      log("$getCmhqview");
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

//viewcmhfrome Edit
  List Cmhqupdate = [];
  void getCmhqupdate(context, id) async {
    Cmhqupdate.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    Map requiredData = {
      'id': id,
      'location': location_id,
    };
    var result =
        await APICall().postRequest('edit_cmhq_form_record', requiredData);
    CommanDialog.hideLoading(context);
    if (result['status'] == 'true') {
      Cmhqupdate.addAll(result['data']);
      notifyListeners();
      log("Data $Cmhqupdate");
      Navigator.pushNamed(context, '/getCmhqupdate');
    }

    if (result['status'] == 200) {
      log("checkListData");
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

  //raklodingformsfist
  void rakloding(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('RakeLoadingDetailsMonitored_CmhqRecord', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully  created', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      } else {
        showSnakeBar('Your Form is already has been with same Date.', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  //raklodingformsfistview

  List rakeview = [];
  void getrakeview(context) async {
    rakeview.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    Map requiredData = {
      'id': Id,
      // 'user_id':userId,
      'location': location_id,
    };
    var result = await APICall()
        .postRequest('RakeLoadingDetailsMonitored_list', requiredData);
    CommanDialog.hideLoading(context);
    if (result['status'] == 'true') {
      rakeview.addAll(result['data']);
      notifyListeners();
      log("$rakeview");
      Navigator.pushNamed(context, '/getrakeview');
    }
    if (result['status'] == 200) {
      log("$getrakeview");
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

  //raklodingEdit
  List raklodingupdate = [];
  void getraklodingupdate(context, id) async {
    raklodingupdate.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    Map requiredData = {
      'id': id,
      'location': location_id,
    };
    var result = await APICall()
        .postRequest('edit_RakeLoadingDetailsMonitored_record', requiredData);
    CommanDialog.hideLoading(context);
    if (result['status'] == 'true') {
      raklodingupdate.addAll(result['data']);
      notifyListeners();
      log("Getting Data $raklodingupdate");
      Navigator.pushNamed(context, '/getraklodingupdate');
    }
    if (result['status'] == 200) {
      log("checkListData");
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

//raklodingupdatefrome
  void raklodingupdatefrome(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall().postRequest(
          'update_RakeLoadingDetailsMonitored_record', requiredData);
      CommanDialog.hideLoading(context);
      print("result $result");
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully update', context);
        // CommanDialog.hideLoading(context);
        // CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

//Hemmsytemfrom

  void Hemmsytemfromm(context, requiredData) async {
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('CopyOf_HEMM_MonitoringSystem_CmhqRecord', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        showSnakeBar('Your Data has been successfully  created', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      } else {
        showSnakeBar('Your Form is already has been with same Date.', context);
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

  // Hemmsytemfromview
  List Hemmsytemfromview = [];
  void getHemmsytemfromview(context) async {
    Hemmsytemfromview.clear();

    CommanDialog.showLoading(context, title: 'Please wait...');

    Map requiredData = {
      'id': Id,
      // 'user_id':userId,
      'location': location_id,
    };
    var result = await APICall()
        .postRequest('CopyOf_HEMM_MonitoringSystem_list', requiredData);
    CommanDialog.hideLoading(context);
    if (result['status'] == 'true') {
      Hemmsytemfromview.addAll(result['data']);
      notifyListeners();
      log("$rakeview");
      Navigator.pushNamed(context, '/getHemmsytemfromview');
    }
    if (result['status'] == 200) {
      log("$getrakeview");
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }
//Hemmsystemeditandedit

  List Hemmsystemeditandupdate = [];

  void getHemmsystemeditandupdate(context, id) async {
    Hemmsystemeditandupdate.clear();

    CommanDialog.showLoading(context, title: 'Please wait...');

    Map requiredData = {
      'id': id,
      'location': location_id,
    };
    var result = await APICall()
        .postRequest('edit_CopyOf_HEMM_MonitoringSystem_record', requiredData);
    CommanDialog.hideLoading(context);
    if (result['status'] == 'true') {
      Hemmsystemeditandupdate.addAll(result['data']);
      notifyListeners();
      log("Data $Hemmsystemeditandupdate");

      Navigator.pushNamed(context, '/getHemmsystemeditandupdate');
    }

    if (result['status'] == 200) {
      log("checkListData");
      showSnakeBar(
        result['message'],
        context,
      );
    }
  }

  //HemmMonitoringsystemupdate

  void HemmMonitoringsystemupdatefrome(context, requiredData) async {
    log("Required Data $requiredData");
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall().postRequest(
          'update_CopyOf_HEMM_MonitoringSystem_record', requiredData);
      CommanDialog.hideLoading(context);
      print("result $result");
      if (result['status'] == 'true') {
        CommanDialog.hideLoading(context);
        showSnakeBar('Your Data has been successfully update', context);
        // CommanDialog.hideLoading(context);
      }
      if (result['status'] == 401) {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {}
  }

//Animation Video api
  List animationVideoListData = [];
  String videoBaseUrl = "";
  void getAnimationVideoList(context) async {
    animationVideoListData.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('animation_video_sachetan', {"location": location_id});
      CommanDialog.hideLoading(context);
      print("Result $result");
      if (result['status'] == 'true') {
        animationVideoListData.addAll(result['data']);
        videoBaseUrl = result['filepath'];
        Navigator.pushNamed(context, '/animation_video');
      }
      if (result['status'] == "false") {
        log("checkListData");
        // CommanDialog.showErrorDialog(context, description: result['message']);
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {
      print("Error $error");
    }
  }

  Future<void> playVideo(_url) async {
    try {
      final Uri urlTwitter = Uri.parse(_url);

      await launchUrl(
        urlTwitter,
        mode: LaunchMode.inAppWebView,
      );
    } catch (e) {}
  }

  //ESMP Add New workplan number
  List workPlanMechanismList = [];
  void getworkPlanMechanism(context) async {
    workPlanMechanismList.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('work_plan_mechanism', {"location": location_id});
      CommanDialog.hideLoading(context);
      print(result);

      if (result['status'] == 'true') {
        workPlanMechanismList = result['data'];

        Navigator.pushNamed(context, '/AddNewWorkPlanNumber');
      }
      if (result['status'] == "false") {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {
      print("Error $error");
    }
  }

  List workPlanMechanismSubList = [];
  void getworkPlanMechanismSubList(context, requiredData) async {
    workPlanMechanismSubList.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().postRequest('work_plan_control', requiredData);
      CommanDialog.hideLoading(context);
      print(result);

      if (result['status'] == 'true') {
        workPlanMechanismSubList = result['data'];
        notifyListeners();
      }
      if (result['status'] == "false") {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {
      print("Error $error");
    }
  }

  void addNewWorkPalnNumber(context, requiredData) async {
    workPlanMechanismSubList.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().postRequest('work_plan_creation', requiredData);
      CommanDialog.hideLoading(context);

      if (result['status'] == 'true') {
        print("result $result");
        CommanDialog.hideLoading(context);
        CommanDialog.showErrorDialog(context, description: result['message']);
      }
      if (result['status'] == "false") {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {
      print("Error $error");
    }
  }

  void editWorkPlan(context, requiredData) async {
    workPlanMechanismSubList.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall().postRequest('edit_work_plan', requiredData);
      CommanDialog.hideLoading(context);

      if (result['status'] == 'true') {
        print("result $result");
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
        CommanDialog.showErrorDialog(context, description: result['message']);
      }
      if (result['status'] == "false") {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {
      print("Error $error");
    }
  }

  void deleteWorkPlan(context, requiredData) async {
    workPlanMechanismSubList.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('deletion_existing_hazards', requiredData);
      CommanDialog.hideLoading(context);
      print(result);
      if (result['status'] == 'true') {
        print("result $result");
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
        CommanDialog.showErrorDialog(context, description: result['message']);
      }
      if (result['status'] == "false") {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {
      print("Error $error");
    }
  }

  void addNewHazard(context, requiredData) async {
    workPlanMechanismSubList.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall()
          .postRequest('addition_existing_hazards', requiredData);
      CommanDialog.hideLoading(context);
      print(result);
      if (result['status'] == 'true') {
        print("result $result");
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
        CommanDialog.showErrorDialog(context, description: result['message']);
      }
      if (result['status'] == "false") {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {
      print("Error $error");
    }
  }

  void editListofHazards(context, requiredData, endpoint) async {
    print("End point $endpoint");
    workPlanMechanismSubList.clear();
    CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result = await APICall().postRequest('$endpoint', requiredData);
      CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        print("result $result");
        CommanDialog.hideLoading(context);
        CommanDialog.hideLoading(context);
        CommanDialog.showErrorDialog(context, description: result['message']);
      }
      if (result['status'] == "false") {
        showSnakeBar(
          result['message'],
          context,
        );
      }
    } catch (error) {
      print("Error $error");
    }
  }
}

class DateUtils {
  static String getTimeDifference(String startTime, String endTime) {
    var dateFormat = DateFormat('h:ma');
    DateTime durationStart = dateFormat.parse(startTime);
    DateTime durationEnd = dateFormat.parse(endTime);

    return '${durationEnd.difference(durationStart).inHours} hours';
  }
}
