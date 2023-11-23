class DashboardModel {
  final String image;
  final String text;

  DashboardModel({required this.image, required this.text});
}

List<DashboardModel> dashboardModel = [
  // need to change icons
  DashboardModel(
      image: 'assets/images/sop.png', text: 'SOP/COP'), //Need pdf link
  DashboardModel(image: 'assets/images/file.png', text: 'SMP'), //pdf link
  DashboardModel(
      image: 'assets/images/safety-performance.png',
      text: 'Safety Performance Statistics'), //Will get API
  DashboardModel(
      image: 'assets/images/safety.png',
      text: 'Safety Initiatives'), // need pdf link
  DashboardModel(
      image: 'assets/images/emergency.png',
      text: 'Emergency Response'), //nothing now
  DashboardModel(
      image: 'assets/images/health.png',
      text:
          'Health'), //will get API -> For now make 3 module 1.IME  2.Bar PME Data 3.Ambient Air Quality
  DashboardModel(
      image: 'assets/images/first-aid.png',
      text: 'Training Animations'), //nothing now
  DashboardModel(
      image: 'assets/images/ambulance-details.png',
      text: 'Operational Performance'),
  DashboardModel(
      image: 'assets/images/ambulance-details.png',
      text: 'Rewards and Recognition'), //nothing now
];
