import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:last/Screen/prediction_screen.dart';
import 'package:last/model/prediction.dart';
import 'Screen/widget.dart';
import 'model/list_item.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heart Disease Prediction',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? genderSelectedValue;
  int? chestPainTypeSelectedValue;
  int? fastingBloodSugarSelectedValue;
  int? restECGSelectedValue;
  int? anginaSelectedValue;
  int? stSegmentSelectedValue;
  int? fluoroscopySelectedValue;
  int? thanSelectedValue;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _bloodPressureController =
      TextEditingController();
  final TextEditingController _cholesterolController = TextEditingController();
  final TextEditingController _maxHeartRateController = TextEditingController();
  final TextEditingController _stDepressionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Heart Disease Prediction")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                EditText(
                  hintText: 'Enter Your Age',
                  controller: _ageController,
                  levelText: 'Enter Your Age',
                  validatorText: "Please Enter Your Age",
                ),
                const SizedBox(
                  height: 30.0,
                ),
                DropDown(
                  dropdownText: [ListItem(0, "Female"), ListItem(1, "Male")],
                  validatorText: 'Please Select Gender',
                  hintText: "Select Your Gender",
                  onChanged: (value) {
                    setState(() {
                      genderSelectedValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                DropDown(
                  dropdownText: [
                    ListItem(0, "None"),
                    ListItem(1, "Small"),
                    ListItem(2, "Medium"),
                    ListItem(3, "High")
                  ],
                  validatorText: 'Please Select Pain Type',
                  hintText: "Select Your ChestPain Type",
                  onChanged: (value) {
                    setState(() {
                      chestPainTypeSelectedValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                EditText(
                  hintText: 'Enter Blood Pressure In Rest',
                  controller: _bloodPressureController,
                  levelText: 'Enter Blood Pressure In Rest',
                  validatorText: "Please Enter Blood Pressure In Rest",
                ),
                const SizedBox(
                  height: 30.0,
                ),
                EditText(
                  hintText: 'Enter Serum Cholesterol in mg/dl',
                  controller: _cholesterolController,
                  levelText: 'Enter Serum Cholesterol in mg/dl',
                  validatorText: "Please Enter Serum Cholesterol in mg/dl",
                ),
                const SizedBox(
                  height: 30.0,
                ),
                DropDown(
                  dropdownText: [ListItem(1, "Yes"), ListItem(0, "No")],
                  validatorText: 'Please Select Fasting Blood Sugar > 120mg?',
                  hintText: "Select Fasting Blood Sugar > 120mg?",
                  onChanged: (value) {
                    setState(() {
                      fastingBloodSugarSelectedValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                DropDown(
                  dropdownText: [
                    ListItem(0, "Small"),
                    ListItem(1, "Medium"),
                    ListItem(2, "High")
                  ],
                  validatorText: 'Please Select Rest ECG Result',
                  hintText: "Select Your Rest ECG Result",
                  onChanged: (value) {
                    setState(() {
                      restECGSelectedValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                EditText(
                  hintText: 'Enter Max Heart Rate',
                  controller: _maxHeartRateController,
                  levelText: 'Enter Max Heart Rate',
                  validatorText: "Please Enter Max Heart Rate",
                ),
                const SizedBox(
                  height: 30.0,
                ),
                DropDown(
                  dropdownText: [ListItem(1, "Yes"), ListItem(0, "No")],
                  validatorText: 'Please Select Exercise Induced Angina',
                  hintText: "Select Your Exercise Induced Angina",
                  onChanged: (value) {
                    setState(() {
                      anginaSelectedValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                EditText(
                  hintText: 'Enter STDepression Induced by Exercise',
                  controller: _stDepressionController,
                  levelText: 'Enter STDepression Induced by Exercise',
                  validatorText:
                      "Please Enter STDepression Induced by Exercise",
                ),
                const SizedBox(
                  height: 30.0,
                ),
                DropDown(
                  dropdownText: [
                    ListItem(0, "Small"),
                    ListItem(1, "Medium"),
                    ListItem(2, "High")
                  ],
                  validatorText:
                      'Please select Slope of the peak exercise ST segment',
                  hintText: "Slope of the peak exercise ST segment",
                  onChanged: (value) {
                    setState(() {
                      stSegmentSelectedValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                DropDown(
                  dropdownText: [ListItem(0, "0"), ListItem(1, "1"), ListItem(2, "2")],
                  validatorText:
                      'Please select Number of major vessels (0-3) colored by fluoroscopy',
                  hintText:
                      "Number of major vessels (0-3) colored by fluoroscopy",
                  onChanged: (value) {
                    setState(() {
                      fluoroscopySelectedValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                DropDown(
                  dropdownText: [
                    ListItem(1, "Normal"),
                    ListItem(2, "Fixed Defect"),
                    ListItem(3, " Reversable Defect")
                  ],
                  validatorText: 'Please select Thal Scan Result',
                  hintText: "Thal Scan Result",
                  onChanged: (value) {
                    setState(() {
                      thanSelectedValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                OutlinedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red, // background
                        onPrimary: Colors.white, // foreground
                        fixedSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await sendData(
                            _ageController.text.toString(),
                            genderSelectedValue.toString(),
                            chestPainTypeSelectedValue.toString(),
                            _bloodPressureController.text.toString(),
                            _cholesterolController.text.toString(),
                            fastingBloodSugarSelectedValue.toString(),
                            restECGSelectedValue.toString(),
                            _maxHeartRateController.text.toString(),
                            anginaSelectedValue.toString(),
                            _stDepressionController.text.toString(),
                            stSegmentSelectedValue.toString(),
                            fluoroscopySelectedValue.toString(),
                            thanSelectedValue.toString(),
                            context);
                      }
                    },
                    child: const Text("Submit")),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<dynamic> sendData(
    String age,
    String sex,
    String cp,
    String trestbps,
    String chol,
    String fbs,
    String restecg,
    String thalach,
    String exang,
    String oldpeak,
    String slope,
    String ca,
    String thal,
    BuildContext context) async {
  EasyLoading.show(status: 'loading...');
  const url = 'https://heart-disease-prediction-ml-ap.herokuapp.com/predict';
  final request = http.MultipartRequest('POST', Uri.parse(url))
    ..fields['age'] = age
    ..fields['sex'] = sex
    ..fields['cp'] = cp
    ..fields['trestbps'] = trestbps
    ..fields['chol'] = chol
    ..fields['fbs'] = fbs
    ..fields['restecg'] = restecg
    ..fields['thalach'] = thalach
    ..fields['exang'] = exang
    ..fields['oldpeak'] = oldpeak
    ..fields['slope'] = slope
    ..fields['ca'] = ca
    ..fields['thal'] = chol;

  final response = await request.send();
  final responseBody = await response.stream.bytesToString();
  print('RESPONSE BODY:   $responseBody');
  print('RESPONSE CODE:   ${response.statusCode}');

  Prediction prediction = Prediction.fromJson(jsonDecode(responseBody));
  print(prediction.diseasePrediction.toString());
  String result = prediction.diseasePrediction.toString();
  EasyLoading.dismiss();

  if (result == "0") {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => PredictionScreeen(
                resultText: 'You Don\'t Have Heart Disease',
              )),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => PredictionScreeen(
                resultText: 'You Have Heart Disease',
              )),
    );
  }
}
