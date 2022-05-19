import 'package:abdalla_mansour_course1/shared/components/components.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
bool isPassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  defaultFormField(
                    text: "Email Address",
                    icon: Icons.email,
                    type: TextInputType.emailAddress,
                    controller: emailController,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return "error";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                      validate: ( String value)
                      {
                        if (value.isEmpty)
                        {
                        return "error";
                        }
                         return null;
                  },
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    icon: Icons.lock,
                    //
                    suffix: isPassword?Icons.remove_red_eye:Icons.visibility_off,
                    isPassword:isPassword ,
                    text: "PassWord",
                    suffixPressed: (){
                     setState(() {
                       isPassword=!isPassword;
                     });
                    }

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    text: "LoGin",
                    function: () {
                      if (formKey.currentState.validate()) {
                        print(emailController.text);
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don\'t have an account ?"),
                      TextButton(
                        onPressed: () {},
                        child: Text("Register"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
