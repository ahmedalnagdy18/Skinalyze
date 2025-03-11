import 'package:flutter/material.dart';
import 'package:skinalyze/features/home/presentation/screens/home_page.dart';
import 'package:skinalyze/features/home/presentation/screens/setting_page.dart';
import 'package:skinalyze/features/home/presentation/widgets/bottom_navigation_bar.dart';

class MainAppPage extends StatefulWidget {
  const MainAppPage({super.key});

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  List name = [];
  int selectedindex = 0;

  @override
  void initState() {
    name.addAll([
      const HomePage(),
      const SettingPage(),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: name.elementAt(selectedindex),
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBarWidget(
              currentIndex: selectedindex,
              onTap: _onItemTapped,
            ),
          ),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      selectedindex = value;
    });
  }
}
