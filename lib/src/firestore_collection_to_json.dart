part of firestore_api_parser;

@visibleForTesting
List<dynamic> collectionToJson({required dynamic collection, bool isStructuredQuery = false}) {

  final jsonDocs = [];

  if (isStructuredQuery) {
    for (final doc in collection) {
      final data = doc['document'];
      if (data == null) {
        throw Exception('Cannot parse this firestore document, "document" fields is missing.\nReceived document $data');
      }

      final jsonDoc = toJsonFormat(firestoreJson: data);

      jsonDocs.add(jsonDoc);
    }
  } else {
    final docs = collection['documents'];

    if (docs != null) {
      for (var document in docs) {
        final jsonDoc = toJsonFormat(firestoreJson: document);
        jsonDocs.add(jsonDoc);
      }
    } else {
      throw Exception(
          'Cannot parse this firestore collection, "documents" fields is missing.\nReceived collection $collection');
    }
  }

  return jsonDocs;
}
