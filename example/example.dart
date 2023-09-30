import 'package:firestore_api_parser/firestore_api_parser.dart';

import 'agent.dart';

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
    timestamp: DateTime.utc(2021, 10, 07, 19, 00, 00),
    storageRef: 'projects/my_great_project/databases/(default)/documents/USERS/[doc_id]',
    nullable: null,
    coordinates: const {'latitude': -64, 'longitude': -86},
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
