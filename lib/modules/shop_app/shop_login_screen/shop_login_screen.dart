import 'package:abdalla_mansour_course1/layout/shop_layout/shop_layout_screen.dart';
import 'package:abdalla_mansour_course1/modules/shop_app/register_screen/register__screen.dart';
import 'package:abdalla_mansour_course1/modules/shop_app/shop_login_screen/cubit/cubit.dart';
import 'package:abdalla_mansour_course1/modules/shop_app/shop_login_screen/cubit/states.dart';
import 'package:abdalla_mansour_course1/shared/components/components.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ShopLoginScreen extends StatelessWidget {
var emailController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context,state){
          if(state is ShopLoginSuccessState)
          {
            if(state.loginModel.status)
            {
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(
                builder: (context)=>ShopLayoutScreen(),
              ), (route) => false);
              print(state.loginModel.message);
              print(state.loginModel.data.token);
              Fluttertoast.showToast(
                  msg: state.loginModel.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
            else
            {
              print(state.loginModel.message);
              Fluttertoast.showToast(
                  msg: state.loginModel.message,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("LOGIN",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),),
                        SizedBox(height: 15,),
                        Text("login to our website now",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),),
                        SizedBox(height: 30,),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value){
                            if(value.isEmpty)
                            {
                              return "please enter your email";
                            }
                            else
                            {
                              return null;
                            }
                          },
                          text: "Email-Address",
                          icon: Icons.email_outlined,
                        ),
                        SizedBox(height: 15,),
                        defaultFormField(
                          onSubmit: (value)
                          {
                            if(formKey.currentState.validate())
                            {
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (String value){
                            if(value.isEmpty)
                            {
                              return "please enter your password";
                            }
                            else
                            {
                              return null;
                            }
                          },
                          text: "PassWord",
                          icon: Icons.lock,
                          suffix: Icons.visibility,
                          suffixPressed: (){},
                          isPassword: true,
                        ),
                        SizedBox(height: 30,),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context)=>defaultButton(
                            text: "login",
                            function: (){
                              if(formKey.currentState.validate())
                              {
                                ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            uppercase: true,
                            color: Colors.deepOrange,
                          ),
                          fallback:(context)=> Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text("Don\'t have an account?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>RegisterScreen(),
                                ),
                                );
                              },
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
        },
      ),
    );
  }
}
