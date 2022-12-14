extension DateTimeUtils on DateTime {
  String _addZero(int v)=> v>= 10  ? '$v' : '0$v';
  String get mm => _addZero(month);
  String get dd => _addZero(day);
  String get yyyyMmDd => '$year-$mm-$dd';

  String get hh => _addZero(hour);
  String get min =>  _addZero(minute);
  String get ss =>  _addZero(second);

  String get yyyyMmDdHhMmSs => '$yyyyMmDd $hh:$min:$ss';
}

extension DoubleUtils on String {
  List<String> get yyyyMmDdStrs => this.split('-');
  int get year => int.parse(yyyyMmDdStrs[0]);
  int get month => int.parse(yyyyMmDdStrs[1]);
  int get day => int.parse(yyyyMmDdStrs[2]);

  DateTime get dateTime => DateTime(year,month,day);
}
