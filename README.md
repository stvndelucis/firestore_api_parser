A library for Dart developers.

## Usage

A simple usage example:

```dart
import 'package:firestore_api_parser/firestore_api_parser.dart';

main() {
  
  // normal Json format
  final Map<String, dynamic> myJsonModel = {
    'names': {
      'firstname': 'James',
      'lastname': 'Bond',
      'initial': 'JB'
    },
    'missions': [{'2021': 'No Time To Die'}, {'2015': 'Spectre'}, {'2006': 'Casino Royale'}]
    'totalMissions': 3,
  };

  //Initialize the FirestoreApiParser
  final fParser = FirestoreApiParser();

  // Use the toFirestoreJson() method to convert a Json to Cloud Firestore document Json format
  // and pass it your json 
  final firestoreJson = fParser.toFirestoreJson(json: jb.toJson());
  print(firestoreJson);

  print('\n------------SEPARATOR------------\n');

  // Use the toJson() method to convert a Cloud Firestore document json to a normal json
  //and pass it the firestore json format
  final json = fParser.toJson(firestoreJson: firestoreJson);
  print(json);
  
}

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
