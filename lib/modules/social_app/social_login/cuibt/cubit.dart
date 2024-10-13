import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/social_app/social_login/cuibt/states.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLoginCuibt extends Cubit<SocialLoginStates> {
  SocialLoginCuibt() : super(SocialLoginintinalstate());
  static SocialLoginCuibt get(context) => BlocProvider.of(context);

  
  // void userLogin({
  //   required String email,
  //   required String password,
  // }) {
  //   emit(SocialLoginloadingState());
  //   DioHelper.postData(url: LOGIN, data: {
  //     'email': email,
  //     'password': password,
  //   }).then((value) {
  //     print(value.data);
  //     userModel = SocialLoginModel.fromJson(value.data);
  //     // print(LoginModel.message);
  //     emit(SocialLoginSuccessState(userModel!));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(SocialLoginErrorState(error.toString()));
  //   });
  // }

  bool ispassword = true;
  IconData suffix = Icons.visibility_outlined;
  void changepassword() {
    ispassword = !ispassword;
    suffix = ispassword ? Icons.visibility_off : Icons.visibility_outlined;
    emit(SocialChangePasswordState());
  }
}
