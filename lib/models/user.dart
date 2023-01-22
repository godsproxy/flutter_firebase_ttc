import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

// This doesn't exist yet...! See "Next Steps"
part 'user.g.dart';

/// A custom JsonSerializable annotation that supports decoding objects such
/// as Timestamps and DateTimes.
/// This variable can be reused between different models
const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  // The following values could alternatively be set inside your `build.yaml`
  explicitToJson: true,
  createFieldMap: true,
);

@Collection<User>('users')
@firestoreSerializable
class User {
  User(
    this.id,
    this.smoberDate, {
    required this.name,
    required this.age,
    required this.email,
  }) {
    // Apply the validator
    _$assertUser(this);
  }

  @Id()
  final String id;

  final DateTime? smoberDate;

  final String name;
  @Min(18)
  final int age;
  final String email;
}

final userRef = UserCollectionReference();
