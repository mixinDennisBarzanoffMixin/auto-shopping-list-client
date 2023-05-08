///
//  Generated code. Do not modify.
//  source: ShoppingList.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use shoppingListDescriptor instead')
const ShoppingList$json = const {
  '1': 'ShoppingList',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.ShoppingItem', '10': 'items'},
  ],
};

/// Descriptor for `ShoppingList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shoppingListDescriptor = $convert.base64Decode('CgxTaG9wcGluZ0xpc3QSIwoFaXRlbXMYASADKAsyDS5TaG9wcGluZ0l0ZW1SBWl0ZW1z');
@$core.Deprecated('Use shoppingItemDescriptor instead')
const ShoppingItem$json = const {
  '1': 'ShoppingItem',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'grams', '3': 2, '4': 1, '5': 1, '10': 'grams'},
  ],
};

/// Descriptor for `ShoppingItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shoppingItemDescriptor = $convert.base64Decode('CgxTaG9wcGluZ0l0ZW0SEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgVncmFtcxgCIAEoAVIFZ3JhbXM=');
