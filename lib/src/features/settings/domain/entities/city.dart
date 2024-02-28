import 'package:equatable/equatable.dart';

class City extends Equatable {
  final String name;
  final String timezone;
  final String slug;

  const City({required this.name, required this.timezone, required this.slug});

  @override
  List<Object?> get props => [name, timezone, slug];

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
        name: json['name'] as String,
        timezone: json['timezone'] as String,
        slug: json['slug'] as String);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "timezone": timezone, "slug": slug};
  }
}
