import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/add_seller_listing_parse.dart';

class AddSellerListingController extends GetxController implements GetxService {
  final AddSellerListingParse parser;
  AddSellerListingController({required this.parser});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String? dirtTypeSelect = "Select";
  String? stateSelect = "State";
  String? aggregateSelect = "Select";
  String? pickupOrDeliverySelect = "Select";

  RxBool checkbox1 = false.obs;
  RxBool checkbox2 = false.obs;

  int? chipIndex;
  List selectedChips = [];

  List<Widget> chips = [
    Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Text(
          "Clean",
          style: TextStyle(
            color: Colors.black45,
            fontSize: Theme.of(Get.context!).textTheme.titleLarge?.fontSize,
          ),
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Text(
          "Rock Free",
          style: TextStyle(
            color: Colors.black45,
            fontSize: Theme.of(Get.context!).textTheme.titleLarge?.fontSize,
          ),
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Text(
          "Rotting Matter-Free",
          style: TextStyle(
            color: Colors.black45,
            fontSize: Theme.of(Get.context!).textTheme.titleLarge?.fontSize,
          ),
        ),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Text(
          "Plastic & debris-free",
          style: TextStyle(
            color: Colors.black45,
            fontSize: Theme.of(Get.context!).textTheme.titleLarge?.fontSize,
          ),
        ),
      ),
    ),
  ];
}
