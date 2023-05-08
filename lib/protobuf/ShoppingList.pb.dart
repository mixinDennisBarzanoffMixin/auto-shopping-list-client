///
//  Generated code. Do not modify.
//  source: ShoppingList.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ShoppingList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ShoppingList', createEmptyInstance: create)
    ..pc<ShoppingItem>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: ShoppingItem.create)
    ..hasRequiredFields = false
  ;

  ShoppingList._() : super();
  factory ShoppingList({
    $core.Iterable<ShoppingItem>? items,
  }) {
    final _result = create();
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory ShoppingList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShoppingList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShoppingList clone() => ShoppingList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShoppingList copyWith(void Function(ShoppingList) updates) => super.copyWith((message) => updates(message as ShoppingList)) as ShoppingList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShoppingList create() => ShoppingList._();
  ShoppingList createEmptyInstance() => create();
  static $pb.PbList<ShoppingList> createRepeated() => $pb.PbList<ShoppingList>();
  @$core.pragma('dart2js:noInline')
  static ShoppingList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShoppingList>(create);
  static ShoppingList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ShoppingItem> get items => $_getList(0);
}

class ShoppingItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ShoppingItem', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grams', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  ShoppingItem._() : super();
  factory ShoppingItem({
    $core.String? name,
    $core.double? grams,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (grams != null) {
      _result.grams = grams;
    }
    return _result;
  }
  factory ShoppingItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShoppingItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShoppingItem clone() => ShoppingItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShoppingItem copyWith(void Function(ShoppingItem) updates) => super.copyWith((message) => updates(message as ShoppingItem)) as ShoppingItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShoppingItem create() => ShoppingItem._();
  ShoppingItem createEmptyInstance() => create();
  static $pb.PbList<ShoppingItem> createRepeated() => $pb.PbList<ShoppingItem>();
  @$core.pragma('dart2js:noInline')
  static ShoppingItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShoppingItem>(create);
  static ShoppingItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get grams => $_getN(1);
  @$pb.TagNumber(2)
  set grams($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGrams() => $_has(1);
  @$pb.TagNumber(2)
  void clearGrams() => clearField(2);
}

