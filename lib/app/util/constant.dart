import 'package:gotdirt/app/env.dart';

class AppConstants {
  static const String appName = Environments.appName;

  // API Routes

  static const String signUp = '/signup';
  static const String login = '/login';
  static const String verifyOtp = '/confirmUser';
  static const String resendCode = '/resendConfirmationCode';
  static const String forgotSendCode = '/forgotPassword';
  static const String newPassword = '/confirmPasswordReset';
  static const String createUserInfos = '/createUserInfos';
  static const String updateUser = '/updateUser';
  static const String uploadImage = '/uploadImage';
  static const String updateUserPatner = '/updateUserPatner';
  static const String userByUniqueId = '/userByUniqueId';
  static const String userById = '/userById';
  static const String userAndPatnerByUserId = '/userAndPatnerByUserId';
  static const String signOut = '/signout';
  static const String deleteUser = '/deleteUser';
  static const String getAllQuestionDropdown = '/getAllQuestionDropdown';
}
