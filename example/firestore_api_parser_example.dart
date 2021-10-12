import 'package:firestore_api_parser/firestore_api_parser.dart';

import 'agent.dart';

void main() {
  final missions = <Map<String, String>>[
    {'2022': 'No Time To Die'},
    {'2015': 'Spectre'},
    {'2006': 'Casino Royale'},
  ];

  final names = {'lastname': 'BOND', 'firstname': 'James', 'initial': 'JB'};

  final jb = Agent(
      names: names,
      missions: missions,
      status: 'In service',
      round: 20.5,
      timestamp: DateTime.parse('2021-10-07T19:00:00Z'),
      storageRef: 'projects/my_great_project/databases/(default)/documents/USERS/an_user_id',
      nullable: null,
      coordinates: {'latitude': -64, 'longitude': -86});
  final fParser = FirestoreApiParser();

  final doc = fParser.parseJson(json: jb.toJson()); //convert

  print(doc);

  print('\n------------SEPARATOR------------\n');

  final json = fParser.parseFirestoreDocument(documentJson: doc);

  print(json);
}
