// To parse this JSON data, do
//
//     final booksResult = booksResultFromJson(jsonString);

import 'dart:convert';

BooksResult booksResultFromJson(String str) =>
    BooksResult.fromJson(json.decode(str));

String booksResultToJson(BooksResult data) => json.encode(data.toJson());

class BooksResult {
  BooksResult({
    required this.total,
    required this.page,
    required this.books,
  });

  String total;
  String page;
  List<Book> books;

  factory BooksResult.fromJson(Map<String, dynamic> json) => BooksResult(
        total: json["total"],
        page: json["page"],
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
      };
}

class Book {
  Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  String title;
  String subtitle;
  String isbn13;
  String price;
  String image;
  String url;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["title"],
        subtitle: json["subtitle"],
        isbn13: json["isbn13"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "isbn13": isbn13,
        "price": price,
        "image": image,
        "url": url,
      };
}
