import 'package:firestore_api_parser/firestore_api_parser.dart';
import 'package:test/test.dart';

void main() {
  group('encodeData', () {
    //
    test('It should encode value as referenceValue because it match referenceValue pattern', () {
      final value = 'projects/my_great_project/databases/(default)/documents/USERS/abc123';

      final parsedValue = encodeData(value);

      final expected = {'referenceValue': 'projects/my_great_project/databases/(default)/documents/USERS/abc123'};

      expect(parsedValue, expected);
    });

    test('It should encode value as timestampValue because it match a valid date pattern', () {
      final value = '2021-10-07T19:00:00Z';

      final parsedValue = encodeData(value);

      final excepted = {'timestampValue': '2021-10-07T19:00:00Z'};

      expect(parsedValue, excepted);
    });

    test("It should encode value as a stringValue because it's a simple String", () {
      final value = 'Steeven Delucis';

      final parsedValue = encodeData(value);
      final expected = {'stringValue':'Steeven Delucis'};
      expect(parsedValue, expected);
    });

    test("It should encode value as booleanValue because it's a simple bool", () {
      final value = true;

      final parsedValue = encodeData(value);
      final expected = {'booleanValue': true};

      expect(parsedValue, expected);
    });

    test(
        "It should encode value as integerValue because it's a simple int."
        "value will be transformed to String in accordance with how cloud firestore encode int", () {
      final value = 26;

      final parsedValue = encodeData(value);
      final expected = {'integerValue': '26'};

      expect(parsedValue, expected);
    });

    test("It should encode value as doubleValue because it's a simple double", () {
      final doubleValue = 26.0;

      final parsedValue = encodeData(doubleValue);
      final expected = {'doubleValue': 26.0};

      expect(parsedValue, expected);
    });

    test("It should encode value as nullValue because value is null", () {
      final value = null;

      final parsedValue = encodeData(value);
      final expected = {'nullValue': null};

      expect(parsedValue, expected);
    });

    // And what if user only want to store it has a Map ? Thinkin' about it...
    test("It should encode value as geoPointValue because it match geoPointValue pattern", () {
      final value = {'latitude': '-64', 'longitude': '-84'};

      final parsedValue = encodeData(value);

      final expected = {
        'geoPointValue': {'longitude': '-84', 'latitude': '-64'}
      };

      expect(parsedValue, expected);
    });

    test('It should encode value as mapValue', () {
      final value = {
        'names': {'firstname': 'James', 'lastname': 'Bond'}
      };

      final parsedValue = encodeData(value);

      final expected = {
        'mapValue': {
          'fields': {
            'names': {
              'mapValue': {
                'fields': {
                  'firstname': {'stringValue': 'James'},
                  'lastname': {'stringValue': 'Bond'},
                }
              }
            }
          }
        }
      };

      expect(parsedValue, expected);
    });

    test('It should encode value as mapValue and dont create fields key when value is empty', () {
      final value = {};

      final parsedValue = encodeData(value);

      final expected = {'mapValue': {}};

      expect(parsedValue, expected);
    });

    test('It should encode array as arrayValue', () {
      final array = ['Billie Eillish', 667, 09.11];

      final encodedArray = encodeData(array);

      final expected = {
        'arrayValue': {
          'values': [
            {'stringValue': 'Billie Eillish'},
            {'integerValue': '667'},
            {'doubleValue': 09.11}
          ]
        }
      };

      expect(encodedArray, expected);
    });

    test('It should encode array as arrayValue and dont create a values key when value is empty', () {
      final array = [];

      final encodedArray = encodeData(array);

      final expected = {'arrayValue': {}};

      expect(encodedArray, expected);
    });

    test("It should throw an exception because value's type is not unsupported or cannot be determined", () {
      final Object value = Object();

      expect(() => encodeData(value), throwsException);
    });
  });
}
