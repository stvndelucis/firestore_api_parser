library firestore_api_parser;

import 'package:meta/meta.dart';

part 'src/firestore_to_json.dart';

part 'src/json_to_firestore.dart';

class FirestoreApiParser {
  /// Convert to conventional json format the cloud firestore document json which is passed to it as a parameter.
  //
  // Returns a Map<String, dynamic> representing the firestore json fields converted to conventional json
  Map<String, dynamic> toJson({required Map<String, dynamic> firestoreJson}) =>
      toJsonFormat(firestoreJson: firestoreJson);

  /// Convert to json format of the cloud firestore document the json which is passed to him in parameter.
  //
  // Returns a Map<String, dynamic> representing the json fields converted to firestore json
  Map<String, dynamic> toFirestoreJson({required Map<String, dynamic> json}) =>
      toFirestoreDocumentFormat(jsonMap: json);
}
