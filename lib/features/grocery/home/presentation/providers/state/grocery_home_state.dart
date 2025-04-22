part of 'grocery_home_notifier.dart';

class GroceryHomeState extends Equatable {
  final GroceryHomeEnum homeStatus;
  final List<GroceryProductItem> cart;
  final ApiState apiState;
  final List<GroceryProduct> products;

  const GroceryHomeState({
    this.homeStatus = GroceryHomeEnum.normal,
    this.cart = const [],
    this.apiState = ApiState.initial,
    this.products = const [],
  });

  const GroceryHomeState.initial({
    this.homeStatus = GroceryHomeEnum.normal,
    this.cart = const [],
    this.apiState = ApiState.initial,
    this.products = const [],
  });

  GroceryHomeState copyWith({
    GroceryHomeEnum? homeStatus,
    List<GroceryProductItem>? cart,
    ApiState? apiState,
    List<GroceryProduct>? products,
  }) {
    return GroceryHomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      cart: cart ?? this.cart,
      apiState: apiState ?? this.apiState,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [homeStatus, cart, apiState, products];
}

enum GroceryHomeEnum { normal, cart }
