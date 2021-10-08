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

  @override
  String toString() => '''
  Names : $names
  Missions : $missions
  Status : $status
    ''';
}
