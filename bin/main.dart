// ignore_for_file: avoid_print

Future<void> createOrderMessage() async {
  var order = await fetchUserOrder();
  print('Your order is: $order');
}

Future<String> fetchUserOrder() async {
  // Imagine that this function is fetching user info but encounters a bug
  return Future.delayed(const Duration(seconds: 2), () => 'Teste');
}

void main() {
  createOrderMessage();
  print('Fetching user order...');
}
