import 'dart:convert';

import 'package:auto_shopping_list_client/RendersShop.dart';
import 'package:auto_shopping_list_client/protobuf/ShoppingList.pb.dart';
import 'package:auto_shopping_list_client/protobuf/store.pb.dart';
import 'package:auto_shopping_list_client/services/product_service.dart';
import 'package:flutter/material.dart';

class StoreView extends StatelessWidget {
  final Store store;
  final ShoppingList list;
  const StoreView({Key? key, required this.store, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemsNotInMap = list.items.where((item) {
      if (store.productLocations.any((element) => element.productName == item.name)) {
        return false;
      }
      return true;
    }).toList();
    final productLocationsNotListed = store.productLocations.where((element) {
      // if not in shopping list -> exclude
      if (!list.items.any((item) => item.name == element.productName)) {
        return false;
      }
      if (itemsNotInMap.any((item) => item.name == element.productName)) {
        return false;
      }
      return true;
    }).toList();
    
    return Builder(
      builder: (context) {
        return InteractiveViewer(
          minScale: 0.5,
          maxScale: 3.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: RenderShop(
                      onNewProductCreated: (ProductLocation locaion) {
                        print(locaion.toProto3Json());
                        print(jsonEncode(locaion.toProto3Json()));
                        store.productLocations.add(locaion);
                        storesRef.doc(store.id).update(jsonDecode(jsonEncode(store.toProto3Json())));
                      }, 
                      onShouldDelete: (ProductLocation locaion) {
                        store.productLocations.remove(locaion);
                        storesRef.doc(store.id).set(store);
                      },
                      locations: productLocationsNotListed, 
                      name: store.name, 
                      items: itemsNotInMap,
                    ),
                  ),
                ),
                for (final item in itemsNotInMap) 
                  Text('${item.name} - ${item.grams}g'),
              ],
            ),
          ),
        );
      }
    );
  }
}