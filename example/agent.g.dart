// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Agent _$AgentFromJson(Map<String, dynamic> json) => Agent(
      coordinates: Map<String, num>.from(json['coordinates'] as Map),
      storageRef: json['storageRef'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      round: (json['round'] as num).toDouble(),
      nullable: json['nullable'] as String?,
      names: json['names'] as Map<String, dynamic>,
      missions: json['missions'] as List<dynamic>,
      status: json['status'] as String,
    );

Map<String, dynamic> _$AgentToJson(Agent instance) => <String, dynamic>{
      'storageRef': instance.storageRef,
      'timestamp': instance.timestamp.toIso8601String(),
      'nullable': instance.nullable,
      'round': instance.round,
      'coordinates': instance.coordinates,
      'names': instance.names,
      'missions': instance.missions,
      'status': instance.status,
    };
