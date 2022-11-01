import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ringier_flutter_hw/pages/widgets/book_detail_widget.dart';

import '../models/books.dart';

class BooksResultPage extends StatefulWidget {
  const BooksResultPage({super.key});
  @override
  State<BooksResultPage> createState() => _BooksResultPage();
}

class _BooksResultPage extends State<BooksResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Results"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => context.read<NavigationBloc>().add(SearchPage()),
          )),
      body: BlocBuilder<BooksBloc, BooksState>(
        builder: (context, state) {
          if (state is BooksLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BooksLoaded) {
            if (state.books.isEmpty) {
              return const Align(
                  alignment: Alignment.center, child: Text("No Books Found"));
            }
            return BooksListView(books: state.books);
          }
          if (state is BooksError) {}
          return const Align(
              alignment: Alignment.center, child: Text("Error loading books"));
        },
      ),
    );
  }
}

class BooksListView extends StatelessWidget {
  final List<Book> books;

  const BooksListView({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              return BooksSearchList(
                book: books[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class BooksSearchList extends StatelessWidget {
  final Book book;
  const BooksSearchList({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () async {
          await showDialog(
            context: context,
            builder: (BuildContext context) => ShowBookDetail(
              book: book,
            ),
          );
        },
        leading: Image.network(book.image),
        title: Text(book.title),
      ),
    );
  }
}
