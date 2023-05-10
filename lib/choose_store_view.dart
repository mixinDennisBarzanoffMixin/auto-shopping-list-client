import 'package:auto_shopping_list_client/protobuf/store.pb.dart';
import 'package:flutter/material.dart';

class ChooseStoreView extends StatelessWidget {
  final List<Store> stores;
  final void Function(Store store) onStoreChanged;
  const ChooseStoreView({Key? key, required this.stores, required this.onStoreChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final store in this.stores)
          GestureDetector(
            onTap: () {
              onStoreChanged(store);
            },
            child: Container(
              width: 100,
              height: 100,
              child: Text(store.name),
            ),
          ),
      ],
    );
  }
}