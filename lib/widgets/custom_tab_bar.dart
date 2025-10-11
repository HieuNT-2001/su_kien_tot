import 'package:flutter/material.dart';
import 'package:su_kien_tot/models/tab_item.dart';

class CustomTabBar extends StatefulWidget {
  final List<TabItem> tabs;

  const CustomTabBar({super.key, required this.tabs});

  @override
  CustomTabBarState createState() => CustomTabBarState();
}

class CustomTabBarState extends State<CustomTabBar> {
  int _selectedTabIndex = 0;

  Widget _buildTab(TabItem tab, int index) {
    final bool active = _selectedTabIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => _selectedTabIndex = index);
        tab.onTap();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFF28F8F) : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          tab.title,
          style: TextStyle(
            color: active ? Colors.black : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          widget.tabs.length,
          (i) => _buildTab(widget.tabs[i], i),
        ),
      ),
    );
  }
}
