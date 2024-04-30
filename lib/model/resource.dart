
/*
this is resource model
 */
import 'package:hive/hive.dart';
part 'resource.g.dart';
@HiveType(typeId: 0)
class Resource {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? year;
  @HiveField(3)
  String? color;
  @HiveField(4)
  String? pantoneValue;

  Resource({this.id, this.name, this.year, this.color, this.pantoneValue});

  Resource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    year = json['year'];
    color = json['color'];
    pantoneValue = json['pantone_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['year'] = this.year;
    data['color'] = this.color;
    data['pantone_value'] = this.pantoneValue;
    return data;
  }
}