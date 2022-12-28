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

## 1.0.5
- Fixed the bug that unintentionally converted a **string** into a **timestamp**.
Now, for a string to be recognized in **timestamp** format in Firestore, it must be in **Iso8601 utc** format (so it must end with Z) otherwise it will be stored in Firestore as **stringValue** if the conversion fails.
- Updated plugin example use
- Updated plugin description

## 1.0.6
- Updated README.md file