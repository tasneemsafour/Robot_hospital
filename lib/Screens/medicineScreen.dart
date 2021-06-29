import 'package:flutter/material.dart';
import 'package:hospital_application/API/medicineAPI.dart';
import 'package:hospital_application/Models/mission.dart';
import 'package:hospital_application/Widget/gradient_Button.dart';
import 'package:hospital_application/Models/MedicineModel.dart';
import 'package:hospital_application/Widget/gridOfHome_widget.dart';

class medicineScreen extends StatefulWidget {
  //const medicineScreen({ Key? key }) : super(key: key);
  static String routName = '/medicineScreen';
  @override
  _medicineScreenState createState() => _medicineScreenState();
}

class _medicineScreenState extends State<medicineScreen> {
  String valueChoose;
  int creatIdList(String str, List<medicine> med) {
    for (int i = 0; i < med.length; i++) {
      if (str == med[i].name) {
        return med[i].id;
      }
    }
  }

  dropButton(List<medicine> item) {
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
          return DropdownMenuItem(
              child: Text(valItem.name), value: valItem.name);
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
      body: FutureBuilder(
          future: getMedicin(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 100),
                    dropButton(snapshot.data),
                    SizedBox(height: 100),
                    //Text(valueChoose),
                    GestureDetector(
                        //higth: MediaQuery.of(context).size.width*0.85,
                        child: gradient_button("Send Task"),
                        onTap: () {
                          Map<String, String> m = {
                            "service_type": "medicine_recognition",
                            "id_medicine":
                                creatIdList(valueChoose, snapshot.data)
                                    .toString(),
                          };
                          Mission.addMission("medicine recognition",m);
                          Navigator.of(context).pop(context);
                        }),
                  ],
                ),
              );
            }
          }),
    );
  }
}
