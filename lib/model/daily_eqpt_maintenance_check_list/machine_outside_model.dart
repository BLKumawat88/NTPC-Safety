class MachineOutside {
  final String sNo;
  final String headingOne;
  final String headingTwo;

  MachineOutside({
    required this.sNo,
    required this.headingOne,
    required this.headingTwo,
  });
}

List<MachineOutside> machineOutside = [
  MachineOutside(
    sNo: '3.01',
    headingOne: 'Lights, Lenses',
    headingTwo: '	Damages, cleanliness',
  ),
  MachineOutside(
    sNo: '3.02',
    headingOne: 'Mirror, windows',
    headingTwo: 'Damages, cleanliness',
  ),
  MachineOutside(
    sNo: '3.03',
    headingOne: 'Windshield wipers & Washers',
    headingTwo: 'Wear, damages, fluid level',
  ),
];
