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

  // "store_id" field.
  String? _storeId;
  String get storeId => _storeId ?? '';
  bool hasStoreId() => _storeId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _qtyInStock = castToType<int>(snapshotData['qty_in_stock']);
    _medicineId = snapshotData['medicine_id'] as DocumentReference?;
    _storeId = snapshotData['store_id'] as String?;
    _status = snapshotData['status'] as String?;
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
  String? storeId,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'qty_in_stock': qtyInStock,
      'medicine_id': medicineId,
      'store_id': storeId,
      'status': status,
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
        e1?.storeId == e2?.storeId &&
        e1?.status == e2?.status;
  }

  @override
  int hash(StoreInventoryRecord? e) => const ListEquality()
      .hash([e?.qtyInStock, e?.medicineId, e?.storeId, e?.status]);

  @override
  bool isValidKey(Object? o) => o is StoreInventoryRecord;
}
