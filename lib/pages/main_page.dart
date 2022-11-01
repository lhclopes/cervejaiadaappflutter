
import 'package:cervejaiadaappflutter/pages/cards/card_page.dart';
import 'package:cervejaiadaappflutter/pages/cep_find.dart';
import 'package:cervejaiadaappflutter/pages/page2.dart';
import 'package:cervejaiadaappflutter/pages/page3.dart';
import 'package:cervejaiadaappflutter/pages/task/task_sqlite_page.dart';
import 'package:cervejaiadaappflutter/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

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
                    CepFind(),
                    Page2(),
                    Page3(),
                    TaskSQLitePage()
                  ],
                ),
              ),
              BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
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
                        label: "Cep", icon: Icon(Icons.get_app)),
                    BottomNavigationBarItem(
                        label: "Page2", icon: Icon(Icons.add_a_photo)),
                    BottomNavigationBarItem(
                        label: "Page3", icon: Icon(Icons.add_a_photo)),
                    BottomNavigationBarItem(
                        label: "Task List", icon: Icon(Icons.list)),
                  ])
            ],
          )),
    );
  }
}
