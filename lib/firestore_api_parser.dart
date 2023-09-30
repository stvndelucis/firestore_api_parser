library firestore_api_parser;

import 'package:meta/meta.dart';

part 'src/firestore_to_json.dart';

part 'src/json_to_firestore.dart';

part 'src/firestore_collection_to_json.dart';

abstract class FirestoreApiParser {
  /// Parses and converts a [doc] that is in a format readable by cloud firestore to a standard json format
  ///
  /// returns a [Map] with converted data
  static Map<String, dynamic> convertToStandardJson({required Map<String, dynamic> doc}) =>
      toStandardJsonFormat(firestoreJson: doc);

  /// Analyze a standard [Map]/JSON which is in standard json format and
  /// returns [Map]/JSON with data converted to a readable format for Cloud Firestore
  static Map<String, dynamic> convertToFirestoreDocument({required Map<String, dynamic> json}) =>
      toFirestoreDocumentFormat(jsonMap: json);

  /// Analyze and convert a collection that is in json format used by cloud firestore to standard json format
  ///
  /// Returns a [Map] containing all the documents of the collection in standard json format
  static List<dynamic> parseCollection({required dynamic collection}) => collectionToJson(collection: collection);
}

extension FirestoreApiParserMapExtension on Map {
  Map<String, dynamic> get toFirestoreJson =>
      FirestoreApiParser.convertToFirestoreDocument(json: cast<String, dynamic>());

  Map<String, dynamic> get toStandardJson => FirestoreApiParser.convertToStandardJson(doc: cast<String, dynamic>());
}

extension FirestoreApiParserListExtension on List {
  List<dynamic> get parseCollection => FirestoreApiParser.parseCollection(collection: this);
}
