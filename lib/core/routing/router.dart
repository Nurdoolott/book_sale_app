
import 'package:go_router/go_router.dart';
import '../../features/book/presentation/pages/home_page.dart';
import '../../features/book/presentation/pages/book_view_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/book/:id',
      builder: (context, state) {
        final bookId = state.pathParameters['id']!;
        return BookViewPage(bookId: bookId);
      },
    ),
  ],
);
