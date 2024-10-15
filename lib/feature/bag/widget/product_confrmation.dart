import 'package:e_commerce_task/feature/products/model/product_model.dart';
import 'package:flutter/material.dart';

void showConfirmationDialog({
  required BuildContext context,
  required List<Product> products,
  required VoidCallback onConfirm,
}) {
  // Calculate total price
  double totalPrice = products.fold(
    0,
    (sum, product) => sum + (product.price * product.count),
  );

  // Format the price (optional)
  // final formattedPrice = NumberFormat.currency(symbol: '\$').format(totalPrice);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Are you sure you want to buy these products ?',
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary, fontSize: 20),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // List of products with count
            ...products.map((product) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '${product.title} \n (Product count : ${product.count})',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              );
            }),
            SizedBox(height: 16.0),
            // Total price
            Text(
              'Total Price: ${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 20),
            ),
          ],
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  onConfirm();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).colorScheme.primary),
                  child: Text(
                    'OK',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}
