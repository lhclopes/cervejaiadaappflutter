import 'package:cervejaiadaappflutter/pages/cards/card_page.dart';
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
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
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
                          leading: Icon(Icons.camera),
                          title: const Text("Camera"),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.photo_album),
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
          const Expanded(
            child: SideMenu(
                imageURL:
                    "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                sideMenuItens: [
                  SideMenuItem(
                      icon: Icons.home,
                      text: 'Menu Item 1',
                      callback: NewUser(title: 'New User 1')),
                  SideMenuItem(
                      icon: Icons.person,
                      text: 'Menu Item 2',
                      callback: NewUser(title: 'New User 2')),
                  SideMenuItem(
                      icon: Icons.list,
                      text: 'Menu Item 3',
                      callback: NewUser(title: 'New User 3')),
                ]),
          ),
          Container(
              height: 60,
              color: Color.fromARGB(255, 49, 49, 49),
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
