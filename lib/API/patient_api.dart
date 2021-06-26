import 'dart:io';
import '../Models/patientClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hospital_application/Models/token.dart';
Future<List<Patient>> gitAllPatients() async {
  String token2= "token "+token.tokenName;

  final patientData = await http
      .get(Uri.parse("http://193.227.20.84:443/Person/PatientAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader:token2
       // "token b194bda7a92bc7000d569b830a565a89a2b66993"
        //"token 078ca49c2b99b14952f94ab07bd683b5d18ff0cf"
  });
  var jsonData = json.decode(patientData.body);
  List<Patient> allPatient = [];
  for (var patient in jsonData) {
    print(allPatient.length.toString() + "///////////////");
    allPatient.add(Patient.fromJson(patient));
  }
  print(allPatient.length.toString() + "///////////////");
  return allPatient;
}
