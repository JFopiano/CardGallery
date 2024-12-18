import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "following_users" field.
  List<DocumentReference>? _followingUsers;
  List<DocumentReference> get followingUsers => _followingUsers ?? const [];
  bool hasFollowingUsers() => _followingUsers != null;

  // "users_following_me" field.
  List<DocumentReference>? _usersFollowingMe;
  List<DocumentReference> get usersFollowingMe => _usersFollowingMe ?? const [];
  bool hasUsersFollowingMe() => _usersFollowingMe != null;

  // "decks" field.
  DocumentReference? _decks;
  DocumentReference? get decks => _decks;
  bool hasDecks() => _decks != null;

  // "cardIDs" field.
  List<String>? _cardIDs;
  List<String> get cardIDs => _cardIDs ?? const [];
  bool hasCardIDs() => _cardIDs != null;

  // "interests" field.
  List<String>? _interests;
  List<String> get interests => _interests ?? const [];
  bool hasInterests() => _interests != null;

  // "prns" field.
  List<String>? _prns;
  List<String> get prns => _prns ?? const [];
  bool hasPrns() => _prns != null;

  // "p1" field.
  String? _p1;
  String get p1 => _p1 ?? '';
  bool hasP1() => _p1 != null;

  // "p2" field.
  String? _p2;
  String get p2 => _p2 ?? '';
  bool hasP2() => _p2 != null;

  // "p3" field.
  String? _p3;
  String get p3 => _p3 ?? '';
  bool hasP3() => _p3 != null;

  // "p4" field.
  String? _p4;
  String get p4 => _p4 ?? '';
  bool hasP4() => _p4 != null;

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
    _bio = snapshotData['bio'] as String?;
    _followingUsers = getDataList(snapshotData['following_users']);
    _usersFollowingMe = getDataList(snapshotData['users_following_me']);
    _decks = snapshotData['decks'] as DocumentReference?;
    _cardIDs = getDataList(snapshotData['cardIDs']);
    _interests = getDataList(snapshotData['interests']);
    _prns = getDataList(snapshotData['prns']);
    _p1 = snapshotData['p1'] as String?;
    _p2 = snapshotData['p2'] as String?;
    _p3 = snapshotData['p3'] as String?;
    _p4 = snapshotData['p4'] as String?;
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
  String? bio,
  DocumentReference? decks,
  String? p1,
  String? p2,
  String? p3,
  String? p4,
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
      'bio': bio,
      'decks': decks,
      'p1': p1,
      'p2': p2,
      'p3': p3,
      'p4': p4,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.intrestedPokemon == e2?.intrestedPokemon &&
        e1?.intrestedOnepiece == e2?.intrestedOnepiece &&
        e1?.intrestedMagic == e2?.intrestedMagic &&
        e1?.intrestedDragonBall == e2?.intrestedDragonBall &&
        e1?.bio == e2?.bio &&
        listEquality.equals(e1?.followingUsers, e2?.followingUsers) &&
        listEquality.equals(e1?.usersFollowingMe, e2?.usersFollowingMe) &&
        e1?.decks == e2?.decks &&
        listEquality.equals(e1?.cardIDs, e2?.cardIDs) &&
        listEquality.equals(e1?.interests, e2?.interests) &&
        listEquality.equals(e1?.prns, e2?.prns) &&
        e1?.p1 == e2?.p1 &&
        e1?.p2 == e2?.p2 &&
        e1?.p3 == e2?.p3 &&
        e1?.p4 == e2?.p4;
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
        e?.intrestedDragonBall,
        e?.bio,
        e?.followingUsers,
        e?.usersFollowingMe,
        e?.decks,
        e?.cardIDs,
        e?.interests,
        e?.prns,
        e?.p1,
        e?.p2,
        e?.p3,
        e?.p4
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
