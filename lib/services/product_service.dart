import 'dart:convert';

import 'package:auto_shopping_list_client/protobuf/store.pb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final storesRef = FirebaseFirestore.instance
    .collection('stores')
    .withConverter<Store>(
      fromFirestore: (snapshots, _) {
        print(snapshots.data());
        return Store(
          id: snapshots.id,
        )..mergeFromProto3Json(snapshots.data()!);
      },
      toFirestore: (store, _) => jsonDecode(jsonEncode(store.toProto3Json())),
    );
