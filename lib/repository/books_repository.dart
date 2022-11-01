import 'package:ringier_flutter_hw/models/books.dart';
import 'package:http/http.dart' as http;

class BooksRepository {
  var _searchTerm = "";

  String getTitle() {
    return _searchTerm;
  }

  Future<List<Book>> searchBooks(String query) async {
    _searchTerm = query;
    var httpclient = http.Client();
    //Search query not optimal, needs further improvements (c# will not search
    //correctly.)
    final response = await httpclient.get(
      Uri.https(
        'api.itbook.store',
        '/1.0/search/$query',
      ),
    );
    if (response.statusCode == 200) {
      try {
        final booksResult = booksResultFromJson(response.body);
        return booksResult.books;
      } catch (e) {
        return [];
      }
    }
    throw Exception('error fetching posts');
  }
}
