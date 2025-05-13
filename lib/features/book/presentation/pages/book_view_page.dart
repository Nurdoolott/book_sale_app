import 'package:flutter/material.dart';
import '../../../cart/domain/cart_item.dart';
import '../../../cart/application/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BookViewPage extends StatefulWidget {
  final String bookId;

  const BookViewPage({super.key, required this.bookId});

  @override
  State<BookViewPage> createState() => _BookViewPageState();
}

class _BookViewPageState extends State<BookViewPage> {
  int countInCart = 0;

  @override
  Widget build(BuildContext context) {
    // Убактылуу фейк маалымат
    final book = {
      'title': 'Sample Book',
      'price': 9.99,
      'pages': 120,
      'category': 'Fiction',
      'image': 'https://via.placeholder.com/150',
    };

    return Scaffold(
      appBar: AppBar(title: Text(book['title'] as String)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(book['image'] as String, height: 180)),
            const SizedBox(height: 16),
            Text(
              'Price: \$${book['price']}',
              style: const TextStyle(fontSize: 18),
            ),
            Text('Pages: ${book['pages']}'),
            Text('Category: ${book['category']}'),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  onPressed:
                      countInCart > 0
                          ? () => setState(() => countInCart--)
                          : null,
                  icon: const Icon(Icons.remove),
                ),
                Text('$countInCart', style: const TextStyle(fontSize: 18)),
                IconButton(
                  onPressed: () => setState(() => countInCart++),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
            onPressed: () {
              final cartItem = CartItem(
                id: widget.bookId,
                title: book['title'] as String,
                price: book['price'] as double,
                count: countInCart > 0 ? countInCart : 1,
              );

              context.read<CartBloc>().add(AddToCartEvent(cartItem));

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${book['title']} added to cart")),
              );
            },
            child: const Text('Add to Cart'),
          ),

          ],
        ),
      ),
    );
  }
}
