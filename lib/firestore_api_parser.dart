library firestore_api_parser;

import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

part 'src/firestore_to_json.dart';

part 'src/json_to_firestore.dart';

part 'src/firestore_collection_to_json.dart';

class FirestoreApiParser {
  /// Convert to conventional json format the cloud firestore document json which is passed to it as a parameter.
  ///
  /// Returns a Map<String, dynamic> representing the firestore json fields converted to conventional json
  @Deprecated('Use parseFirestoreDocument() method instead')
  Map<String, dynamic> toJson({required Map<String, dynamic> firestoreJson}) =>
      parseFirestoreDocument(documentJson: firestoreJson);

  /// Analyze a [Map] representing a cloud firestore document and convert it to standard json format
  ///
  /// This method analyzes and converts only cloud firestore documents which is in json format used by cloud firestore's rest API, not cloud firestore collections.
  /// To analyze and convert a cloud firestore collection, see [parseCollection] method.
  ///
  /// Returns a [Map] with the data converted to json format used by the rest API of cloud firestore
  Map<String, dynamic> parseFirestoreDocument({required Map<String, dynamic> documentJson}) =>
      toJsonFormat(firestoreJson: documentJson);

  /// Convert to json format of the cloud firestore document the json which is passed to him in parameter.
  ///
  /// Returns a Map<String, dynamic> representing the json fields converted to firestore json
  @Deprecated('Use parseJson() method instead')
  Map<String, dynamic> toFirestoreJson({required Map<String, dynamic> json}) => parseJson(json: json);

  /// Analyze a map which is in standard json format and convert it to json format used by the cloud firestore rest API
  ///
  /// returns a [Map] with the data converted to json format used by the rest API of cloud firestore
  Map<String, dynamic> parseJson({required Map<String, dynamic> json}) => toFirestoreDocumentFormat(jsonMap: json);

  /// Parses and converts a collection that is in json format used by cloud firestore to standard json format
  ///
  /// Returns a [Map] containing all the documents of the collection in standard json format
  Map<String, dynamic> parseCollection({required Map<String, dynamic> firestoreCollection}) =>
      collectionToJson(collection: firestoreCollection);
}
