import 'dart:async';
import 'dart:convert';

import 'package:auto_shopping_list_client/RendersShop.dart';
import 'package:auto_shopping_list_client/choose_store_view.dart';
import 'package:auto_shopping_list_client/config.dart';
import 'package:auto_shopping_list_client/protobuf/ShoppingList.pb.dart';
import 'package:auto_shopping_list_client/protobuf/store.pb.dart';
import 'package:auto_shopping_list_client/services/clickup_service.dart';
import 'package:auto_shopping_list_client/services/product_service.dart';
import 'package:auto_shopping_list_client/store_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var data = <Store>[];
  late StreamSubscription _sub;
  final clickup = ClickUpApi(clickUpToken);
  ShoppingList? shoppingList;
  Store? chosenStore;
  @override
  void initState() {
    clickup.fetchShoppingList().then((value) {
      setState(() {
        shoppingList = value;
      });
    });
    _sub = storesRef.snapshots().listen((event) {
      setState(() {
        data = event.docs.map((e) => e.data()).toList();
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: () {
            if (data.isEmpty || shoppingList == null) {
              return const Center(child: CircularProgressIndicator());
            }
            if (chosenStore == null) {
              return ChooseStoreView(stores: data, onStoreChanged: (store) {
                setState(() {
                  chosenStore = store;
                });
              });
            }

            return StoreView(store: chosenStore!, list: shoppingList!);
          }(),
        ),
      ),
    );
  }
}

