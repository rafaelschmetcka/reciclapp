import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoricoRecord extends FirestoreRecord {
  HistoricoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "coleta" field.
  List<String>? _coleta;
  List<String> get coleta => _coleta ?? const [];
  bool hasColeta() => _coleta != null;

  // "avaliacao" field.
  List<int>? _avaliacao;
  List<int> get avaliacao => _avaliacao ?? const [];
  bool hasAvaliacao() => _avaliacao != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _coleta = getDataList(snapshotData['coleta']);
    _avaliacao = getDataList(snapshotData['avaliacao']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('historico')
          : FirebaseFirestore.instance.collectionGroup('historico');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('historico').doc(id);

  static Stream<HistoricoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoricoRecord.fromSnapshot(s));

  static Future<HistoricoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HistoricoRecord.fromSnapshot(s));

  static HistoricoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoricoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoricoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoricoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoricoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoricoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoricoRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class HistoricoRecordDocumentEquality implements Equality<HistoricoRecord> {
  const HistoricoRecordDocumentEquality();

  @override
  bool equals(HistoricoRecord? e1, HistoricoRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.coleta, e2?.coleta) &&
        listEquality.equals(e1?.avaliacao, e2?.avaliacao);
  }

  @override
  int hash(HistoricoRecord? e) =>
      const ListEquality().hash([e?.coleta, e?.avaliacao]);

  @override
  bool isValidKey(Object? o) => o is HistoricoRecord;
}
