import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/features/get/core/utils/failure.dart';
import 'package:flutter_bloc_practice/features/get/core/utils/usecase.dart';
import 'package:flutter_bloc_practice/features/get/share/domain/usecase/login_usecase.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

class LoginController extends BaseController<String> {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  LoginUseCase loginUseCase;

  LoginController({this.loginUseCase});

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();
  }

  apiLogin() async {
    setLoader = true;

    var result = await loginUseCase(
      LoginParams(
        email: emailTextController.text,
        password: passwordTextController.text,
      ),
    );

    setLoader = false;

    result.fold(
      (err) {
        print('asdsadasd ${(err as Error).errorMessage}');
        setError = (err as Error).errorMessage;
        Get.snackbar(
          'Error',
          error,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 1),
          animationDuration: Duration(microseconds: 500)
        );
      },
      (success) {
        setData = success;
      },
    );

    return result;
  }

  @override
  void onClose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    super.onClose();
  }
}
