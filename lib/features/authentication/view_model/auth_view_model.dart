import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/core/base_model.dart';
import 'package:solidsolutionweb/core/local_data_base.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/dashboard/view/dash_board.dart';
import 'package:solidsolutionweb/models/authentication_model/login_model.dart';
import 'package:solidsolutionweb/models/exception_model_calss/local_errors.dart.dart';
import 'package:solidsolutionweb/network_service/api_service.dart';

class AuthenticationViewModel extends BaseModel {
  //AuthToken

  String token = "";

  // AuthScreenLoader

  bool showLoader = false;
  toggleShowLoader(bool value) {
    showLoader = value;
    notifyListeners();
  }

  // Login Screen Controllers
  TextEditingController phoneNumberController = TextEditingController(
    text: StorageUtil.getString(
      key: LocalDBStrings.phoneNumber,
    ),
  );
  TextEditingController passwordController = TextEditingController();

  LocalExceptionModel validateLoginCredentials() {
    if (phoneNumberController.text.isEmpty || passwordController.text.isEmpty) {
      return LocalExceptionModel(
        isSuccessful: false,
        message: "Kindly ensure all fields are filled before you proceed",
      );
    } else if (phoneNumberController.text.length != 11) {
      return LocalExceptionModel(
        isSuccessful: false,
        message: "Enter a valid number before you proceed",
      );
    } else {
      return LocalExceptionModel(
        isSuccessful: true,
        message: "Success",
      );
    }
  }

  Future<void> login() async {
    toggleShowLoader(true);
    LocalExceptionModel isValidLoginCredentials = validateLoginCredentials();
    if (isValidLoginCredentials.isSuccessful) {
      StorageUtil.putString(
        key: LocalDBStrings.phoneNumber,
        value: phoneNumberController.text,
      );
      LoginModel loginData = LoginModel(
        password: passwordController.text,
        phoneNumber: phoneNumberController.text,
      );
      try {
        LocalExceptionModel login = await apiService.login(
          dataSent: LoginModel.tojson(loginModel: loginData).dataSent!,
        );

        if (login.isSuccessful) {
          LoginModel returnedData = login.model as LoginModel;
          token = returnedData.token!;
          StorageUtil.putString(
            key: LocalDBStrings.token,
            value: token,
          );
          navigator.pushAndRemoveUntil(routeName: DashBoard.routeName);
        } else {
          dialogService.showErrorDialog(errorMessage: login.message);
        }
      } catch (e) {
        dialogService.showErrorDialog(
          errorMessage: e.toString(),
        );
      }
    } else {
      dialogService.showErrorDialog(
        errorMessage: isValidLoginCredentials.message,
      );
    }
    toggleShowLoader(false);
  }
}
