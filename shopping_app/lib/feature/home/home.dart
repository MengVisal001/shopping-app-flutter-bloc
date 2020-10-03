import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopping_app/feature/discover/ui/discover_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              DiscoverScreen(),
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
            ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: GNav(
                gap: 0,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.pinkAccent,
                tabs: [
                  GButton(
                    icon: Ionicons.ios_home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Ionicons.ios_heart,
                    text: 'Favorite',
                  ),
                  GButton(
                    icon: Ionicons.ios_locate,
                    text: 'Search',
                  ),
                  GButton(
                    icon: Ionicons.ios_cart,
                    text: 'Cart',
                  ),
                  GButton(
                    icon: Ionicons.ios_person,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _currentIndex,
                onTabChange: (index) {
                  setState(() => _currentIndex = index);
                  _pageController.jumpToPage(index);
                },
              ),
            )));
  }
}
