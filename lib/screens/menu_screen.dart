import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

import './orders_screen.dart';
import './lab_request_details_screen.dart';
import './chatbot_screen.dart';
import '../providers/auth.dart';
import './products_overview_screen.dart';
import './auth_screen.dart';

class Menu extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: DrawerScreen(
        setIndex: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      mainScreen: currentScreen(),
      borderRadius: 30,
      showShadow: true,
      angle: 0.0,
      slideWidth: 200,
      menuBackgroundColor: Colors.deepPurple,
    );
  }

  Widget currentScreen() {
    switch (currentIndex) {
      case 0:
        return ProductsOverviewScreen();
      case 1:
        return OrdersScreen();
      case 2:
        return LabRequestDetailsScreen();
      case 3:
        return ChatBotScreen();
      case 4:
        Provider.of<Auth>(context, listen: false).logout();
        return AuthScreen();
      default:
        return ProductsOverviewScreen();
    }
  }
}

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key key, this.title = "Home"}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: DrawerWidget(),
      ),
    );
  }
}

class DrawerScreen extends StatefulWidget {
  final ValueSetter setIndex;
  const DrawerScreen({Key key, @required this.setIndex}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          drawerList(Icons.home, "Pharmacy", 0),
          drawerList(Icons.mail, "Orders", 1),
          drawerList(Icons.send, "Lab Test", 2),
          drawerList(Icons.favorite, "Chat us", 3),
          drawerList(Icons.archive, "Logout", 4),
          // drawerList(Icons.block, "Spam", 5),
        ],
      ),
    );
  }

  Widget drawerList(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        widget.setIndex(index);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, bottom: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              text,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ZoomDrawer.of(context).toggle();
      },
      icon: Icon(Icons.menu),
    );
  }
}
