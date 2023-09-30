## 1.0.0

Initial version. A simple parser allowing you to convert a json that is in firebase cloud firestore format to the
conventional json format.
For the moment the API only allows to convert cloud firestore documents. An update to support the conversion of cloud
firestore collection is planned for the next updates of the package

## 1.0.1

Adding support for meta^1.3.0

## 1.0.2

Adding support these package :

- json_serializable: ^4.1.4
- json_annotation: ^4.0.1

## 1.0.3

In this update, we

- Support for parsing and converting cloud firestore collection to standard json format, by using **parseCollection**
  method
- have fixed some minor bugs
- Added support for parsing doubleValue. Sorry to have forgotten, we are sorry for the inconvenience caused

## 1.0.4

- Fix minor bugs about parsing of a cloud firestore arrayValue
- Deprecating toJson and toFirestoreJson methods

## 1.0.5

- Fixed the bug that unintentionally converted a **string** into a **timestamp**.
  Now, for a string to be recognized in **timestamp** format in Firestore, it must be in **Iso8601 utc** format (so it
  must end with Z) otherwise it will be stored in Firestore as **stringValue** if the conversion fails.
- Updated plugin example use
- Updated plugin description

## 1.0.6

- Updated README.md file

## 1.1.0

**BREAKING CHANGES!**

1. Improvement of the method `parseCollection()`. in order to meet the need to convert the documents returned by cloud
   firestore following a **structuredQuery**, we have made some modifications to the `parseCollection()` method so that
   it is able to convert the data from a structured query to standard json format.
   So we introduced the optional parameter `isStructuredQuery` which by default is `false`.
   When you perform structuredQuery with the cloud firestore REST API, you will only have to set the `isStructuredQuery`
   parameter to `true` so that it can parse and convert the data from the collection you provide.

2. Fixed the bug that prevented the conversion/parsing of documents from a Firestore collection obtained from the result
   of a structuredQuery

3. Suppression of depreciated methods `toFirestoreJson()`, `toJson()`

4. Updated README.md file

## 1.1.1

- intl package upgraded to ^0.18.0
- environnement constraint upgraded to '>=2.12.0 <4.0.0'

## 1.1.2

**BREAKING CHANGES!**

1. Parsing a structured query collection support was removed until we can implement a solid, viable solution... Coming
   soon :).
2. Adding extension methods `toFirestoreJson` and `toStandardJson` to encode and decode documents. Also
   added `parseCollection` extension method to decode a firestore collection.
3. Improved code structure to enhance maintainability.
4. Map and Array firestore now return empty values instead of throwing an exception when "fields" or "values" are not
   supplied.
5. Updated project dependencies.
6. Improved package tests.
7. Updated example and README file.