library firestore_api_parser;

import 'package:meta/meta.dart';

part 'src/firestore_to_json.dart';

part 'src/json_to_firestore.dart';

@visibleForTesting
class FirestoreApiParser {
  /// Convert into JSON a received Cloud Firestore Json Document format
  Map<String, dynamic> parseDocument({required Map<String, dynamic> firestoreJson}) =>
      toJsonFormat(firestoreJson: firestoreJson);

  /// Convert into a Cloud Firestore Json Document format a received Json
  Map<String, dynamic> parseJson({required Map<String, dynamic> json}) => toFirestoreDocumentFormat(jsonMap: json);
}
