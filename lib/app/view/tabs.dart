import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/common_widget/appbar_widget.dart';
import 'package:gotdirt/app/common_widget/map_page.dart';
import 'package:gotdirt/app/controller/mapview_controller.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';
import 'package:gotdirt/app/view/add_seller_listing.dart';
import 'package:gotdirt/app/view/add_seller_listing.dart';
import 'package:gotdirt/app/view/home.dart';
import 'package:gotdirt/app/view/mapview.dart';
import 'package:gotdirt/app/view/mapview.dart';
import 'package:gotdirt/app/view/post.dart';
import 'package:gotdirt/app/view/setting.dart';
import 'package:gotdirt/app/view/sidemenu.dart';

class BottomTabScreen extends StatefulWidget {
  const BottomTabScreen({super.key});

  @override
  State<BottomTabScreen> createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  int cartTotal = 0;
  late TabController tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void updateIndex(int index) {
    currentIndex = index;
    tabController.animateTo(currentIndex);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: 3, vsync: this, initialIndex: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        drawerEnableOpenDragGesture: false,
        drawer: const SideMenuScreen(),
        appBar: secondAppBar(
          ThemeProvider.whiteColor,
          () {
            _scaffoldKey.currentState?.openDrawer();
          },
          () {},
          context,
        ),
        floatingActionButton: Visibility(
          visible: currentIndex == 0,
          child: FloatingActionButton(
            backgroundColor: ThemeProvider.appColor,
            foregroundColor: Colors.white,
            shape: const CircleBorder(),
            onPressed: () {
              Get.toNamed(AppRouter.getAddSellerListingRoute());
            },
            child: const Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ThemeProvider.darkGreyColor,
                ThemeProvider.blackColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: TabBar(
            controller: tabController,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            dividerColor: ThemeProvider.transparentColor,
            labelColor: ThemeProvider.transparentColor,
            indicatorColor: ThemeProvider.transparentColor,
            unselectedLabelColor: ThemeProvider.greyColor,
            labelPadding: const EdgeInsets.symmetric(horizontal: 0),
            labelStyle: const TextStyle(
              fontFamily: 'regular',
              fontSize: 12,
            ),
            onTap: (int index) => updateIndex(index),
            tabs: [
              Tab(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    AssetsPath.bt1,
                    fit: BoxFit.contain,
                    height: 25,
                  ),
                ),
              ),
              Tab(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    AssetsPath.bt2,
                    fit: BoxFit.contain,
                    height: 25,
                  ),
                ),
              ),
              Tab(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    AssetsPath.bt3,
                    fit: BoxFit.contain,
                    height: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            MapviewScreen(),
            PostScreen(),
            SettingScreen(),
          ],
        ),
      ),
    );
  }
}
