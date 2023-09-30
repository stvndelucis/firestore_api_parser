part of firestore_api_parser;

@visibleForTesting
Map<String, dynamic> toStandardJsonFormat({required Map<String, dynamic> firestoreJson}) =>
    decodeMapData(firestoreJson);

@visibleForTesting
dynamic decodeData(MapEntry entry) {
  switch (entry.key) {
    case 'stringValue':
    case 'doubleValue':
    case 'timestampValue':
    case 'booleanValue':
    case 'geoPointValue':
    case 'referenceValue':
      return entry.value;

    case 'integerValue':
      return int.parse(entry.value);

    case 'arrayValue':
      return decodeArrayData(entry.value);

    case 'mapValue':
      return decodeMapData(entry.value);

    case 'nullValue':
      return null;

    default:
      throw Exception('Cannot convert this value to a json readable format. '
          'That sound like this value type ${entry.key} is not supported by firestore.\nReceived data ${entry.value}');
  }
}

@visibleForTesting
Map<String, dynamic> decodeMapData(Map<String, dynamic> mapData) {
  var fields = mapData['fields'] as Map<String, dynamic>?;

  if (fields == null) return const {};

  return fields.map((key, value) => MapEntry(key, decodeData(value.entries.first)));
}

@visibleForTesting
List<dynamic> decodeArrayData(Map arrayData) {
  if (arrayData['values'] == null) return [];

  final values = arrayData['values'] as List<dynamic>;

  return values.map((value) => decodeData(value.entries.first)).toList();
}
