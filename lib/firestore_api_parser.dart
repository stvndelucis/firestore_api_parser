library firestore_api_parser;

import 'package:meta/meta.dart';

part 'src/firestore_to_json.dart';

part 'src/json_to_firestore.dart';

part 'src/firestore_collection_to_json.dart';

class FirestoreApiParser {
  /// Parses and converts a [doc] that is in a format readable by cloud firestore to a standard json format
  ///
  /// returns a [Map] with converted data
  Map<String, dynamic> parseFirestoreDocument({required Map<String, dynamic> doc}) => toJsonFormat(firestoreJson: doc);

  /// Analyze a standard [Map]/JSON which is in standard json format and
  /// returns [Map]/JSON with data converted to a readable format for Cloud Firestore
  Map<String, dynamic> parseJson({required Map<String, dynamic> json}) => toFirestoreDocumentFormat(jsonMap: json);

  /// Analyze and convert a collection that is in json format used by cloud firestore to standard json format
  ///
  /// Returns a [Map] containing all the documents of the collection in standard json format
  List<dynamic> parseCollection({required dynamic collection, bool isStructuredQuery = false}) =>
      collectionToJson(collection: collection, isStructuredQuery: isStructuredQuery);
}
