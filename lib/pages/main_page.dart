
import 'package:cervejaiadaappflutter/pages/cards/card_page.dart';
import 'package:cervejaiadaappflutter/pages/page1.dart';
import 'package:cervejaiadaappflutter/pages/page2.dart';
import 'package:cervejaiadaappflutter/pages/page3.dart';
import 'package:cervejaiadaappflutter/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);
  int pagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.settings),
                tooltip: 'Go to the next page',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Next page'),
                        ),
                        body: const Center(
                          child: Text(
                            'This is the next page',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      );
                    },
                  ));
                },
              ),
            ],
          ),
          drawer: const CustomDrawer(),
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      pagePosition = value;
                    });
                  },
                  allowImplicitScrolling: true,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CardPage(),
                    Page2(),
                    Page3(),
                  ],
                ),
              ),
              BottomNavigationBar(
                  backgroundColor: Colors.black,
                  selectedItemColor: Colors.amber,
                  unselectedItemColor: Colors.white,
                  onTap: (value) {
                    pageController.jumpToPage(value);
                  },
                  currentIndex: pagePosition,
                  items: const [
                    BottomNavigationBarItem(
                        label: "Feed", icon: Icon(Icons.home)),
                    BottomNavigationBarItem(
                        label: "Take Picture", icon: Icon(Icons.add_a_photo)),
                    BottomNavigationBarItem(
                        label: "Friends", icon: Icon(Icons.group)),
                  ])
            ],
          )),
    );
  }
}
