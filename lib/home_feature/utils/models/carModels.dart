class CarModel {
  CarModel({
    this.brand,
    this.model,
    this.version,
    this.year,
    this.cylinders,
    this.fuel,
    this.gearbox,
    this.drive,
    this.bodyType,
    this.condition,
    this.titleStatus,
    this.paintColor,
    this.options,
  });

  String? brand;
  String? model;
  String? version;
  DateTime? year;
  int? cylinders;
  String? fuel;
  String? gearbox;
  String? drive;
  String? bodyType;
  String? condition;
  String? titleStatus;
  String? paintColor;
  List<String>? options;
}
