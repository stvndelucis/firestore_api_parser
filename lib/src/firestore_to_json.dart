part of firestore_api_parser;

/// Extract data from a firestore json format and convert them into a normal json format
@visibleForTesting
Map<String, dynamic> toJsonFormat({required Map<String, dynamic> firestoreJson}) {
  final jsonMap = extractMapData(firestoreJson);
  return jsonMap;
}

///Parse a firestore values to a readable json format
@visibleForTesting
dynamic parseToJson(Map values) {
  for (var entry in values.entries) {
    // loop on each entry of given values
    final key = entry.key; // We get the key of an entry witch represent the type of a value in firestore
    if (key == 'stringValue' ||
        key == 'integerValue' ||
        key == 'timestampValue' ||
        key == 'booleanValue' ||
        key == 'geoPointValue' ||
        key == 'referenceValue') {
      return entry.value; // if the value is an String or int, we just return the entry value
    } else if (key == 'arrayValue') {
      return extractArrayData(entry.value); // if the value in an firestore array, we extract data from this array
    } else if (key == 'mapValue') {
      return extractMapData(entry.value); // if it's a map, do an recursion to extract array data
    } else if (key == 'nullValue') {
      return null;
    } else {
      throw Exception(
          'Cannot convert this value to a json readable format. That sound like this value type $key is not supported by firestore.\nReceived data is $values');
    }
  }
}

/// Extracts data from a firestore map to convert it to json format
@visibleForTesting
Map<String, dynamic> extractMapData(Map mapData) {
  if (mapData['fields'] != null) {
    //check if we have a [fields] key
    final fields = mapData['fields'] as Map; // Retrieve all value of [fields] key

    final parsedMap = <String, dynamic>{}; // A map that will contains all our parsed json value

    for (var entry in fields.entries) {
      // iterate on all entry of our [fields] map
      final parsedEntryValue = parseToJson(entry.value); // parse each value of an map entry to a readable json
      parsedMap[entry.key] = parsedEntryValue; // add this parsed value to his key
    }

    return parsedMap; //Just return the parsed map with his parsed value
  } else {
    // Otherwise, we'll throw an exception
    throw Exception(
        'Cannot convert this Map to a json readable format. The key "fields" is missing.\nReceived Map is $mapData');
  }
}

/// Extract data of an firestore array
@visibleForTesting
List<dynamic> extractArrayData(Map arrayData) {
  if (arrayData['values'] != null) {
    final values =
        arrayData['values'] as List; // Firestore arrayValue are stored inside a "values" key, so we get these values

    final parsedArray = <dynamic>[]; // an array who will contains all our parsed values

    for (var value in values) {
      // iterate on all our value of our firestore array
      final parsedValue =
          parseToJson(value); // we parse each value array value, it's allow us to known the right type of a value

      parsedArray.add(parsedValue); // we add this parsed value to our array
    }

    return parsedArray; // we return the parsed array
  } else {
    throw Exception(
        'Cannot convert this Array (List) to a json readable format.\nThat sound like this is not a correct firestore Array representation.\nThe key "values" is missing,\nReceived Array(List) is $arrayData');
  }
}
