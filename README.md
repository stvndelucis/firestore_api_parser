A Flutter and Dart plugin allowing you to convert the JSON format used by firestore to represent its documents or
collections to the conventional JSON data format

## Motivation

As a flutter developer, developing for Windows and Linux platforms, we noticed that none of the packages (
cloud_firestore, etc.) provided by Firebase supported desktop platforms (except MacOs). Nevertheless, there is still the
solution with the REST APIs provided by Firebase. But a problem that arises when working with Firebase REST API mainly
with Cloud Firestore, this problem is that the data provided by Cloud Firestore is in a rather "special" JSON format
which can slow down your development time if you try to take some more time to analyze the data and apply a conversion
yourself.
It is with this in mind that we have created this package to convert documents and/or collections that are in the "
firestore format" to a "standard" json format.

## Use case

This package has been designed to work with Firebase's Cloud Firestore REST API.
If you are developing a flutter application on Windows, Linux or a Dart console application (except macOS) you can use
this package to help you convert data from a document or a Firestore collection. Because the currently available
cloud_firestore plugin does not support these platforms.

- If you are developing for a platform like iOS, macOS, Android or Web we recommend you to use the official
  cloud_firestore package which does a great job.
- You can also use this plugin to receive, send and convert your data from a Firestore document or collection via the
  Cloud Firestore REST API.

## Features

Convert/encode a json data schema into a format understandable by the cloud firestore rest api and vice versa

#### Supported values

Regarding the conversion of a json to the format read by the cloud firestore rest api and vice versa

All values are supported:

- stringValue (String)
- integerValue (int)
- doubleValue (double)
- booleanValue (bool)
- mapValue (Map)
- arrayValue (List)
- timestampValue (DateTime)
- geoPointValue (Map)
- referenceValue (String)
- nullValue (null)

## Getting started

Installation

Add this line to pubspec.yaml

```yaml
dependencies:
firestore_api_parser: <latest_version> #add this
```

Import package

```dart
import 'package:firestore_api_parser/firestore_api_parser.dart';
```

## Usage

A simple usage example. For a more concrete and detailed example, please consult the [example file][example].

```dart
void main() {
  final names = {'lastname': 'BOND', 'firstname': 'James', 'initial': 'JB'};

  final bond = Agent(
    names: names,
    missions: [
      {'2022': 'No Time To Die'},
      {'2015': 'Spectre'},
      {'2006': 'Casino Royale'},
    ],
    status: 'In service',
    round: 20.5,
    timestamp: DateTime.parse('2021-10-07T19:00:00Z'),
    storageRef: 'projects/my_great_project/databases/(default)/documents/USERS/abc123',
    nullable: null,
    coordinates: {'latitude': -64, 'longitude': -86},
  );

  // Will convert [bond] to the format json used by Firestore format documents
  final firestoreJsonDoc = FirestoreApiParser.convertToFirestoreDocument(json: bond.toJson());

  //using extension method
  // final firestoreJsonDoc = bond.toJson().toFirestoreJson;

  // Will convert [firestoreJsonDoc] to a "standard" JSON format representation
  final json = FirestoreApiParser.convertToStandardJson(doc: firestoreJsonDoc);

  //using extension method
  // final json =  firestoreJsonDoc.toStandardJson;

  // You can use this method bellow to parse & convert firestore collection to JSON
  // final document = FirestoreApiParser.parseCollection(collection: firestoreCollection);
}
```

## Additional information

- You can use extension methods to encode or decode data

```dart

final firestoreJsonDoc = bond
    .toJson()
    .toFirestoreJson; //encode data to firestore Json structure using extension methods

final json =  firestoreJsonDoc.toStandardJson; //decode data using extension methods
```

- To insert a **referenceValue**, the value must match this pattern `projects/{{my_great_project}}/databases/(default)
  /documents/` according to the firestore structure

i.e:  this will be recognized as a **referenceValue** by the package and cloud_firestore

```dart

final reference = 'projects/{{my_great_project}}/databases/(default)/documents/';
// also you can add collection or doc 
// projects/{{my_great_project}}/databases/(default)/documents/{{my_collection}}  //point to a collection
// projects/{{my_great_project}}/databases/(default)/documents/{{my_collection}}/{{docid}} //point to a document
```

- To insert a geoPointValue, you must create a map that contains only 2 keys **longitude** and **latitude** and
  their values

i.e:

```dart

final geoPointValue = {'longitude': -86, 'latitude': -64};
```

- To insert data as a **timestampValue**, you need to pass the date in _isoString_ format like **YYYY-MM-DDTHH:MM:SSZ**.
  If the conversion of the date to the firestore json format fails, the value will be inserted as a **stringValue**

- For a better result and to avoid bugs or unexpected behaviors, we recommend you to use
  the [json_serializable](https://pub.dev/packages/json_serializable) package (or any other JSON serialization tool) to
  serialize your data / object into JSON as follows:

i.e: json_serializable

```dart
import 'package:json_annotation/json_annotation.dart';

part 'agent.g.dart';

@JsonSerializable()
class Agent {
  final String storageRef;
  final DateTime timestamp;
  final String? nullable;
  final double round;
  final Map<String, num> coordinates;
  final String status;
  final Map<String, dynamic> names;
  final List missions;

  Agent({
    required this.coordinates,
    required this.storageRef,
    required this.timestamp,
    required this.round,
    required this.names,
    required this.missions,
    required this.status,
    this.nullable,

  });

  factory Agent.fromJson(Map<String, dynamic> data) => _$AgentFromJson(data);

  Map<String, dynamic> toJson() => _$AgentToJson(this);
}
```

## Features and bugs

For any suggestions or feature requests, please contact us at _tech.riverfortress@gmail.com_ .

For any bugs report, post your problem in the  [issue tracker][tracker] section.

Made with ❤

Stay safe!

[tracker]: https://github.com/stvndelucis/firestore_api_parser/issues

[example]: https://github.com/stvndelucis/firestore_api_parser/blob/main/example/example.dart
