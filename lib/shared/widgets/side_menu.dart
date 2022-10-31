import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Image.network(
            widget.imageURL,
            height: 70,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        for (var item in widget.sideMenuItens) item,
        const Divider(),
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.exit_to_app, color: Colors.white, size: 30),
                const SizedBox(width: 15),
                Text(
                  'Exit',
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Exit Dialog"),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    content: Wrap(
                      children: const [
                        Text("You exit the application"),
                        Text("Really wanted to exit ?"),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: const Text("Yes"),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                      ),
                      TextButton(
                          child: const Text("No"),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  );
                });
          },
        )
      ]),
    );
  }
}
