import 'dart:async';
import 'dart:convert';

import 'package:auto_shopping_list_client/RendersShop.dart';
import 'package:auto_shopping_list_client/protobuf/store.pb.dart';
import 'package:auto_shopping_list_client/services/product_service.dart';
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
  @override
  void initState() {
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
      home: Scaffold(
        backgroundColor: Colors.white,
        body: () {
          if (data.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return Builder(
            builder: (context) {
              return InteractiveViewer(
                minScale: 0.5,
                maxScale: 3.0,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: RenderShop(
                          store: data.first, 
                          onNewProductCreated: (ProductLocation locaion) {
                            print(locaion.toProto3Json());
                            print(jsonEncode(locaion.toProto3Json()));
                            data.first.productLocations.add(locaion);
                            storesRef.doc(data.first.id).update(jsonDecode(jsonEncode(data.first.toProto3Json())));
                          }, 
                          onShouldDelete: (ProductLocation locaion) {
                            data.first.productLocations.remove(locaion);
                            storesRef.doc(data.first.id).update(jsonDecode(jsonEncode(data.first.toProto3Json())));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          );
        }(),
      ),
    );
  }
}

