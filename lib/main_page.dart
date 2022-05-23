import 'package:e_comerce_shoes/app/modules/favorite/views/favorite_view.dart';
import 'package:e_comerce_shoes/app/modules/home/views/home_view.dart';
import 'package:e_comerce_shoes/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  int? bottomNavBarIndex;
  MainPage({this.bottomNavBarIndex = 0});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController? pageController;

  int _page = 0;
  @override
  void initState() {
    _page = widget.bottomNavBarIndex!;
    pageController = PageController(initialPage: _page);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            widget.bottomNavBarIndex = index;
          });

          // setState(() {
          //   final CurvedNavigationBarState? navBarState =
          //       _bottomNavigationKey.currentState;
          //   navBarState!.setPage(index);
          //   _page = index;
          // });
        },
        children: [
          Center(
            child: HomeView(),
          ),
          Center(
            child: Text("Chat"),
          ),
          Center(
            child: FavoriteView(),
          ),
          Center(
            child: Text("Profile"),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavbar(
        selectedIndex: widget.bottomNavBarIndex,
        onTap: (index) {
          setState(() {
            _page = index;
            pageController!.animateToPage(index,
                duration: Duration(milliseconds: 50),
                curve: Curves.bounceInOut);
          });
        },
      ),
    );
  }
}
