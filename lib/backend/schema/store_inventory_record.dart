import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoreInventoryRecord extends FirestoreRecord {
  StoreInventoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "qty_in_stock" field.
  int? _qtyInStock;
  int get qtyInStock => _qtyInStock ?? 0;
  bool hasQtyInStock() => _qtyInStock != null;

  // "medicine_id" field.
  DocumentReference? _medicineId;
  DocumentReference? get medicineId => _medicineId;
  bool hasMedicineId() => _medicineId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "unit_price" field.
  double? _unitPrice;
  double get unitPrice => _unitPrice ?? 0.0;
  bool hasUnitPrice() => _unitPrice != null;

  // "last_updated" field.
  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _lastUpdated;
  bool hasLastUpdated() => _lastUpdated != null;

  // "store_ref" field.
  DocumentReference? _storeRef;
  DocumentReference? get storeRef => _storeRef;
  bool hasStoreRef() => _storeRef != null;

  // "is_generic" field.
  bool? _isGeneric;
  bool get isGeneric => _isGeneric ?? false;
  bool hasIsGeneric() => _isGeneric != null;

  void _initializeFields() {
    _qtyInStock = castToType<int>(snapshotData['qty_in_stock']);
    _medicineId = snapshotData['medicine_id'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _unitPrice = castToType<double>(snapshotData['unit_price']);
    _lastUpdated = snapshotData['last_updated'] as DateTime?;
    _storeRef = snapshotData['store_ref'] as DocumentReference?;
    _isGeneric = snapshotData['is_generic'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('store_inventory');

  static Stream<StoreInventoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoreInventoryRecord.fromSnapshot(s));

  static Future<StoreInventoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoreInventoryRecord.fromSnapshot(s));

  static StoreInventoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StoreInventoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoreInventoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoreInventoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoreInventoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoreInventoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoreInventoryRecordData({
  int? qtyInStock,
  DocumentReference? medicineId,
  String? status,
  double? unitPrice,
  DateTime? lastUpdated,
  DocumentReference? storeRef,
  bool? isGeneric,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'qty_in_stock': qtyInStock,
      'medicine_id': medicineId,
      'status': status,
      'unit_price': unitPrice,
      'last_updated': lastUpdated,
      'store_ref': storeRef,
      'is_generic': isGeneric,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoreInventoryRecordDocumentEquality
    implements Equality<StoreInventoryRecord> {
  const StoreInventoryRecordDocumentEquality();

  @override
  bool equals(StoreInventoryRecord? e1, StoreInventoryRecord? e2) {
    return e1?.qtyInStock == e2?.qtyInStock &&
        e1?.medicineId == e2?.medicineId &&
        e1?.status == e2?.status &&
        e1?.unitPrice == e2?.unitPrice &&
        e1?.lastUpdated == e2?.lastUpdated &&
        e1?.storeRef == e2?.storeRef &&
        e1?.isGeneric == e2?.isGeneric;
  }

  @override
  int hash(StoreInventoryRecord? e) => const ListEquality().hash([
        e?.qtyInStock,
        e?.medicineId,
        e?.status,
        e?.unitPrice,
        e?.lastUpdated,
        e?.storeRef,
        e?.isGeneric
      ]);

  @override
  bool isValidKey(Object? o) => o is StoreInventoryRecord;
}
