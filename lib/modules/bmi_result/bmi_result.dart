import 'package:flutter/material.dart';
class BmiResult extends StatelessWidget {
  final bool gender;
  final int age;
  final int result;

  const BmiResult({
    @required this.gender,
  @required this.age,
    @required  this.result,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BmiResult"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Gender : ${gender ? "MALE" :"FEMALE"}",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
            Text("Result : $result",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
            Text("AGE : $age",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
          ],
        ),
      ),
    );
  }
}
