// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/helper/init.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/constant.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';
import 'package:gotdirt/app/util/translator.dart';
// import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainBinding().dependencies();
  // await Amplify.addPlugins([AmplifyAuthCognito()]);
  // await Amplify.configure(amplifyconfig);
  // final session = await Amplify.Auth.fetchAuthSession();
  // debugPrint(session.isSignedIn.toString());

  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MyApp(),
  //   ),
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final scaleFactor = (screenWidth / screenHeight).clamp(0.6, 1.2);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(scaleFactor),
      ),
      child: GetMaterialApp(
        title: AppConstants.appName,
        color: ThemeProvider.appColor,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: TextFontFamily.interRegular,
        ),
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        initialRoute: AppRouter.initial,
        getPages: AppRouter.routes,
        defaultTransition: Transition.fade,
        translations: LocaleString(),
        locale: const Locale('en', 'US'),
      ),
    );
  }
}
