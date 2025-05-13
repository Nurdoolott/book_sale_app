part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final CartItem item;
  AddToCartEvent(this.item);
}

class ClearCartEvent extends CartEvent {}
