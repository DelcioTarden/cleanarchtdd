/// Model base class.
///
/// When defining some Model, it should implements this.
///
/// ### Example
///
/// ```dart
/// class ExampleModel implements Model {
///   String id;
///   String name;
///
///   ExampleModel({
///     this.id,
///     this.name,
///   });
///
///   @override
///   Map<String, dynamic> toMap(){
///     return {
///       'id': id,
///       'name': name,
///     };
///   }
///
///   factory ExampleModel.fromMap(Map<String, dynamic> map) {
///     return ExampleModel(
///       id: map['id'],
///       name: map['name'],
///     );
///   }
///
///   @override
///   ExampleModel toCopy() {
///     return ExampleModel.fromMap(this.toMap());
///   }
/// }
/// ```
abstract class Model {
  Map<String, dynamic> toMap();
  dynamic toCopy();
}