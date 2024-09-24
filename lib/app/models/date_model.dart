
const String dateFieldDay='day';
const String dateFieldMonth='month';
const String dateFieldYear='year';

class DateModel{
  num day,month,year;

  DateModel({

    required  this.day,
    required this.month,
    required this.year,
  });

  Map<String,dynamic>toMap(){
    return <String,dynamic>{
      dateFieldDay:day,
      dateFieldMonth:month,
      dateFieldYear:year,
    };
  }

  factory DateModel.fromMap(Map<String,dynamic>map)=>DateModel(
    day: map[dateFieldDay],
    month:map[dateFieldMonth],
    year: map[dateFieldYear],
  );
}