part of firestore_api_parser;

@visibleForTesting
Map<String, dynamic> collectionToJson({required Map<String, dynamic> collection}) {
  if (collection['documents'] != null) {
    var parsedCollection = {};
    var parsedCollectionData = [];
    final documents = collection['documents'];

    for (var document in documents) {
      final parsedDocument = toJsonFormat(firestoreJson: document);
      parsedCollectionData.add(parsedDocument);
    }

    parsedCollection['documents'] = parsedCollectionData;

    return parsedCollection.cast<String, dynamic>();
  } else {
    throw Exception(
        'Cannot parse this firestore collection, "documents" fields is missing.\nReceived collection $collection');
  }
}
