import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/cart_item.dart';
import '../infrastructure/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;

  CartBloc({required this.repository}) : super(CartInitial()) {
    on<AddToCartEvent>((event, emit) {
      repository.addToCart(event.item);
      emit(CartUpdated(repository.items));
    });

    on<ClearCartEvent>((event, emit) {
      repository.clearCart();
      emit(CartUpdated(repository.items));
    });
  }
}
