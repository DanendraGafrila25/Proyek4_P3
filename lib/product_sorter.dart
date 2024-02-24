import 'package:flutter/material.dart';
import 'model/product.dart';

class SortingScreen extends StatefulWidget {
  final List<Product> products;
  final bool ascendingOrder;

  const SortingScreen({
    Key? key,
    required this.products,
    required this.ascendingOrder,
  }) : super(key: key);

  @override
  _SortingScreenState createState() => _SortingScreenState();
}

class _SortingScreenState extends State<SortingScreen> {
  late List<Product> sortedProducts;

  @override
  void initState() {
    super.initState();
    // Initial sorting, you can change this based on your requirement
    sortedProducts =
        sortProductsByPrice(widget.products, widget.ascendingOrder);
  }

  List<Product> sortProductsByPrice(
      List<Product> products, bool ascendingOrder) {
    List<Product> sortedList = List.from(products);

    sortedList.sort((a, b) {
      if (ascendingOrder) {
        return a.price.compareTo(b.price);
      } else {
        return b.price.compareTo(a.price);
      }
    });

    return sortedList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sorted Products'),
      ),
      body: ListView.builder(
        itemCount: sortedProducts.length,
        itemBuilder: (context, index) {
          final product = sortedProducts[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Price: \$${product.price}'),
          );
        },
      ),
    );
  }
}
