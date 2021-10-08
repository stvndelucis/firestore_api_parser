import 'package:firestore_api_parser/firestore_api_parser.dart';
import 'package:test/test.dart';

void main() {
  group('Testing extractMapData function', () {
    test('Trying to parse a fake firestore map that not contains the "fields" field. Expecting to throw an Exception',
        () {
      final fakeFirestoreMap = {
        '2006': {'stringValue': 'Casino Royale'}
      };

      expect(() => extractMapData(fakeFirestoreMap), throwsException);
    });

    test(
        'Trying to parse a good firestore map that contains "fields" field.\n'
        'Expecting to get parsed data to a json format', () {
      final goodFirestoreMap = {
        'fields': {
          '2006': {'stringValue': 'Casino Royale'}
        }
      };

      final expectedData = {'2006': 'Casino Royale'};

      final parsedData = extractMapData(goodFirestoreMap);

      expect(parsedData['2006'].toString(), expectedData['2006']);
    });
  });

  group('Testing extractArrayData function', () {
    test('retrieving a array Value with that contains "values" fields', () {
      final arrayValue = {
        'values': [
          {'stringValue': 'Data 1'},
          {'stringValue': 'Data 2'},
          {'stringValue': 'Data 3'}
        ]
      };
      final parsedArray = extractArrayData(arrayValue);

      expect(parsedArray.length, 3);
    });

    test('retrieving a array Value with that does not contains "values" fields', () {
      final arrayValue = {
        'data': [
          {'stringValue': 'Data 1'},
          {'stringValue': 'Data 2'},
          {'stringValue': 'Data 3'}
        ]
      };

      expect(() => extractArrayData(arrayValue), throwsException);
    });
  });

  group('Testing parseToJson function from firestore map', () {
    test('retrieving a String Value', () {
      final stringValue = {'stringValue': 'Steeven Delucis'};

      final parsedValue = parseToJson(stringValue);
      expect(parsedValue.runtimeType, String);
    });

    test('retrieving a int Value', () {
      final intValue = {'integerValue': 26};
      final parsedValue = parseToJson(intValue);

      expect(parsedValue.runtimeType, int);
    });

    test('retrieving a double Value', () {
      final doubleValue = {'integerValue': 26.5};
      final parsedValue = parseToJson(doubleValue);

      expect(parsedValue.runtimeType, double);
    });

    test('retrieving a timestamp (DateTime) Value', () {
      final timestampValue = {'timestampValue': '2021-10-07T19:00:00Z'};
      final parsedValue = parseToJson(timestampValue);

      final dateTime = DateTime.parse(parsedValue);

      expect(parsedValue.runtimeType, String);
      expect(dateTime.runtimeType, DateTime);
    });

    test('retrieving a bool Value', () {
      final booleanValue = {'booleanValue': true};
      final parsedValue = parseToJson(booleanValue);

      expect(parsedValue.runtimeType, bool);
    });

    test('retrieving a gepPoint Value', () {
      final booleanValue = {
        'geoPointValue': {'latitude': '-64', 'longitude': '-86'}
      };
      final parsedValue = parseToJson(booleanValue);

      expect(parsedValue['latitude'], '-64');
      expect(parsedValue['longitude'], '-86');
    });

    test('retrieving a reference Value', () {
      final referenceValue = {'referenceValue': 'projects/my_project/databases/(default)/documents/USERS/an_user_id'};
      final parsedValue = parseToJson(referenceValue);

      expect(parsedValue.runtimeType, String);
    });

    test('retrieving a String Value', () {
      final stringValue = {'stringValue': 'Steeven Delucis'};

      final parsedValue = parseToJson(stringValue);
      expect(parsedValue.runtimeType, String);
    });

    test('retrieving a int Value', () {
      final intValue = {'integerValue': 26};
      final parsedValue = parseToJson(intValue);

      expect(parsedValue.runtimeType, int);
    });

    test('retrieving a double Value', () {
      final doubleValue = {'integerValue': 26.5};
      final parsedValue = parseToJson(doubleValue);

      expect(parsedValue.runtimeType, double);
    });

    test('retrieving a timestamp (DateTime) Value', () {
      final timestampValue = {'timestampValue': '2021-10-07T19:00:00Z'};
      final parsedValue = parseToJson(timestampValue);

      final dateTime = DateTime.parse(parsedValue);

      expect(parsedValue.runtimeType, String);
      expect(dateTime.runtimeType, DateTime);
    });

    test('retrieving a bool Value', () {
      final booleanValue = {'booleanValue': true};
      final parsedValue = parseToJson(booleanValue);

      expect(parsedValue.runtimeType, bool);
    });

    test('retrieving a gepPoint Value', () {
      final booleanValue = {
        'geoPointValue': {'latitude': '-64', 'longitude': '-86'}
      };
      final parsedValue = parseToJson(booleanValue);

      expect(parsedValue['latitude'], '-64');
      expect(parsedValue['longitude'], '-86');
    });

    test('retrieving a reference Value', () {
      final referenceValue = {'referenceValue': 'projects/my_project/databases/(default)/documents/USERS/an_user_id'};
      final parsedValue = parseToJson(referenceValue);

      expect(parsedValue.runtimeType, String);
    });

    test('retrieving a null Value', () {
      final nullValue = {'nullValue': null};

      final parsedData = parseToJson(nullValue);
      expect(parsedData, null);
    });
  });
}
