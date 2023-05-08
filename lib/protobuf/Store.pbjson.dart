///
//  Generated code. Do not modify.
//  source: Store.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use productLocationDescriptor instead')
const ProductLocation$json = const {
  '1': 'ProductLocation',
  '2': const [
    const {'1': 'product_name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'x', '3': 2, '4': 1, '5': 2, '10': 'x'},
    const {'1': 'y', '3': 3, '4': 1, '5': 2, '10': 'y'},
  ],
};

/// Descriptor for `ProductLocation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List productLocationDescriptor = $convert.base64Decode('Cg9Qcm9kdWN0TG9jYXRpb24SGgoMcHJvZHVjdF9uYW1lGAEgASgJUgRuYW1lEgwKAXgYAiABKAJSAXgSDAoBeRgDIAEoAlIBeQ==');
@$core.Deprecated('Use storeDescriptor instead')
const Store$json = const {
  '1': 'Store',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'product_locations', '3': 3, '4': 3, '5': 11, '6': '.ProductLocation', '10': 'product_location'},
  ],
};

/// Descriptor for `Store`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeDescriptor = $convert.base64Decode('CgVTdG9yZRIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRI9ChFwcm9kdWN0X2xvY2F0aW9ucxgDIAMoCzIQLlByb2R1Y3RMb2NhdGlvblIQcHJvZHVjdF9sb2NhdGlvbg==');
@$core.Deprecated('Use storesDescriptor instead')
const Stores$json = const {
  '1': 'Stores',
  '2': const [
    const {'1': 'stores', '3': 1, '4': 3, '5': 11, '6': '.Store', '10': 'stores'},
  ],
};

/// Descriptor for `Stores`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storesDescriptor = $convert.base64Decode('CgZTdG9yZXMSHgoGc3RvcmVzGAEgAygLMgYuU3RvcmVSBnN0b3Jlcw==');
