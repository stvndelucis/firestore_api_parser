part of firestore_api_parser;

@visibleForTesting
Map<String, dynamic> toStandardJsonFormat({required Map<String, dynamic> firestoreJson}) =>
    decodeMapData(firestoreJson);

@visibleForTesting
dynamic parseToJson(Map values) => values.map((key, value) {
      switch (key) {
        case 'stringValue':
        case 'integerValue':
        case 'doubleValue':
        case 'timestampValue':
        case 'booleanValue':
        case 'geoPointValue':
        case 'referenceValue':
          return MapEntry(key, value);

        case 'arrayValue':
          return MapEntry(key, decodeArrayData(value));

        case 'mapValue':
          return MapEntry(key, decodeMapData(value));

        case 'nullValue':
          return MapEntry(key, null);

        default:
          throw Exception('Cannot convert this value to a json readable format. '
              'That sound like this value type $key is not supported by firestore.\nReceived data $values');
      }
    });

@visibleForTesting
Map<String, dynamic> decodeMapData(Map<String, dynamic> mapData) {
  final fields = mapData['fields'] as Map<String, dynamic>?;

  if (fields == null) return const {};

  return fields.map((key, value) => MapEntry(key, parseToJson(value)));
}

@visibleForTesting
List<dynamic> decodeArrayData(Map arrayData) {
  if (arrayData['values'] == null) return [];

  final values = arrayData['values'] as List<dynamic>;

  return values.map((value) => parseToJson(value)).toList();
}
