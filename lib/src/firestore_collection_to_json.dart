part of firestore_api_parser;

@visibleForTesting
List<dynamic> collectionToJson({required dynamic collection}) {
  final docs = collection['documents'] as List<dynamic>?;

  if (docs == null) {
    throw Exception('Cannot parse this firestore collection, "documents" fields is missing.'
        '\nReceived collection $collection');
  }

  final jsonDocs = docs.map((document) => toStandardJsonFormat(firestoreJson: document)).toList();

  return jsonDocs;
}
