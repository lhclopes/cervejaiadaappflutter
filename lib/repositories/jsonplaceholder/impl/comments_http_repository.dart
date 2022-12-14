import 'dart:convert';

import 'package:cervejaiadaappflutter/model/comment_model.dart';
import 'package:cervejaiadaappflutter/repositories/jsonplaceholder/comments_repository.dart';
import 'package:http/http.dart' as http;

class CommentsHttpRepository implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts/$postId/comments"));
    if (response.statusCode == 200) {
      var jsonComments = jsonDecode(response.body);
      return (jsonComments as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
    }
    return [];
  }
}