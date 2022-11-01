import 'package:cervejaiadaappflutter/model/card_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDetailPage1 extends StatelessWidget {
  const CardDetailPage1({Key? key, required this.cardDetail}) : super(key: key);

  final CardDetail cardDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Image.network(
                  cardDetail.image,
                  height: 140,
                ),
            ),
            const SizedBox(height: 16),
            Text(
              cardDetail.title,
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(height: 16),
            Text(
              cardDetail.text,
              textAlign: TextAlign.justify,
              style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
