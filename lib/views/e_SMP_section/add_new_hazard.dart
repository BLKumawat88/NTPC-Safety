import 'package:flutter/material.dart';
import 'package:ntpc/theme/common_theme.dart';
import 'package:provider/provider.dart';

import '../../controller/all_in_provider.dart';

class AddNewHazard extends StatefulWidget {
  const AddNewHazard({super.key});

  @override
  State<AddNewHazard> createState() => _AddNewHazardState();
}

class _AddNewHazardState extends State<AddNewHazard> {
  late GlobalKey<FormState> _formKey;

  final mechanism_id = TextEditingController();

  final mechanism = TextEditingController();

  final control = TextEditingController();

  final workPlanNumber = TextEditingController();

  final procedure = TextEditingController();

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    mechanism_id.text = '';

    mechanism.text = '';

    control.text = '';

    workPlanNumber.text = '';

    procedure.text = '';
  }

  @override
  void dispose() {
    super.dispose();

    mechanism_id.dispose();

    mechanism.dispose();

    control.dispose();

    workPlanNumber.dispose();

    procedure.dispose();
  }

  void submitButton() {
    AllInProvider provider = Provider.of(context, listen: false);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Map submitData = {
        "mechanism_id": mechanism_id.text,
        "mechanism": mechanism.text,
        "control": control.text,
        "work_plan_number": workPlanNumber.text,
        "procedure": procedure.text,
        "location_project_id": provider.location_id
      };

      // fromAllDataAPI(submitData);
      provider.addNewHazard(context, submitData);
      print(submitData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CommonTheme.headerCommonColor,
        elevation: 0,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    "Mechanism id",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF83CA13)),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: mechanism_id,
                    decoration: InputDecoration(
                        hintText: "Enter Mechanism id",
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFC8C8C8)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Mechanism id";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Mechanism",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF83CA13)),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: mechanism,
                    decoration: InputDecoration(
                        hintText: "Enter Mechanism",
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFC8C8C8)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Mechanism";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Control",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF83CA13)),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: control,
                    decoration: InputDecoration(
                        hintText: "Control",
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFC8C8C8)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Control";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Work Plan Number",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF83CA13)),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: workPlanNumber,
                    decoration: InputDecoration(
                        labelText: "Work Plan Number",
                        labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF83CA13)),
                        hintText: "Enter Work Plan Number",
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFC8C8C8)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Work Plan Number";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Procedure",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF83CA13)),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: procedure,
                    decoration: InputDecoration(
                        hintText: "Enter Procedure",
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFC8C8C8)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xFF83CA13)),
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Procedure";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      submitButton();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CommonTheme.headerCommonColor),
                      child: Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
