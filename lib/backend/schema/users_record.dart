import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "intrested_pokemon" field.
  bool? _intrestedPokemon;
  bool get intrestedPokemon => _intrestedPokemon ?? false;
  bool hasIntrestedPokemon() => _intrestedPokemon != null;

  // "intrested_onepiece" field.
  bool? _intrestedOnepiece;
  bool get intrestedOnepiece => _intrestedOnepiece ?? false;
  bool hasIntrestedOnepiece() => _intrestedOnepiece != null;

  // "intrested_magic" field.
  bool? _intrestedMagic;
  bool get intrestedMagic => _intrestedMagic ?? false;
  bool hasIntrestedMagic() => _intrestedMagic != null;

  // "intrested_dragon_ball" field.
  bool? _intrestedDragonBall;
  bool get intrestedDragonBall => _intrestedDragonBall ?? false;
  bool hasIntrestedDragonBall() => _intrestedDragonBall != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _intrestedPokemon = snapshotData['intrested_pokemon'] as bool?;
    _intrestedOnepiece = snapshotData['intrested_onepiece'] as bool?;
    _intrestedMagic = snapshotData['intrested_magic'] as bool?;
    _intrestedDragonBall = snapshotData['intrested_dragon_ball'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? intrestedPokemon,
  bool? intrestedOnepiece,
  bool? intrestedMagic,
  bool? intrestedDragonBall,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'intrested_pokemon': intrestedPokemon,
      'intrested_onepiece': intrestedOnepiece,
      'intrested_magic': intrestedMagic,
      'intrested_dragon_ball': intrestedDragonBall,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.intrestedPokemon == e2?.intrestedPokemon &&
        e1?.intrestedOnepiece == e2?.intrestedOnepiece &&
        e1?.intrestedMagic == e2?.intrestedMagic &&
        e1?.intrestedDragonBall == e2?.intrestedDragonBall;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.intrestedPokemon,
        e?.intrestedOnepiece,
        e?.intrestedMagic,
        e?.intrestedDragonBall
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
