import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class PredictionScreeen extends StatefulWidget {
  String resultText;
   PredictionScreeen({Key? key,required this.resultText}) : super(key: key);
  @override
  State<PredictionScreeen> createState() => _PredictionScreeenState();
}

class _PredictionScreeenState extends State<PredictionScreeen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: size.height/4,),
             Center(
                child: Text(
                  widget.resultText,
                  style: const TextStyle(
                      fontSize: 20.0
                  ),

                )
            ),

            SizedBox(height: size.height/3,),

            OutlinedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                  fixedSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: const Text("Back To Home"),

            ),

          ],
        ),
      ),
    );
  }
}
