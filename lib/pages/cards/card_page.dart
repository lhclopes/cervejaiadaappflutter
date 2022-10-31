import 'package:cervejaiadaappflutter/model/card_detail.dart';
import 'package:cervejaiadaappflutter/repositories/card_detail_repository.dart';
import 'package:cervejaiadaappflutter/shared/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  final String title = "Card Page";

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  List<CardDetail>? cardDetailList;
  var cardDetailRepository = CardDetailRepository();

  void loadData() async {
    cardDetailList = await cardDetailRepository.getAll();
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardDetailList == null ? Center(child: CircularProgressIndicator()) : 
      ListView(
        children: [
          for (var cardDetail in cardDetailList!)
            CustomCard(cardDetail: cardDetail)
        ]
      )
    );
  }
}
