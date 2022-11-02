import 'package:cervejaiadaappflutter/pages/cards/card_page.dart';
import 'package:cervejaiadaappflutter/pages/cep_find.dart';
import 'package:cervejaiadaappflutter/pages/page3.dart';
import 'package:cervejaiadaappflutter/pages/percent_indicator/percent_indicator_page.dart';
import 'package:cervejaiadaappflutter/pages/task/task_sqlite_page.dart';
import 'package:cervejaiadaappflutter/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

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
            title: Text(
              tr('APP_HOME'),
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
                        body: Column(children: [
                          Text(
                            'This is the next page',
                            style: TextStyle(fontSize: 24),
                          ),
                          TextButton(
                              onPressed: () {
                                print(context.locale.toString());
                                if (context.locale.toString() == "pt_BR") {
                                  context.setLocale(Locale('en', 'US'));
                                } else {
                                  context.setLocale(Locale('pt', 'BR'));
                                }
                              },
                              child: Text('Change Language'))
                        ]),
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
                    PercentIndicatorPage(),
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
                        label: "Feed",
                        icon: FaIcon(FontAwesomeIcons.addressCard)),
                    BottomNavigationBarItem(
                        label: "Cep", icon: Icon(Icons.get_app)),
                    BottomNavigationBarItem(
                        label: "Page2",
                        icon: FaIcon(
                          FontAwesomeIcons.percent,
                          color: Colors.red,
                          size: 25,
                        )),
                    BottomNavigationBarItem(
                        label: "Page3", icon: Icon(Icons.add_a_photo)),
                    BottomNavigationBarItem(
                        label: "Task List",
                        icon: FaIcon(
                          FontAwesomeIcons.listCheck,
                          color: Colors.green,
                          size: 25,
                        )),
                  ])
            ],
          )),
    );
  }
}
