import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenuItem extends StatefulWidget {
  const SideMenuItem({Key? key, required this.icon, required this.text, required this.callback})
      : super(key: key);

  final String text;
  final IconData icon;
  final callback;

  @override
  _SideMenuItemState createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<SideMenuItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(widget.icon, color: Colors.white, size: 30),
            const SizedBox(width: 15),
            Text(widget.text,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => widget.callback
            )
        );
      },
    );
  }
}
