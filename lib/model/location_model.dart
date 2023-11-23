class LocationModel {
  final String image;
  final String title;

  LocationModel(this.image, this.title);
}

List<LocationModel> locationModel = [
  LocationModel('assets/images/location.png', 'South Pit'),
  LocationModel('assets/images/east.png', 'East Pit'),
  LocationModel('assets/images/west.png', 'West Pit'),
  LocationModel('assets/images/Extension.png', 'South Pit Extension'),
  LocationModel('assets/images/weigh-station.png', 'Weighbridge'),
  LocationModel('assets/images/workshop.png', 'Workshop'),
  LocationModel('assets/images/dump.png', 'OB Dump'),
  LocationModel('assets/images/substation.png', 'Sub Station'),
  LocationModel('assets/images/building.png', 'Admin Building'),
];
