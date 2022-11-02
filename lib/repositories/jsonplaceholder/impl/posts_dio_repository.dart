import 'package:cervejaiadaappflutter/model/post_model.dart';
import 'package:cervejaiadaappflutter/repositories/jsonplaceholder_custom_dio.dart';
import 'package:cervejaiadaappflutter/repositories/jsonplaceholder/post_repository.dart';

class PostsDioRepository implements PostsRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    var jsonPlaceHolderCustomDio = JsonPlaceHolderCustomDio();
    var response = await jsonPlaceHolderCustomDio.dio.get("/posts");
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}