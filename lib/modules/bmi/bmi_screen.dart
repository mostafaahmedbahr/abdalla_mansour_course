import 'dart:math';

import 'package:abdalla_mansour_course1/modules/bmi_result/bmi_result.dart';
import 'package:abdalla_mansour_course1/shared/components/components.dart';
import 'package:flutter/material.dart';
class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}
class _BmiScreenState extends State<BmiScreen> {
  bool isMale=true;
  double height = 120;
  int age = 20;
  int weight = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi"),
      ),
      body: Column(
        children: [
          //ألجزء الاول
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale=true;

                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:  isMale ? Colors.blue : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Image(
                                 image: AssetImage("assets/images/22.png"),
                                 height: 90,
                                 width: 90,
                               ),
                              SizedBox(height: 15,),
                              Text("MALE",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black,
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale=false;
                           });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: !isMale ? Colors.blue : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage("assets/images/23.png"),
                                height: 90,
                                width: 90,
                              ),
                              SizedBox(height: 15,),
                              Text("FEMALE",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black,
                                ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),

          // الجزء التانى
          Expanded(
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.black,
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text("${height.round()}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.black,
                          ),),
                        SizedBox(width: 5,),
                        Text("CM",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),),
                      ],
                    ),
                    Slider(
                        value: height,
                        max: 250,
                        min: 80,
                        onChanged: (value){
                          setState(() {
                            height=value;
                          });
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),

          //الجزء التالت
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.black,
                            ),),
                          Text("$age",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                              color: Colors.black,
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               FloatingActionButton(
                                   onPressed: (){
                                     setState(() {
                                       age--;
                                     });
                                   },
                                 heroTag: 2,
                                 mini: true,
                                 child: Icon(Icons.remove),
                               ),
                              FloatingActionButton(
                                heroTag: 1,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.black,
                            ),),
                          Text("$weight",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                              color: Colors.black,
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                heroTag: 4,
                                mini: true,
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                heroTag: 3,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //الجزء الاخير
          Container(
            width: double.infinity,
            child: MaterialButton(
              height: 50,
              color: Colors.blue,
              child: Text("Calculator",
              style: TextStyle(
                color: Colors.white,
              ),),
                onPressed: (){
                double result = weight/pow(height/100, 2);
                navigateTo(context,
                      (context)=>BmiResult(
                    age: age,
                    result: result.round(),
                    gender: isMale,
                  ),
                );
                },
            ),
          ),
        ],
      ),
    );
  }
}
