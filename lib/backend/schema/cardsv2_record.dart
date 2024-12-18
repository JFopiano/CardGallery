import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Cardsv2Record extends FirestoreRecord {
  Cardsv2Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "date_added" field.
  DateTime? _dateAdded;
  DateTime? get dateAdded => _dateAdded;
  bool hasDateAdded() => _dateAdded != null;

  // "isFav" field.
  bool? _isFav;
  bool get isFav => _isFav ?? false;
  bool hasIsFav() => _isFav != null;

  // "favDate" field.
  DateTime? _favDate;
  DateTime? get favDate => _favDate;
  bool hasFavDate() => _favDate != null;

  // "decks" field.
  List<DocumentReference>? _decks;
  List<DocumentReference> get decks => _decks ?? const [];
  bool hasDecks() => _decks != null;

  // "cardType" field.
  String? _cardType;
  String get cardType => _cardType ?? '';
  bool hasCardType() => _cardType != null;

  // "imageL" field.
  String? _imageL;
  String get imageL => _imageL ?? '';
  bool hasImageL() => _imageL != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _dateAdded = snapshotData['date_added'] as DateTime?;
    _isFav = snapshotData['isFav'] as bool?;
    _favDate = snapshotData['favDate'] as DateTime?;
    _decks = getDataList(snapshotData['decks']);
    _cardType = snapshotData['cardType'] as String?;
    _imageL = snapshotData['imageL'] as String?;
    _quantity = castToType<int>(snapshotData['quantity']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cardsv2');

  static Stream<Cardsv2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Cardsv2Record.fromSnapshot(s));

  static Future<Cardsv2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Cardsv2Record.fromSnapshot(s));

  static Cardsv2Record fromSnapshot(DocumentSnapshot snapshot) =>
      Cardsv2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Cardsv2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Cardsv2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Cardsv2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Cardsv2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardsv2RecordData({
  String? image,
  String? id,
  String? name,
  DocumentReference? user,
  DateTime? dateAdded,
  bool? isFav,
  DateTime? favDate,
  String? cardType,
  String? imageL,
  int? quantity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'id': id,
      'name': name,
      'user': user,
      'date_added': dateAdded,
      'isFav': isFav,
      'favDate': favDate,
      'cardType': cardType,
      'imageL': imageL,
      'quantity': quantity,
    }.withoutNulls,
  );

  return firestoreData;
}

class Cardsv2RecordDocumentEquality implements Equality<Cardsv2Record> {
  const Cardsv2RecordDocumentEquality();

  @override
  bool equals(Cardsv2Record? e1, Cardsv2Record? e2) {
    const listEquality = ListEquality();
    return e1?.image == e2?.image &&
        e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.user == e2?.user &&
        e1?.dateAdded == e2?.dateAdded &&
        e1?.isFav == e2?.isFav &&
        e1?.favDate == e2?.favDate &&
        listEquality.equals(e1?.decks, e2?.decks) &&
        e1?.cardType == e2?.cardType &&
        e1?.imageL == e2?.imageL &&
        e1?.quantity == e2?.quantity;
  }

  @override
  int hash(Cardsv2Record? e) => const ListEquality().hash([
        e?.image,
        e?.id,
        e?.name,
        e?.user,
        e?.dateAdded,
        e?.isFav,
        e?.favDate,
        e?.decks,
        e?.cardType,
        e?.imageL,
        e?.quantity
      ]);

  @override
  bool isValidKey(Object? o) => o is Cardsv2Record;
}
