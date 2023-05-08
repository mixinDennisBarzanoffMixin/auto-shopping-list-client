import 'package:auto_shopping_list_client/protobuf/store.pb.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'protobuf/ShoppingList.pb.dart';


class RenderShop extends StatelessWidget {
  final List<ProductLocation> locations;
  final List<ShoppingItem> items;
  final String name;
  final void Function(ProductLocation locaion) onNewProductCreated;
  final void Function(ProductLocation locaion) onShouldDelete;
  const RenderShop({super.key, required this.onNewProductCreated, required this.onShouldDelete, required this.locations, required this.name, required this.items});
  
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Center(child: Text(name)),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(BorderSide(color: Colors.black)),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: GestureDetector(
                        onTapUp: (TapUpDetails details) async {
                          Offset inProportions = getOffset(context, details, constraints);

                          print('Tapped at local position: $inProportions');
                          if (items.isEmpty) return;
                          // show dialog that asks for name and return through navigator
                          String? name = await getProductName(context);
                          if (name == null) return;
                          onNewProductCreated(ProductLocation(
                            productName: name,
                            x: inProportions.dx,
                            y: inProportions.dy,
                          ));
                        },
                      ),
                    ),

                    for (final product in locations) 
                      Align(
                        alignment: convertAlignment(Alignment(product.x, product.y)),
                        child: const Icon(Icons.circle, size: 5),
                      ),
                    for (final product in locations) 
                      Align(
                        alignment: convertAlignment(
                          Alignment(product.x, product.y) + const Alignment(0, 0.05),
                        ),
                        child: Text(product.productName),
                      ),
                    for (final product in locations)
                      Align(
                        alignment: convertAlignment(
                          Alignment(product.x, product.y),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            onShouldDelete(product);
                          },
                          child: Container(
                            width: constraints.maxWidth * 0.1,
                            height: constraints.maxWidth * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.5),
                              shape: BoxShape.circle,
                            )
                          ),
                        ),
                      )
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Offset getOffset(BuildContext context, TapUpDetails details, BoxConstraints constraints) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    // Reverse the y-axis by subtracting the local y-coordinate from the height of the screen
    final double convertedYOffset = constraints.maxHeight - localOffset.dy;
    final Offset convertedOffset = Offset(localOffset.dx, convertedYOffset);
    // Do something with the converted offset
    final inProportions = Offset(convertedOffset.dx / constraints.maxWidth, convertedOffset.dy / constraints.maxHeight);
    return inProportions;
  }

  /// Ask the user in a dialog for names from `items` as a dropdown choice and gets the name
  Future<String?> getProductName(BuildContext context) async {
    final String? name = await showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text('Product Name'),
        content: DropdownButton<String>(
          items: items.map((e) => DropdownMenuItem<String>(
            value: e.name,
            child: Text(e.name),
          )).toList(),
          onChanged: (String? value) {
            Navigator.of(context).pop(value);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            }, 
            child: const Text('Cancel'),
          ),
        ],
      );
    });
    // final String? name = await showDialog(context: context, builder: (context) {
    //   final controller = TextEditingController();
    //   return AlertDialog(
    //     title: const Text('Product Name'),
    //     content: TextField(
    //       controller: controller,
    //     ),
    //     actions: [
    //       TextButton(
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //         }, 
    //         child: const Text('Cancel'),
    //       ),
    //       TextButton(
    //         onPressed: () {
    //           Navigator.of(context).pop(
    //             controller.text,
    //           );
    //         }, 
    //         child: const Text('Save'),
    //       ),
    //     ],
    //   );
    // });
    return name;
  }
  Alignment convertAlignment(Alignment alignment) {
    final x = (alignment.x * 2) - 1;
    final y = (alignment.y * 2) - 1;
    return Alignment(x, -y);
  }

}