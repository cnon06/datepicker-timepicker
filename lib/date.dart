import 'package:flutter/material.dart';

class MyDate extends StatefulWidget {
  MyDate({Key? key}) : super(key: key);

  @override
  State<MyDate> createState() => _MyDateState();
}

class _MyDateState extends State<MyDate> {
  var dTime = DateTime.now();
  var myDateValue = DateTime(1990, 1, 1);
  var myTime = TimeOfDay.now();
  var myTime2 = TimeOfDay(hour: 1, minute: 30);

  @override
  Widget build(BuildContext context) {
    var fDate = DateTime(dTime.year - 1, 1, 13);
    var lDate = DateTime(dTime.year + 1, 12, 31);
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${myDateValue.day}-${myDateValue.month}-${myDateValue.year}",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
             // myTime2.toString(),
              "${myTime2.hour}:${myTime2.minute} ${myTime2.period}",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: dTime,
                          firstDate: fDate,
                          lastDate: lDate)
                      .then((value) {
                    myDateValue = value!;

                    setState(() {});
                  });
                },
                child: Text("Select Date")),
            ElevatedButton(
                onPressed: () {
                  showTimePicker(context: context, initialTime: myTime)
                      .then((value) {
                    myTime2 = value!;
                    setState(() {
                      
                    });
                  });
                },
                child: Text("Select Time")),
          ],
        ),
      ),
    );
  }
}
