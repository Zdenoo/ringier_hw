import 'package:flutter/material.dart';
import '../../models/books.dart';

class ShowBookDetail extends StatelessWidget {
  final Book book;

  const ShowBookDetail({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(book.title),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Image.network(book.image),
            Text(
              book.url,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const Divider(
              thickness: 1,
            ),
            Text(
              book.price,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const Divider(
              thickness: 2,
            ),
            Text(
              book.subtitle,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("Dismiss"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
