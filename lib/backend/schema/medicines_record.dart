import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicinesRecord extends FirestoreRecord {
  MedicinesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  bool hasBarcode() => _barcode != null;

  // "generic_name" field.
  String? _genericName;
  String get genericName => _genericName ?? '';
  bool hasGenericName() => _genericName != null;

  // "std_price" field.
  double? _stdPrice;
  double get stdPrice => _stdPrice ?? 0.0;
  bool hasStdPrice() => _stdPrice != null;

  void _initializeFields() {
    _barcode = snapshotData['barcode'] as String?;
    _genericName = snapshotData['generic_name'] as String?;
    _stdPrice = castToType<double>(snapshotData['std_price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medicines');

  static Stream<MedicinesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicinesRecord.fromSnapshot(s));

  static Future<MedicinesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicinesRecord.fromSnapshot(s));

  static MedicinesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicinesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicinesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicinesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicinesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicinesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicinesRecordData({
  String? barcode,
  String? genericName,
  double? stdPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'barcode': barcode,
      'generic_name': genericName,
      'std_price': stdPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicinesRecordDocumentEquality implements Equality<MedicinesRecord> {
  const MedicinesRecordDocumentEquality();

  @override
  bool equals(MedicinesRecord? e1, MedicinesRecord? e2) {
    return e1?.barcode == e2?.barcode &&
        e1?.genericName == e2?.genericName &&
        e1?.stdPrice == e2?.stdPrice;
  }

  @override
  int hash(MedicinesRecord? e) =>
      const ListEquality().hash([e?.barcode, e?.genericName, e?.stdPrice]);

  @override
  bool isValidKey(Object? o) => o is MedicinesRecord;
}
