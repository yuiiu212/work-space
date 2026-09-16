
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/colormanagement.dart';

class CustomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late NotchBottomBarController _controller;

  @override
  void initState() {
    super.initState();

    _controller = NotchBottomBarController(
      index: widget.selectedIndex,
    );
  }

  @override
  void didUpdateWidget(covariant CustomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _controller.index = widget.selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      notchBottomBarController: _controller,

      color: ColorManager.NeutralWhite,

      notchColor: ColorManager.BrandButton,

      showLabel: true,

      bottomBarItems: const [
        BottomBarItem(
          inActiveItem: Icon(
            Icons.home_outlined,
            color: Colors.grey,
          ),
          activeItem: Icon(
            Icons.home,
            color: Colors.white,
          ),
          itemLabel: 'Home',
        ),

        BottomBarItem(
          inActiveItem: Icon(
            Icons.calendar_month_outlined,
            color: Colors.grey,
          ),
          activeItem: Icon(
            Icons.calendar_month,
            color: Colors.white,
          ),
          itemLabel: 'Calendar',
        ),

        BottomBarItem(
          inActiveItem: Icon(
            Icons.person_outline,
            color: Colors.grey,
          ),
          activeItem: Icon(
            Icons.person,
            color: Colors.white,
          ),
          itemLabel: 'Profile',
        ),

        BottomBarItem(
          inActiveItem: Icon(
            Icons.history_outlined,
            color: Colors.grey,
          ),
          activeItem: Icon(
            Icons.history,
            color: Colors.white,
          ),
          itemLabel: 'History',
        ),
      ],

      onTap: (index) {
        widget.onItemSelected(index);
      },

      kIconSize: 24,
      kBottomRadius: 20,

      bottomBarHeight: 70,
      bottomBarWidth: MediaQuery.of(context).size.width,

      elevation: 2,
      shadowElevation: 5,

      removeMargins: false,
    );
  }
}