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

Convert a json data schema into a format understandable by the cloud firestore rest api and vice versa

#### Supported values

Regarding the conversion of a json to the format read by the cloud firestore rest api and vice versa

All values are supported:

- stringValue
- integerValue
- doubleValue
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
// Import firestore_api_parser
import 'package:firestore_api_parser/firestore_api_parser.dart';

import 'agent.dart';

void main() {
  final fsParser = FirestoreApiParser();

  final missions = <Map<String, String>>[
    {'2022': 'No Time To Die'},
    {'2015': 'Spectre'},
    {'2006': 'Casino Royale'},
  ];

  final names = {'lastname': 'BOND', 'firstname': 'James', 'initial': 'JB'};

  final bond = Agent(
    names: names,
    missions: missions,
    status: 'In service',
    round: 20.5,
    timestamp: DateTime.parse('2021-10-07T19:00:00Z'),
    storageRef: 'projects/my_great_project/databases/(default)/documents/USERS/[doc_id]',
    nullable: null,
    coordinates: {'latitude': -64, 'longitude': -86},
  );

  // Will convert [bond] to the format json used by Firestore format documents
  final firestoreJsonDoc = fsParser.parseJson(json: bond.toJson());

  // Will convert [firestoreJsonDoc] to a "normal" JSON format representation
  final json = fsParser.parseFirestoreDocument(doc: firestoreJsonDoc);

  // You can use this method bellow to parse & convert firestore collection to JSON
  // final document = fsParser.parseCollection(collection: firestoreCollection);

  // if your firestore collection is a result of a structuredQuery, set isStructuredQuery parameter to true
  // final documentFromQuery = fsParser.parseCollection(collection: firestoreCollection, isStructuredQuery: true);
}

```

## Additional information

- In order for a string to be recognized as a referenceValue by the **firestore_api_parser** package as well as by *
  *cloud firestore**, your string must start with **projects/** . This means that all
  strings starting with **projects/** are considered as a referenceValue

i.e:  these strings will be stored as a **referenceValue** in cloud firestore

```dart

final String str = 'projects/my_great_project/databases/(default)/documents/';
final String myString = 'projects/anything';
```

- To store a value of type geoPoint, you must create a map that contains only 2 keys **longitude** and **latitude** and
  their values

i.e:

```dart

final goodGeoPointValue = {'longitude': -86, 'latitude': -64};
```

- To store data as a **timestampValue**, you need to pass the date in _isoString_ format like **YYYY-MM-DDTHH:MM:SSZ**.
  If the conversion of the date to the firestore json format fails, the value is
  stored as a **stringValue**

- For a better result and to avoid bugs or unexpected behaviors, we recommend you to use
  the [json_serializable](https://pub.dev/packages/json_serializable) package (or any other JSON serialization tool) to
  serialize your data / object into JSON as follows:

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

  final Map<String, dynamic> names;
  final List missions;

  Agent({
    required this.coordinates,
    required this.storageRef,
    required this.timestamp,
    required this.round,
    this.nullable,
    required this.names,
    required this.missions,
    required this.status,
  });

  final String status;

  factory Agent.fromJson(Map<String, dynamic> data) => _$AgentFromJson(data);

  Map<String, dynamic> toJson() => _$AgentToJson(this);
}
```

## Features and bugs

For any suggestions or feature requests, please contact us at _tech.riverfortress@gmail.com_ .

For any bugs report, post your problem in the  [issue tracker][tracker] section.

Stay safe!

[tracker]: https://github.com/stvndelucis/firestore_api_parser/issues

[example]: https://github.com/stvndelucis/firestore_api_parser/blob/main/example/example.dart
