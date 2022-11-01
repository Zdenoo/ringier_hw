import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final TextEditingController inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.95;

    return Scaffold(
      appBar: AppBar(title: const Text('IT Book Search')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Spacer(flex: 1),
              Image.asset(
                'assets/logo.png',
                height: 100,
              ),
              const Spacer(flex: 2),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: inputController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                ),
              ),
              const Spacer(flex: 2),
              Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.blue,
                      fixedSize: Size(width, 50),
                    ),
                    child: const Text('Search'),
                    onPressed: () {
                      context
                          .read<BooksBloc>()
                          .add(SearchBooks(searchTerm: inputController.text));
                      context.read<NavigationBloc>().add(ResultsPage());
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
