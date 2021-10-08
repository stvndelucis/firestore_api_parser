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
      storageRef: 'projects/vumot-health-2fd0a/databases/(default)/documents/USERS/AnVHHk2DJGOLXfLRYLlh',
      nullable: null,
      coordinates: {'latitude': -64, 'longitude': -86});
  final fParser = FirestoreApiParser();

  final doc = fParser.parseJson(json: jb.toJson());

  print(doc);

  print('------------SEPARATOR------------');

  final json = fParser.parseDocument(firestoreJson: doc);

  print(json);
}

var x = {
  'fields': {
    'isme': {'booleanValue': true},
    'projects': {
      'arrayValue': {
        'values': [
          {'stringValue': 'Atlas Workspace'},
          {'stringValue': 'Vumot'},
          {'stringValue': 'Vumot Health'}
        ]
      }
    },
    'age': {'integerValue': 21},
    'address': {'nullValue': null},
    'round': {'integerValue': 20.5},
    'name': {'stringValue': 'Steeven Delucis'},
    'arrivage': {'timestampValue': '2021-10-07T19:00:00Z'},
    'partner': {
      'referenceValue': 'projects/vumot-health-2fd0a/databases/(default)/documents/USERS/AnVHHk2DJGOLXfLRYLlh'
    },
    'place': {
      'geoPointValue': {'latitude': '-64', 'longitude': '-86'}
    },
    'job': {'stringValue': 'developer'},
    'phones': {
      'mapValue': {
        'fields': {
          'galaxy': {'stringValue': 'S21 Ultra'},
          'array': {
            'arrayValue': {
              'values': [
                {'stringValue': ''},
                {
                  'mapValue': {
                    'fields': {
                      'mymap': {'stringValue': '5'}
                    }
                  }
                }
              ]
            }
          },
          'iphone': {'stringValue': '11 pro max'}
        }
      }
    }
  },
};
