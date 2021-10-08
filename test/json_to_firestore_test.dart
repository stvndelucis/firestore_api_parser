import 'package:firestore_api_parser/firestore_api_parser.dart';
import 'package:test/test.dart';

void main() {
  group('Testing getFirestoreRepresentation function', () {
    group('Testing all String', () {
      test('Expecting given String will be represented as a firestore reference representation', () {
        final referenceValue = 'projects/my_great_project/databases/(default)/documents/USERS/an_user_id';

        final parsedValue = getFirestoreRepresentation(referenceValue);

        expect(parsedValue['referenceValue'], referenceValue);
      });

      test('Expecting given String will be represented as a firestore timestamp representation', () {
        final timestampValue = '2021-10-07T19:00:00Z';

        final parsedValue = getFirestoreRepresentation(timestampValue);

        expect(parsedValue['timestampValue'], timestampValue);
      });

      test('Expecting given String will be represented as a firestore simple literal string representation', () {
        final stringValue = 'Steeven Delucis';

        final parsedValue = getFirestoreRepresentation(stringValue);

        expect(parsedValue['stringValue'], stringValue);
      });
    });

    test('Testing bool value represention', () {
      final boolValue = true;

      final parsedValue = getFirestoreRepresentation(boolValue);

      expect(parsedValue['booleanValue'], true);
    });

    group('Testing num value representation', () {
      test('Testing int value', () {
        final intValue = 26;

        final parsedValue = getFirestoreRepresentation(intValue);

        expect(parsedValue['integerValue'], 26);
      });

      test('Testing double value', () {
        final doubleValue = 26.5;

        final parsedValue = getFirestoreRepresentation(doubleValue);

        expect(parsedValue['integerValue'], 26.5);
      });
    });

    group('Testing Map value', () {
      test('Testing this Map should be represented as a geoPointValue', () {
        final geoPointValue = {'latitude': '-64', 'longitude': '-84'};

        final parsedValue = getFirestoreRepresentation(geoPointValue);

        expect(parsedValue['geoPointValue']['latitude'], '-64');
        expect(parsedValue['geoPointValue']['longitude'], '-84');
      });

      test('Testing this Map should be represented as a normal Map', () {
        final mapValue = {
          'names': {'firstname': 'James', 'lastname': 'Bond'}
        };

        final parsedValue = getFirestoreRepresentation(mapValue);
        final fields = parsedValue['mapValue']['fields'];
        final names = fields['names'];
        final namesFields = names['mapValue']['fields'];
        final firstname = namesFields['firstname']['stringValue'];
        final lastname = namesFields['lastname']['stringValue'];

        expect(firstname, 'James');
        expect(lastname, 'Bond');
      });
    });

    test('Testing List value representation', () {
      final listValue = ['Billie Eillish', 'Ariana Grande', 'Vald'];

      final parsedValue = getFirestoreRepresentation(listValue);

      final values = parsedValue['arrayValue']['values'];
      final be = values[0]['stringValue'];
      final ag = values[1]['stringValue'];
      final v = values[2]['stringValue'];

      expect(be, 'Billie Eillish');
      expect(ag, 'Ariana Grande');
      expect(v, 'Vald');
    });

    test('Testing null value representation', () {
      final nullValue = null;

      final parsedValue = getFirestoreRepresentation(nullValue);

      expect(parsedValue['nullValue'], null);
    });

    test('Testing an unsupported firestore type given', () {

      final Object unsupportedType = Object();

      expect(()=> getFirestoreRepresentation(unsupportedType), throwsException);


    });
  });
}
