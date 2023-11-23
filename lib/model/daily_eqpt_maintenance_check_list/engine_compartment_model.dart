class EngineCompartment {
  final String sNo;
  final String headingOne;
  final String headingTwo;

  EngineCompartment({
    required this.sNo,
    required this.headingOne,
    required this.headingTwo,
  });
}

List<EngineCompartment> engineCompartment = [
  EngineCompartment(
    sNo: '2.01',
    headingOne: 'Engine oil',
    headingTwo: 'Fluid level',
  ),
  EngineCompartment(
    sNo: '2.02',
    headingOne: 'Engine coolant',
    headingTwo: 'Fluid level',
  ),
  EngineCompartment(
    sNo: '2.03',
    headingOne: 'Engine precleaner',
    headingTwo: 'Dirt buildup',
  ),
  EngineCompartment(
      sNo: '2.04',
      headingOne: 'Air filter',
      headingTwo: 'Restriction indicator'),
  EngineCompartment(
    sNo: '2.05',
    headingOne: 'Radiator',
    headingTwo: 'Fin blockage, leaks',
  ),
  EngineCompartment(
      sNo: '2.06',
      headingOne: 'All hoses',
      headingTwo: 'Cracks, wear spots, leaks'),
  EngineCompartment(
    sNo: '2.07',
    headingOne: 'All belts',
    headingTwo: 'Tightness,wear, cracks',
  ),
  EngineCompartment(
    sNo: '2.08',
    headingOne: 'overall Engine compartment',
    headingTwo: 'Trashor dirt buildup, leaks',
  ),
];
