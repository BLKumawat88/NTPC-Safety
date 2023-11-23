import 'package:flutter/material.dart';
import 'package:ntpc/services/services.dart';

class AllinProvider extends ChangeNotifier {
  List checkListData = [];
  List dailyCheckListFormDetails = [];
  List dropDownData = [];
  void getCheckList(context) async {
    checkListData.clear();
    dropDownData.clear();
    dailyCheckListFormDetails.clear();
    // CommanDialog.showLoading(context, title: 'Please wait...');
    try {
      var result =
          await APICall().getRequest('show_mst_dozer_maintainace_daily_record');
      // CommanDialog.hideLoading(context);
      if (result['status'] == 'true') {
        dailyCheckListFormDetails.addAll(result['details']);
        for (int i = 0;
            i < int.parse(dailyCheckListFormDetails[0]['vehicle_id']);
            i++) {
          dropDownData.add({"item": "${i + 1}", "id": "${i + 1}"});
        }
        checkListData.addAll(result['data']);
        notifyListeners();
        // Navigator.pushNamed(context, '/daily_check_list');
      }
      if (result['status'] == 401) {
        // showSnakeBar(
        //   result['message'],
        //   context,
        // );
      }
    } catch (error) {}
  }
}
