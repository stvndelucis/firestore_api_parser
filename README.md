A Flutter and Dart plugin allowing you to convert the JSON format used by firestore to represent its documents or collections to the conventional JSON data format

## Features

Convert a json data schema into a format understandable by the cloud firestore rest api and vice versa

#### Supported values

Regarding the conversion of a json to the format read by the cloud firestore rest api and vice versa

All values are supported:

- stringValue
- integerValue
- booleanValue
- mapValue
- arrayValue
- timestampValue
- geoPointValue
- referenceValue
- nullValue

## Getting started

Installation

Add this line to pubspec.yaml

```yaml
dependencies:
firestore_api_parser: <latest_version>
```

Import package

```dart
import 'package:firestore_api_parser/firestore_api_parser.dart';
```

## Usage

A simple usage example. For a more concrete and detailed example, please consult the [example file][example].

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
  print(firestoreJson); //will print data as firestore json format

  print('\n------------SEPARATOR------------\n');

  // Use the toJson() method to convert a Cloud Firestore document json to a normal json
  //and pass it the firestore json format
  final json = fParser.toJson(firestoreJson: firestoreJson);
  print(json);
}

```

## Additional information

- In order for a string to be recognized as a referenceValue by the **firestore_api_parser** package as well as by **cloud firestore**, your string must start with **projects/** . This means that all
  strings starting with **projects/** are considered as a referenceValue

i.e:  these strings will be stored as a **referenceValue** in cloud firestore

```dart

final String str = 'projects/my_great_project/databases/(default)/documents/';
final String myString = 'projects/anything';
```

- To store a value of type geoPoint, you must create a map that contains only 2 keys **longitude** and **latitude** and their values

i.e:

```dart

final goodGeoPointValue = {'longitude': '-86', 'latitude': '-64'};
```

- To store data as a timestampValue, you need to pass the date in isoString format like **YYYY-MM-DDTHH:MM:SSZ**. If the conversion of the date to the firestore json format fails, the value is stored
  as a **stringValue**

## Features and bugs

For any bugs report or feature requests, please contact me at this email address _steevenaime.pro@gmail.com_ .

Issue tracker for this plugin is coming soon :) stay safe!

[tracker]: http://example.com/issues/replaceme

[example]: https://github.com/stvndelucis/firestore_api_parser/blob/main/example/firestore_api_parser_example.dart
