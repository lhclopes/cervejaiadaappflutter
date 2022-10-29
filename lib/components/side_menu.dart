import 'package:flutter/material.dart';
import 'package:cervejaiadaappflutter/components/side_menu_item.dart';
import 'package:cervejaiadaappflutter/pages/Login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenu extends StatefulWidget {
  const SideMenu(
      {Key? key, required this.imageURL, required this.sideMenuItens})
      : super(key: key);

  final String imageURL;
  final List sideMenuItens;

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child:
                      Image.network(
                        widget.imageURL,
                        height: 70,
                      ),
                    ),
                  const SizedBox(
                    height: 40,
                  ),
                  for (var item in widget.sideMenuItens) item,
                  const Divider(),
                  const SideMenuItem(icon: Icons.exit_to_app, text: 'Exit', callback: LoginPage()),
                ]
              ),
            ),
          ),
          Container(
            height: 60,
            color: Color.fromARGB(255, 49, 49, 49),
            child: Center(
              child: Text("App Version 1.0",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ),
              ),
            )
          )
        ]
      ),
    );
  }
}
