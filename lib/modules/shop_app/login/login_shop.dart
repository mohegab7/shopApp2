import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/shop_app/shoplayout.dart';
import 'package:flutter_application_1/modules/shop_app/login/cuibt/cubit.dart';
import 'package:flutter_application_1/modules/shop_app/login/cuibt/states.dart';
import 'package:flutter_application_1/modules/shop_app/register/register.dart';
import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_application_1/shared/components/constants.dart';
import 'package:flutter_application_1/shared/network/local/cache_helper.dart';
import 'package:flutter_application_1/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginShop_Screen extends StatelessWidget {
  var emailcontroll = TextEditingController();
  var passwordcontroll = TextEditingController();
  var formkey = GlobalKey<FormState>();

  bool showpassword = true;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ShopingLoginCuibt(),
        child: BlocConsumer<ShopingLoginCuibt, ShopLoginStates>(
          listener: (context, state) {
            if (state is ShopLoginSuccessState) {
              if (state.loginModel.status) {
                // print(state.loginModel.message);
                // print(state.loginModel.data.token);
                CacheHelper.saveData(
                        key: 'token', value: state.loginModel.data.token)
                    .then((value) {
                  token = state.loginModel.data.token;
                  NavigateAndFinish(
                    context,
                    Shoplayout(),
                  );
                });
              } else {
                print(state.loginModel.message);
                showToast(
                    text: state.loginModel.message, state: ToastStates.ERROR);
              }
            }
          },
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                             Text(
                              'login now to browse',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey ),
                            ),
                             SizedBox(
                              height: 20.0,
                            ),
                            defaultFormField(
                              controller: emailcontroll,
                              type: TextInputType.emailAddress,
                              label: 'Email Address',
                              prefix: Icons.email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ('email is empty');
                                }
                                return null;
                              },
                            ),
                             SizedBox(height: 15.0),
                            defaultFormField(
                              controller: passwordcontroll,
                              label: 'password',
                              type: TextInputType.visiblePassword,
                              prefix: Icons.lock,
                              suffix: ShopingLoginCuibt.get(context).suffix,
                              onSubmit: (value) {
                                if (formkey.currentState!.validate()) {
                                  ShopingLoginCuibt.get(context).userLogin(
                                    email: emailcontroll.text,
                                    password: passwordcontroll.text,
                                  );
                                }
                              },
                              isPassword:
                                  ShopingLoginCuibt.get(context).ispassword,
                              suffixPressed: () {
                                ShopingLoginCuibt.get(context).changepassword();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ('password is not correct');
                                }
                                return null;
                              },
                            ),
                             SizedBox(
                              height: 30,
                            ),
                            ConditionalBuilder(
                                condition: state is! ShopLoginloadingState,
                                builder: (context) => LoginButton(
                                    background: Colors.blue,
                                    radius: 20.0,
                                    function: () {
                                      if (formkey.currentState!.validate()) {
                                        ShopingLoginCuibt.get(context)
                                            .userLogin(
                                          email: emailcontroll.text,
                                          password: passwordcontroll.text,
                                        );
                                      }
                                    }),
                                fallback: (Contexr) =>  Center(
                                    child: CircularProgressIndicator())),
                            Row(
                              children: [
                                 Text(
                                  "Don't have an account",
                                  style: TextStyle(fontSize: 15.0),
                                ),
                                defaultTextbutton(
                                    function: () {
                                      Navigateto(
                                      context, ShopRegister());
                                    },
                                    text: 'register',
                                    color: defaultColor)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          },
        ));
  }
}
