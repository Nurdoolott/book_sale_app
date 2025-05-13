import 'package:flutter/material.dart';

class BookGridWidget extends StatelessWidget {
  const BookGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final books = List.generate(10, (index) => 'Book $index');

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.7,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: FlutterLogo(size: 60),
              ),
              const SizedBox(height: 8),
              Text(
                books[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('\$9.99'),
              const SizedBox(height: 4),
              ElevatedButton(
                onPressed: () {
                  // later: add to cart
                },
                child: const Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }
}
