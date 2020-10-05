part of 'discover_bloc.dart';

abstract class DiscoverState extends Equatable {
  const DiscoverState();

  @override
  List<Object> get props => [];
}

class DiscoverLoading extends DiscoverState {}

class DiscoverLoadFinished extends DiscoverState {
  final bool isSuccess;
  final List<Product> products;

  DiscoverLoadFinished({this.products = const [], this.isSuccess = false});

  @override
  List<Object> get props => [products, isSuccess];

  @override
  String toString() {
    return 'DiscoverLoadFinished{products: $products}';
  }
}
