class LocationObject {
  String? locationString;
  String? fullLocationString;
  double? latitude;
  double? longitude;

  LocationObject.geolocation(this.latitude, this.longitude);

  LocationObject(
    this.latitude,
    this.longitude,
    this.locationString,
    this.fullLocationString,
  );

  get getCoordinates => latitude.toString() + ", " + longitude.toString();
  get getLocationString => locationString;

  @override
  String toString() {
    return latitude.toString() + ", " + longitude.toString();
  }
}
