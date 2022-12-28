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
  final json = fsParser.parseFirestoreDocument(documentJson: firestoreJsonDoc);

  // You can use this method bellow to parse & convert firestore collection to JSON
  // fsParser.parseCollection(firestoreCollection: firestoreCollection);
}
