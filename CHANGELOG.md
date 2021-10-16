## 1.0.0
Initial version. A simple parser allowing you to convert a json that is in firebase cloud firestore format to the conventional json format.
  For the moment the API only allows to convert cloud firestore documents. An update to support the conversion of cloud firestore collection is planned for the next updates of the package

## 1.0.1
Adding support for meta^1.3.0

## 1.0.2
Adding support these package :
- json_serializable: ^4.1.4
- json_annotation: ^4.0.1

## 1.0.3
In this update, we
- Support for parsing and converting cloud firestore collection to standard json format, by using **parseCollection** method
- have fixed some minor bugs
- Added support for parsing doubleValue. Sorry to have forgotten, we are sorry for the inconvenience caused

## 1.0.4
- Fix minor bugs about parsing of a cloud firestore arrayValue
- Deprecating toJson and toFirestoreJson methods