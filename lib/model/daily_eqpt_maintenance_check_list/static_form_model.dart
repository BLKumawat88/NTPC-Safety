class StaticForm {
  final String title;
  bool okOne;
  bool notOkOne;
  bool okTwo;
  bool notOkTwo;

  StaticForm({
    required this.title,
    required this.okOne,
    required this.notOkOne,
    required this.okTwo,
    required this.notOkTwo,
  });
}

List<StaticForm> staticForm = [
  StaticForm(
    title: 'Sign',
    okOne: false,
    notOkOne: false,
    okTwo: false,
    notOkTwo: false,
  ),
  StaticForm(
    title: 'Name',
    okOne: false,
    notOkOne: false,
    okTwo: false,
    notOkTwo: false,
  ),
  StaticForm(
    title: 'Design',
    okOne: false,
    notOkOne: false,
    okTwo: false,
    notOkTwo: false,
  ),
  StaticForm(
    title: 'Date',
    okOne: false,
    notOkOne: false,
    okTwo: false,
    notOkTwo: false,
  ),
];
