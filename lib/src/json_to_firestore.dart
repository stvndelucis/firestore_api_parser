part of firestore_api_parser;

final firestoreReferenceRegex = RegExp(r'^projects\/.+\/databases\/\(default\)\/documents\/.+\/.+$');
final dateTimeRegex = RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(Z)?$'); // timezone is optional

@visibleForTesting
Map<String, dynamic> toFirestoreDocumentFormat({required Map<String, dynamic> jsonMap}) {
  final data = jsonMap.map((key, value) => MapEntry(key, encodeData(value)));

  return {'fields': data};
}

@visibleForTesting
Map<String, dynamic> encodeData(dynamic value) {
  if (value == null) return encodeNullData();

  if (value is String) {
    if (firestoreReferenceRegex.hasMatch(value)) return encodeReferenceData(value);

    final isValidDateTime = dateTimeRegex.hasMatch(value);
    if (isValidDateTime) return encodeTimestampData(value);

    return encodeStringData(value);
  }

  if (value is DateTime) return encodeTimestampData('${value.millisecondsSinceEpoch}');

  if (value is int) return encodeIntData(value);

  if (value is bool) return encodeBoolData(value);

  if (value is double) return encodeDoubleData(value);

  if (value is Map) {
    final isGeoPointData = value.containsKey('latitude') && value.containsKey('longitude') && value.entries.length == 2;
    if (isGeoPointData) return encodeGeoPointData(value);

    return encodeMapData(value);
  }

  if (value is List) return encodeListData(value);

  throw Exception("Type ${value.runtimeType} is not (for now) supported by our plugin.");
}

@visibleForTesting
Map<String, dynamic> encodeNullData() => {'nullValue': null};

@visibleForTesting
Map<String, dynamic> encodeBoolData(bool booleanValue) => {'booleanValue': booleanValue};

@visibleForTesting
Map<String, dynamic> encodeGeoPointData(Map geoPointValue) => {'geoPointValue': geoPointValue};

@visibleForTesting
Map<String, dynamic> encodeTimestampData(String timestampValue) => {'timestampValue': timestampValue};

@visibleForTesting
Map<String, dynamic> encodeReferenceData(String stringValue) => {'referenceValue': stringValue};

@visibleForTesting
Map<String, dynamic> encodeMapData(Map mapValue) {
  if (mapValue.isEmpty) return const {'mapValue': {}};

  final mapData = mapValue.map((key, value) => MapEntry(key, encodeData(value)));

  return {
    'mapValue': {'fields': mapData}
  };
}

@visibleForTesting
Map<String, dynamic> encodeListData(List arrayValue) {
  if (arrayValue.isEmpty) return const {'arrayValue': {}};

  final arrayData = arrayValue.map((value) => encodeData(value)).toList(growable: false);

  return {
    'arrayValue': {'values': arrayData}
  };
}

@visibleForTesting
Map<String, dynamic> encodeStringData(String stringValue) => {'stringValue': stringValue};

@visibleForTesting
Map<String, dynamic> encodeIntData(int integerValue) => {'integerValue': '$integerValue'};

@visibleForTesting
Map<String, dynamic> encodeDoubleData(double doubleValue) => {'doubleValue': doubleValue};
