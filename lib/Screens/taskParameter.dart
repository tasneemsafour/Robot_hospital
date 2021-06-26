import 'package:flutter/material.dart';
import 'package:hospital_application/API/medicineAPI.dart';
import 'package:hospital_application/Models/MedicineModel.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/mission.dart';
import 'package:hospital_application/Widget/DownScrollButton.dart';
import 'package:hospital_application/Widget/gradient_Button.dart ';

class taskParameter extends StatefulWidget {
  // const taskParameter ({ Key? key }) : super(key: key);

  static String routName = '/taskParameter';
  @override
  _taskParameterState createState() => _taskParameterState();
}

class _taskParameterState extends State<taskParameter> {
  List question = new List();
  String valueChoose;
  @override
  initState() {
    question = ["how are you ", "Give you food ?"];
    super.initState();
  }

  dropButton(List item) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton(
        hint: Text("selectItem"),
        dropdownColor: Colors.white,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        isExpanded: true,
        underline: SizedBox(),
        style: TextStyle(color: Colors.black, fontSize: 22),
        value: valueChoose,
        onChanged: (newValue) {
          setState(() {
            valueChoose = newValue;
          });
        },
        items: item.map((valItem) {
          return DropdownMenuItem(child: Text(valItem), value: valItem);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final value =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(
          title: Text(value["task"]),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 100),
              dropButton(question),
              SizedBox(height: 100),
              //Text(valueChoose),

              GestureDetector(
                  //width: MediaQuery.of(context).size.width*0.85,
                  child: gradient_button("Send Tasks"),
                  onTap: () {
                    Map<String, String> m = {
                      "service_type": "ask_patient",
                      "id_patient": value["patientid"].toString(),
                      "id_questions": valueChoose,
                    };
                    Mission.addMission("ask patient", m);
                    Navigator.of(context).pop(context);
                  }),
            ],
          ),
        ));
  }
}
