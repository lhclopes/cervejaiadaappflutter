import 'package:cervejaiadaappflutter/model/card_detail.dart';

class CardDetailRepository {
  List<CardDetail> cardDetailList = [];

  CardDetailRepository() {
    CardDetail card1 = CardDetail(
        1,
        'My Card 1',
        'https://hermes.digitalinnovation.one/assets/diome/logo.png',
        'My Card 1 dadjsadlskj kjsdjadjl jdsjdlaj dskjdlkasjl dsajldjl ldas',
        1
    );

    CardDetail card2 = CardDetail(
        2,
        'My Card 2',
        'https://hermes.digitalinnovation.one/assets/diome/logo.png',
        'My Card 2 dadjsadlskj kjsdjadjl jdsjdlaj dskjdlkasjl dsajldjl ldas', 
        2
    );

    CardDetail card3 = CardDetail(
        3,
        'My Card 3',
        'https://hermes.digitalinnovation.one/assets/diome/logo.png',
        'My Card 3 dadjsadlskj kjsdjadjl jdsjdlaj dskjdlkasjl dsajldjl ldas',
        2
    );

    CardDetail card4 = CardDetail(
        4,
        'My Card 4',
        'https://hermes.digitalinnovation.one/assets/diome/logo.png',
        'My Card 4 dadjsadlskj kjsdjadjl jdsjdlaj dskjdlkasjl dsajldjl ldas',
        2
    );

    cardDetailList.add(card1);
    cardDetailList.add(card2);
    cardDetailList.add(card3);
    cardDetailList.add(card4);
  }

  Future<List<CardDetail>> getAll() async {
    await Future.delayed(const Duration(seconds: 3));

    return cardDetailList;
  }
}
