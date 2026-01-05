import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoresRecord extends FirestoreRecord {
  StoresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "store_name" field.
  String? _storeName;
  String get storeName => _storeName ?? '';
  bool hasStoreName() => _storeName != null;

  // "owner_uid" field.
  String? _ownerUid;
  String get ownerUid => _ownerUid ?? '';
  bool hasOwnerUid() => _ownerUid != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "license_number" field.
  String? _licenseNumber;
  String get licenseNumber => _licenseNumber ?? '';
  bool hasLicenseNumber() => _licenseNumber != null;

  // "is_generic_store" field.
  bool? _isGenericStore;
  bool get isGenericStore => _isGenericStore ?? false;
  bool hasIsGenericStore() => _isGenericStore != null;

  void _initializeFields() {
    _location = snapshotData['location'] as LatLng?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _storeName = snapshotData['store_name'] as String?;
    _ownerUid = snapshotData['owner_uid'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _licenseNumber = snapshotData['license_number'] as String?;
    _isGenericStore = snapshotData['is_generic_store'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stores');

  static Stream<StoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoresRecord.fromSnapshot(s));

  static Future<StoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoresRecord.fromSnapshot(s));

  static StoresRecord fromSnapshot(DocumentSnapshot snapshot) => StoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoresRecordData({
  LatLng? location,
  String? phoneNumber,
  String? storeName,
  String? ownerUid,
  DateTime? createdAt,
  String? licenseNumber,
  bool? isGenericStore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'location': location,
      'phone_number': phoneNumber,
      'store_name': storeName,
      'owner_uid': ownerUid,
      'created_at': createdAt,
      'license_number': licenseNumber,
      'is_generic_store': isGenericStore,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoresRecordDocumentEquality implements Equality<StoresRecord> {
  const StoresRecordDocumentEquality();

  @override
  bool equals(StoresRecord? e1, StoresRecord? e2) {
    return e1?.location == e2?.location &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.storeName == e2?.storeName &&
        e1?.ownerUid == e2?.ownerUid &&
        e1?.createdAt == e2?.createdAt &&
        e1?.licenseNumber == e2?.licenseNumber &&
        e1?.isGenericStore == e2?.isGenericStore;
  }

  @override
  int hash(StoresRecord? e) => const ListEquality().hash([
        e?.location,
        e?.phoneNumber,
        e?.storeName,
        e?.ownerUid,
        e?.createdAt,
        e?.licenseNumber,
        e?.isGenericStore
      ]);

  @override
  bool isValidKey(Object? o) => o is StoresRecord;
}
