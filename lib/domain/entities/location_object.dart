class LocationObject {
  late bool correct;
  final double? latitude;
  final double? longitude;

  LocationObject.geolocation(this.latitude, this.longitude) {
    latitude != null && longitude != null ? correct = true : correct = false;
  }

  @override
  String toString() {
    return latitude.toString() + ", " + longitude.toString();
  }
}
