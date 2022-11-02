import 'package:cervejaiadaappflutter/model/comment_model.dart';
import 'package:cervejaiadaappflutter/repositories/jsonplaceholder/comments_repository.dart';
import 'package:cervejaiadaappflutter/repositories/jsonplaceholder_custom_dio.dart';

class CommentsDioRepository implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var jsonPlaceHolderCustomDio = JsonPlaceHolderCustomDio();
    var response =
        await jsonPlaceHolderCustomDio.dio.get("/posts/$postId/comments");
    return (response.data as List)
        .map((e) => CommentModel.fromJson(e))
        .toList();
  }
}