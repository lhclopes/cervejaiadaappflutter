import 'package:cervejaiadaappflutter/model/card_detail.dart';
import 'package:cervejaiadaappflutter/pages/cards/card_detail_page1.dart';
import 'package:cervejaiadaappflutter/pages/cards/card_detail_page2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final CardDetail cardDetail;
  final page;

  const CustomCard({Key? key, required this.cardDetail, this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: double.infinity,
      child: Hero(
        tag: cardDetail.id,
        child: Card(
          elevation: 16,
          shadowColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      cardDetail.image,
                      height: 20,
                    ),
                    Text(
                      cardDetail.title,
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  cardDetail.text,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Colors.black),
                ),
                Container(
                    // color: Colors.amber,
                    height: 35,
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: TextButton(
                        child: const Text("Show more"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                    cardDetail.pageNumber == 1 ? CardDetailPage1(cardDetail: cardDetail) : CardDetailPage2(cardDetail: cardDetail)));
                        },
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
