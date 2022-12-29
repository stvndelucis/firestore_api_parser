import 'package:firestore_api_parser/firestore_api_parser.dart';
import 'package:test/test.dart';

void main() {
  group('Testing parsing and conversion of a firestore Collection | collectionToJson method', () {
    test('Testing with a good collection map', () {
      var collection = {
        "documents": [
          {
            "name": "projects/vumot-health-2fd0a/databases/(default)/documents/USERS/AnVHHk2DJGOLXfLRYLlh",
            "fields": {
              "uid": {"stringValue": "AnVHHk2DJGOLXfLRYLlh"},
              "email": {"stringValue": "sebcastellanos@gmail.com"},
              "lastname": {"stringValue": "Castellanos"},
              "firstname": {"stringValue": "Sebastian"},
            },
            "createTime": "2021-10-05T06:34:40.263569Z",
            "updateTime": "2021-10-05T06:34:40.263569Z"
          },
          {
            "name": "projects/vumot-health-2fd0a/databases/(default)/documents/USERS/GNVlcja8VW4rDLon0Woi",
            "fields": {
              "name": {"stringValue": "Steeven Delucis"},
              "partner": {
                "referenceValue":
                    "projects/vumot-health-2fd0a/databases/(default)/documents/USERS/ AnVHHk2DJGOLXfLRYLlh"
              },
              "isme": {"booleanValue": true},
              "age": {"integerValue": "21"},
              "job": {"stringValue": "developer"}
            },
            "createTime": "2021-10-05T06:43:14.661866Z",
            "updateTime": "2021-10-08T08:30:17.792682Z"
          }
        ]
      };

      final parsedCollection = collectionToJson(collection: collection);
    });

    test('Testing with a good collection map', () {
      var collection = {
        "fake_doc": [
          {
            "name": "projects/my_great_procject/databases/(default)/documents/USERS/my_user_id",
            "fields": {
              "uid": {"stringValue": "my_user_id"},
              "email": {"stringValue": "sebcastellanos@gmail.com"},
              "lastname": {"stringValue": "Castellanos"},
              "firstname": {"stringValue": "Sebastian"},
            },
            "createTime": "2021-10-05T06:34:40.263569Z",
            "updateTime": "2021-10-05T06:34:40.263569Z"
          },
          {
            "name": "projects/vumot-health-2fd0a/databases/(default)/documents/USERS/GNVlcja8VW4rDLon0Woi",
            "fields": {
              "name": {"stringValue": "Steeven Delucis"},
              "partner": {"referenceValue": "projects/my_great_project/databases/(default)/documents/USERS/an_user_id"},
              "isme": {"booleanValue": true},
              "age": {"integerValue": "21"},
              "job": {"stringValue": "developer"}
            },
            "createTime": "2021-10-05T06:43:14.661866Z",
            "updateTime": "2021-10-08T08:30:17.792682Z"
          }
        ]
      };

      expect(() => collectionToJson(collection: collection), throwsException);
    });
  });
}
