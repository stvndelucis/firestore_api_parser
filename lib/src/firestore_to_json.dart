part of firestore_api_parser;

@visibleForTesting
Map<String, dynamic> toJsonFormat({required Map<String, dynamic> firestoreJson}) {
  final jsonMap = extractMapData(firestoreJson);
  return jsonMap;
}

@visibleForTesting
dynamic parseToJson(Map values) {
  for (var entry in values.entries) {
    final key = entry.key;
    if (key == 'stringValue' ||
        key == 'integerValue' ||
        key == 'doubleValue' ||
        key == 'timestampValue' ||
        key == 'booleanValue' ||
        key == 'geoPointValue' ||
        key == 'referenceValue') {
      return entry.value;
    } else if (key == 'arrayValue') {
      return extractArrayData(entry.value);
    } else if (key == 'mapValue') {
      return extractMapData(entry.value);
    } else if (key == 'nullValue') {
      return null;
    } else {
      throw Exception(
          'Cannot convert this value to a json readable format. That sound like this value type $key is not supported by firestore.\nReceived data is $values');
    }
  }
}

@visibleForTesting
Map<String, dynamic> extractMapData(Map mapData) {
  if (mapData['fields'] != null) {
    final fields = mapData['fields'] as Map;

    final parsedMap = <String, dynamic>{};

    for (var entry in fields.entries) {
      final parsedEntryValue = parseToJson(entry.value);
      parsedMap[entry.key] = parsedEntryValue;
    }

    return parsedMap;
  } else {
    throw Exception(
        'Cannot convert this Map to a json readable format. The key "fields" is missing.\nReceived Map is $mapData');
  }
}

@visibleForTesting
List<dynamic> extractArrayData(Map arrayData) {
  if (arrayData['values'] != null) {
    final values = arrayData['values'] as List;

    final parsedArray = <dynamic>[];

    for (var value in values) {
      final parsedValue = parseToJson(value);

      parsedArray.add(parsedValue);
    }

    return parsedArray;
  } else {
    return [];
  }
}
