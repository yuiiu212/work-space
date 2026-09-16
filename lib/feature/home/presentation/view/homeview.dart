import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Utilis/Constans.dart';
import 'package:flutter_application_1/core/Utilis/units.dart';
import 'package:flutter_application_1/core/share/customaddbar.dart';
import 'package:flutter_application_1/core/share/customnavigationbar.dart';
import 'package:flutter_application_1/core/share/fuction/ShowTaskSheet.dart';
import 'package:flutter_application_1/core/style/AssetsManager.dart';
import 'package:flutter_application_1/core/style/colormanagement.dart';
import 'package:flutter_application_1/feature/home/presentation/view/tabs/Calendar_tab.dart';
import 'package:flutter_application_1/feature/home/presentation/view/tabs/History_tab.dart';
import 'package:flutter_application_1/feature/home/presentation/view/tabs/Home_tab.dart';
import 'package:flutter_application_1/feature/home/presentation/view/tabs/Profile_tab.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  int selectedIndex = 0;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Constans.getAppBarSize(context),
        child: CustomeAppBar(),
      ),
      body: PageView(
        onPageChanged: (index) => {
          setState(() {
            selectedIndex = index;
          }),
        },
        children: _buildBody(),
        controller: _pageController,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.BrandButton,
        shape: CircleBorder(),
        isExtended: true,
        elevation: Units.getHeight(context: context, value: 5),
        child: Image.asset(AssetsManager.AddIcon),
        onPressed: () async {
          await ShowTaskSheet(context);
        },
      ),
      floatingActionButtonLocation: .centerDocked,
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
            _pageController.animateToPage(
              selectedIndex,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          });
        },
      ),
    );
  }

  List<Widget> _buildBody() => [
    HomeTab(),
    CalendarTab(),
    ProfileTab(),
    HistoryTab(),
  ];
}