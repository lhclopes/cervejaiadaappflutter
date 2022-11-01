import 'package:cervejaiadaappflutter/app_images.dart';
import 'package:cervejaiadaappflutter/pages/aleatory_numbers/aleatory_numbers_hive_page.dart';
import 'package:cervejaiadaappflutter/pages/aleatory_numbers/aleatory_numbers_shared_preferences_page.dart';
import 'package:cervejaiadaappflutter/pages/marvel/characters_page.dart';
import 'package:cervejaiadaappflutter/pages/posts_page.dart';
import 'package:cervejaiadaappflutter/pages/settings/settings_hive_page.dart';
import 'package:cervejaiadaappflutter/pages/settings/settings_shared_preferences_page.dart';
import 'package:cervejaiadaappflutter/pages/task/task_back4app_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cervejaiadaappflutter/shared/widgets/side_menu.dart';
import 'package:cervejaiadaappflutter/shared/widgets/side_menu_item.dart';
import 'package:cervejaiadaappflutter/pages/new_user.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 250,
        backgroundColor: Colors.black,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            child: UserAccountsDrawerHeader(
                decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 49, 49, 49)),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                    borderRadius:BorderRadius.circular(50),
                    child: Image.asset(AppImages.profile2),
                  )
                ),
                accountName: const Text('nome'),
                accountEmail: const Text('email@email.com')),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.camera),
                          title: const Text("Camera"),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.photo_album),
                          title: const Text("Galeria"),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
          Expanded(
            child: ListView(
            children: const [
              SideMenu(
                imageURL:
                    "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                sideMenuItens: [
                  SideMenuItem(
                      icon: Icons.home,
                      text: 'Menu Item 1',
                      callback: NewUser(title: 'New User 1')),
                  SideMenuItem(
                      icon: Icons.settings,
                      text: 'Settings',
                      callback: SettingsSharedPreferencesPage()),
                  SideMenuItem(
                      icon: Icons.settings,
                      text: 'Settings 2',
                      callback: SettingsHivePage()),
                  SideMenuItem(
                      icon: Icons.numbers,
                      text: 'Aleatory',
                      callback: AleatoryNumbersSharedPreferencesPage()),
                  SideMenuItem(
                      icon: Icons.numbers,
                      text: 'Aleatory2',
                      callback: AleatoryNumbersHivePage()),
                  SideMenuItem(
                      icon: Icons.list,
                      text: 'Posts',
                      callback: PostsPage()),
                  SideMenuItem(
                      icon: Icons.zoom_in,
                      text: 'Marvel',
                      callback: CharactersPage()),
                  SideMenuItem(
                      icon: Icons.zoom_in,
                      text: 'Task Back4App',
                      callback: TaskBack4AppPage()),
                ]),
            ]),
          ),
          Container(
              height: 60,
              color: const Color.fromARGB(255, 49, 49, 49),
              child: Center(
                child: Text(
                  "App Version 1.0",
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              )),
        ]));
  }
}
