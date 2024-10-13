import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/social_app/social_register/cuibt/states.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

class SocialRegisterCuibt extends Cubit<SocialRegisterStates> {
  SocialRegisterCuibt() : super(SocialRegisterintinalstate());
  static SocialRegisterCuibt get(context) => BlocProvider.of(context);

  

  // void userRegister({
  //   required String email,
  //   required String name,
  //   required String phone,
  //   required String password,
  // }) {
  //   emit(SocialRegisterloadingState());
  //   DioHelper.postData(url: REGISTER, data: {
  //     'name':name,
  //     'email': email,
  //     'password': password,
  //     'phone':phone,
  //   }).then((value) {
  //     print(value.data);
  //     userLogin = SocialLoginModel.fromJson(value.data);
  //     // print(RegisterModel.message);
  //     emit(SocialRegisterSuccessState(userLogin!));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(SocialRegisterErrorState(error.toString()));
  //   });
  // }

  bool ispassword = true;
  IconData suffix = Icons.visibility_outlined;
  void changepassword() {
    ispassword = !ispassword;
    suffix = ispassword ? Icons.visibility_off : Icons.visibility_outlined;
    emit(SocialRegisterChangePasswordState());
  }
}
