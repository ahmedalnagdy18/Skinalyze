import 'package:flutter/material.dart';
import 'package:skinalyze/features/home/presentation/screens/home_page.dart';
import 'package:skinalyze/features/home/presentation/screens/setting_page.dart';
import 'package:skinalyze/features/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:skinalyze/features/home/presentation/widgets/drawer_widget.dart';

class MainAppPage extends StatefulWidget {
  const MainAppPage({super.key});

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List name = [];
  int selectedindex = 0;

  @override
  void initState() {
    super.initState();
    name = [
      HomePage(
        onTap: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      const SettingPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
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
