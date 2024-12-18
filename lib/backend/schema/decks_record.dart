import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DecksRecord extends FirestoreRecord {
  DecksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "tcg" field.
  String? _tcg;
  String get tcg => _tcg ?? '';
  bool hasTcg() => _tcg != null;

  // "cards" field.
  List<DocumentReference>? _cards;
  List<DocumentReference> get cards => _cards ?? const [];
  bool hasCards() => _cards != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "last_edited" field.
  DateTime? _lastEdited;
  DateTime? get lastEdited => _lastEdited;
  bool hasLastEdited() => _lastEdited != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "cardIDs" field.
  List<String>? _cardIDs;
  List<String> get cardIDs => _cardIDs ?? const [];
  bool hasCardIDs() => _cardIDs != null;

  // "faved" field.
  bool? _faved;
  bool get faved => _faved ?? false;
  bool hasFaved() => _faved != null;

  // "favDate" field.
  DateTime? _favDate;
  DateTime? get favDate => _favDate;
  bool hasFavDate() => _favDate != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _tcg = snapshotData['tcg'] as String?;
    _cards = getDataList(snapshotData['cards']);
    _user = snapshotData['user'] as DocumentReference?;
    _lastEdited = snapshotData['last_edited'] as DateTime?;
    _created = snapshotData['created'] as DateTime?;
    _cardIDs = getDataList(snapshotData['cardIDs']);
    _faved = snapshotData['faved'] as bool?;
    _favDate = snapshotData['favDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('decks');

  static Stream<DecksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DecksRecord.fromSnapshot(s));

  static Future<DecksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DecksRecord.fromSnapshot(s));

  static DecksRecord fromSnapshot(DocumentSnapshot snapshot) => DecksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DecksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DecksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DecksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DecksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDecksRecordData({
  String? name,
  String? description,
  String? tcg,
  DocumentReference? user,
  DateTime? lastEdited,
  DateTime? created,
  bool? faved,
  DateTime? favDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'tcg': tcg,
      'user': user,
      'last_edited': lastEdited,
      'created': created,
      'faved': faved,
      'favDate': favDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class DecksRecordDocumentEquality implements Equality<DecksRecord> {
  const DecksRecordDocumentEquality();

  @override
  bool equals(DecksRecord? e1, DecksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.tcg == e2?.tcg &&
        listEquality.equals(e1?.cards, e2?.cards) &&
        e1?.user == e2?.user &&
        e1?.lastEdited == e2?.lastEdited &&
        e1?.created == e2?.created &&
        listEquality.equals(e1?.cardIDs, e2?.cardIDs) &&
        e1?.faved == e2?.faved &&
        e1?.favDate == e2?.favDate;
  }

  @override
  int hash(DecksRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.tcg,
        e?.cards,
        e?.user,
        e?.lastEdited,
        e?.created,
        e?.cardIDs,
        e?.faved,
        e?.favDate
      ]);

  @override
  bool isValidKey(Object? o) => o is DecksRecord;
}
