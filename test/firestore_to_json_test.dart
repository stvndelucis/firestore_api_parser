import 'package:firestore_api_parser/firestore_api_parser.dart';
import 'package:test/test.dart';

void main() {
  test('It should decode value as Map', () {
    final data = {
      'fields': {
        'name': {'stringValue': 'Billie Eilish'}
      }
    };

    final decodedData = decodeMapData(data);
    final expected = {'name': 'Billie Eilish'};

    expect(decodedData, expected);
  });

  test('It should decode value as Map with empty entries', () {
    final data = <String, dynamic>{};

    final decodedData = decodeMapData(data);
    final expected = {};

    expect(decodedData, expected);
  });

  test('It should decode array', () {
    final array = {
      'values': [
        {'stringValue': 'first'},
        {'integerValue': '2'},
        {'doubleValue': 09.11}
      ]
    };
    final decodedArray = decodeArrayData(array);

    final expected = ['first', 2, 09.11];

    expect(decodedArray, expected);
  });

  test('It should decode array with empty values', () {
    final array = {};
    final decodedArray = decodeArrayData(array);

    final expected = [];

    expect(decodedArray, expected);
  });

  test('It should decode value as String', () {
    final value = MapEntry('stringValue', 'Steeven Delucis');

    final decodedValue = decodeData(value);

    final expected = 'Steeven Delucis';

    expect(decodedValue, expected);
  });

  test('It should decode value as int', () {
    final value = MapEntry('integerValue', '26');

    final decodedValue = decodeData(value);
    final expected = 26;

    expect(decodedValue, expected);
  });

  test('It should decode value as double', () {
    final value = MapEntry('doubleValue', 09.11);

    final decodedValue = decodeData(value);
    final expected = 09.11;

    expect(decodedValue, expected);
  });

  test('It should decode value as bool', () {
    final value = MapEntry('booleanValue', true);

    final decodedValue = decodeData(value);
    final expected = true;

    expect(decodedValue, expected);
  });

  test('It should decode value as Map (geoPointValue)', () {
    final value = MapEntry('geoPointValue', {'latitude': '-64', 'longitude': '-86'});

    final decodedValue = decodeData(value);
    final expected = {'latitude': '-64', 'longitude': '-86'};

    expect(decodedValue, expected);
  });

  test('It should decode value as String (referenceValue)', () {
    final value = MapEntry('referenceValue', 'projects/my_project/databases/(default)/documents/USERS/abc123');

    final decodedValue = decodeData(value);
    final expected = 'projects/my_project/databases/(default)/documents/USERS/abc123';

    expect(decodedValue, expected);
  });

  test('It should decode/return value as null', () {
    final value = MapEntry('nullValue', null);

    final decodedValue = decodeData(value);
    final expected = null;

    expect(decodedValue, expected);
  });
}
