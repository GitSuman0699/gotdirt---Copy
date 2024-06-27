import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/controller/home_controller.dart';
import 'package:gotdirt/app/util/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ThemeProvider.whiteColor,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        );
      },
    );
  }
}
