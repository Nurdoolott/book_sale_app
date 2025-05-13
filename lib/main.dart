import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'features/cart/application/cart_bloc.dart';
import 'features/cart/infrastructure/cart_repository.dart';
import 'features/book/presentation/pages/home_page.dart';
import 'features/book/presentation/pages/book_view_page.dart';
import 'features/book/presentation/pages/cart_view_page.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/book/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BookViewPage(bookId: id);
      },
    ),
    GoRoute(path: '/cart', builder: (context, state) => const CartViewPage()),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc(repository: CartRepository())),
      ],
      child: MaterialApp.router(
        title: 'Book Sale App',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
