class EndPoints {
  static const String baseUrl = "https://cbt-api.onrender.com/";
  static const String userRegister = "auth/register";
  static const String login = "auth/login";
  static const String initiatePasswordRecovery = "auth/forget-password?phone=";
  static const String verifyForgotPasswordToken =
      "auth/verify-password-token?token=";
  static const String updatePassword = "auth/update-password?password=";
  static const String resendOtp = "auth/resend-phone-token";
  static const String verifyOtp = "auth/confirm-phone?token=";
  static const String subjects = "auth/fetch-subjects";
  
}
