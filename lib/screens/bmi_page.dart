import 'dart:math';

import 'package:flutter/material.dart';
import 'material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});
  static final List<Map<String, dynamic>> records = [
    {
      'BMI': '31.1',
      'status': 'Overweight',
      'date': '14/03/2024',
      'time': '2:30pm',
      'gender': 'Male',
      'age': '20',
      'height': '170',
      'weight': '90',
      'healthyweight1': '53.5',
      'healthyweight2': '72',
    },
  ];

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  late int month;
  late String year;
  late ValueNotifier<int> monthValue = ValueNotifier<int>(month);
  late ValueNotifier<String> yearValue = ValueNotifier<String>(year);
  late bool calculated;
  late String gender;
  late String age;
  late String height;
  late String weight;
  late String date;
  late String status;
  late double BMI;
  late double healthyweight1;
  late double healthyweight2;

  @override
  void dispose() {
    super.dispose();
  }

  selectmonth(newmonth) {
    setState(() {
      month = newmonth;
      monthValue = ValueNotifier<int>(month);
    });
  }

  selectyear(newyear) {
    setState(() {
      year = newyear;
      yearValue = ValueNotifier<String>(year);
    });
  }

  selectage(newage) {
    setState(() {
      age = newage;
    });
  }

  selectgender(newgender) {
    setState(() {
      gender = newgender;
    });
  }

  selectheight(newheight) {
    setState(() {
      height = newheight;
    });
  }

  selectweight(newweight) {
    setState(() {
      weight = newweight;
    });
  }

  @override
  void initState() {
    super.initState();
    calculated = false;
    month = 2;
    year = "2024";
    gender = "Male";
    age = "20";
    height = "170";
    weight = "60";
    date = "23/3/2024";
    status = "Normal";
    BMI = 20.8;
    healthyweight1 = 55.2;
    healthyweight2 = 78;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 0,
          toolbarHeight: 0,
          bottom: MyTabBar(
            child: TabBar(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.15,
                  0,
                  MediaQuery.of(context).size.width * 0.15,
                  0),
              tabs: [
                Tab(text: "New Record"),
                Tab(text: "History"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            calculated
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1,
                          ),
                          child: Container(
                              child: Align(
                            alignment: Alignment.topCenter,
                            heightFactor: 0.8,
                            child: SfRadialGauge(axes: <RadialAxis>[
                              RadialAxis(
                                  showAxisLine: false,
                                  showTicks: false,
                                  showLabels: false,
                                  backgroundImage:
                                      AssetImage("lib/assets/images/bmi.png"),
                                  startAngle: 180,
                                  endAngle: 360,
                                  minimum: 15.0,
                                  maximum: 45.0,
                                  pointers: <GaugePointer>[
                                    NeedlePointer(
                                        value: BMI < 25 && BMI > 18.4
                                            ? 24.9 -
                                                ((24.9 - BMI) / (6.4 / 4.9))
                                            : BMI < 18.5 && BMI > 15
                                                ? 15 +
                                                    ((BMI - 15) / (3.4 / 4.9))
                                                : BMI)
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        widget: Container(
                                            child: Text("$BMI",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: BMI < 18.5
                                                        ? Color(0xff87ADC7)
                                                        : BMI < 25.0
                                                            ? Color(0xff70C099)
                                                            : BMI < 30.0
                                                                ? Color(
                                                                    0xffF9D230)
                                                                : BMI < 35
                                                                    ? Color(
                                                                        0xffEF9852)
                                                                    : BMI < 40
                                                                        ? Color(
                                                                            0xffDF434A)
                                                                        : Color(
                                                                            0xffBD2B37),
                                                    fontWeight:
                                                        FontWeight.w400))),
                                        angle: 90,
                                        positionFactor: 0.4)
                                  ])
                            ]),
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1,
                          ),
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10.0,
                                  spreadRadius: -5,
                                )
                              ],
                            ),
                            child: Stack(
                              children: [
                                Card(
                                    color: Color(0xFFffffff),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container()),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "$gender | ${age}y/o | ${height}cm | ${weight}kg",
                                            style: TextStyle(
                                                fontFamily: "LeagueSpartan",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Weight Status",
                                                style: TextStyle(
                                                    fontFamily: "LeagueSpartan",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Color(0xffa6a6a6)),
                                              ),
                                              Text(
                                                BMI < 18.5
                                                    ? "Underweight"
                                                    : BMI < 25.0
                                                        ? "Normal"
                                                        : BMI < 30.0
                                                            ? "Overweight"
                                                            : BMI < 35
                                                                ? "Obese"
                                                                : BMI < 40
                                                                    ? "Moderately Obese"
                                                                    : "Extremely Obese",
                                                style: TextStyle(
                                                  fontFamily: "LeagueSpartan",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 24,
                                                  color: BMI < 18.5
                                                      ? Color(0xff87ADC7)
                                                      : BMI < 25.0
                                                          ? Color(0xff70C099)
                                                          : BMI < 30.0
                                                              ? Color(
                                                                  0xffF9D230)
                                                              : BMI < 35
                                                                  ? Color(
                                                                      0xffEF9852)
                                                                  : BMI < 40
                                                                      ? Color(
                                                                          0xffDF434A)
                                                                      : Color(
                                                                          0xffBD2B37),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Calculation Date",
                                                style: TextStyle(
                                                    fontFamily: "LeagueSpartan",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Color(0xffa6a6a6)),
                                              ),
                                              Text(
                                                date,
                                                style: TextStyle(
                                                  fontFamily: "LeagueSpartan",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 24,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Healthy Weight for You",
                                                style: TextStyle(
                                                    fontFamily: "LeagueSpartan",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Color(0xffa6a6a6)),
                                              ),
                                              Text(
                                                "${healthyweight1}kg - ${healthyweight2}kg",
                                                style: TextStyle(
                                                  fontFamily: "LeagueSpartan",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 24,
                                                  color: Color(0xff00bf63),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 140,
                                child: Stack(
                                  alignment: Alignment.center,
                                  fit: StackFit.expand,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xff966fd6),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(40),
                                        onTap: () {
                                          setState(() {
                                            // save data into local list, put into firebase in the future
                                            BMIPage.records.insert(0, {
                                              'BMI': BMI.toString(),
                                              'status': BMI < 18.5
                                                  ? "Underweight"
                                                  : BMI < 25.0
                                                      ? "Normal"
                                                      : BMI < 30.0
                                                          ? "Overweight"
                                                          : BMI < 35
                                                              ? "Obese"
                                                              : BMI < 40
                                                                  ? "Moderately Obese"
                                                                  : "Extremely Obese",
                                              'date': '14/03/2024',
                                              'time': '2:30pm',
                                              'gender': gender,
                                              'age': age,
                                              'height': height,
                                              'weight': weight,
                                              'healthyweight1': healthyweight1
                                                  .toStringAsFixed(1),
                                              'healthyweight2': healthyweight2
                                                  .toStringAsFixed(1),
                                            });

                                            // change calculator values back to default
                                            calculated = false;
                                            month = 2;
                                            year = "2024";
                                            gender = "Male";
                                            age = "20";
                                            height = "170";
                                            weight = "60";
                                            date = "23/3/2024";
                                            BMI = 20.8;
                                            healthyweight1 = 55.2;
                                            healthyweight2 = 78;
                                          });
                                        },
                                        child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Save",
                                            style: TextStyle(
                                                fontFamily: "LeagueSpartan",
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: ListView(
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          childAspectRatio: 1.2,
                          primary: false,
                          padding: const EdgeInsets.only(bottom: 5),
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                          children: [
                            MyCard(
                              select: true,
                              label: 'Gender',
                              switches: false,
                              initialValue: "Male",
                              age: selectage,
                              gender: selectgender,
                              height: selectheight,
                              weight: selectweight,
                            ),
                            MyCard(
                              select: false,
                              label: 'Age',
                              switches: false,
                              initialValue: "20",
                              age: selectage,
                              gender: selectgender,
                              height: selectheight,
                              weight: selectweight,
                            ),
                            MyCard(
                              select: false,
                              label: 'Weight',
                              switches: true,
                              initialValue: "60",
                              age: selectage,
                              gender: selectgender,
                              height: selectheight,
                              weight: selectweight,
                            ),
                            MyCard(
                              select: false,
                              label: 'Height',
                              switches: true,
                              initialValue: "170",
                              age: selectage,
                              gender: selectgender,
                              height: selectheight,
                              weight: selectweight,
                            ),
                          ],
                        ),
                        GridView.count(
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 3.5),
                          primary: false,
                          crossAxisCount: 1,
                          shrinkWrap: true,
                          children: [
                            Stack(
                              fit: StackFit.expand,
                              children: [
                                Card(
                                    color: Color(0xFFEDEDEB),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container()),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Date",
                                              style: TextStyle(
                                                  fontFamily: "LeagueSpartan",
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ValueListenableBuilder(
                                                  valueListenable: monthValue,
                                                  builder:
                                                      (BuildContext context,
                                                          int value,
                                                          Widget? child) {
                                                    return Expanded(
                                                      flex: 1,
                                                      child: MyDateCard(
                                                        type: "day",
                                                        initialValue: "14",
                                                        monthselected:
                                                            selectmonth,
                                                        month: monthValue.value,
                                                        yearselected:
                                                            selectyear,
                                                        year: year,
                                                      ),
                                                    );
                                                  }),
                                              Expanded(
                                                flex: 1,
                                                child: MyDateCard(
                                                  type: "month",
                                                  initialValue: "March",
                                                  monthselected: selectmonth,
                                                  month: month,
                                                  yearselected: selectyear,
                                                  year: year,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: MyDateCard(
                                                  type: "year",
                                                  initialValue: "2024",
                                                  monthselected: selectmonth,
                                                  month: month,
                                                  yearselected: selectyear,
                                                  year: year,
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 140,
                                child: Stack(
                                  alignment: Alignment.center,
                                  fit: StackFit.expand,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xff966fd6),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(40),
                                        onTap: () {
                                          setState(() {
                                            calculated = true;
                                            BMI = double.parse((double.parse(
                                                        weight) /
                                                    pow(
                                                        double.parse(height) /
                                                            100,
                                                        2))
                                                .toStringAsFixed(1));
                                            healthyweight1 = double.parse(
                                                (18.5 *
                                                        pow(
                                                            double.parse(
                                                                    height) /
                                                                100,
                                                            2))
                                                    .toStringAsFixed(1));
                                            healthyweight2 = double.parse(
                                                (24.9 *
                                                        pow(
                                                            double.parse(
                                                                    height) /
                                                                100,
                                                            2))
                                                    .toStringAsFixed(1));
                                          });
                                        },
                                        child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Calculate",
                                            style: TextStyle(
                                                fontFamily: "LeagueSpartan",
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.5,
                ),
                primary: false,
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: 20,
                ),
                itemCount: BMIPage.records.length,
                itemBuilder: (BuildContext context, int index) {
                  return Records(
                    BMI: BMIPage.records[index]['BMI'],
                    status: BMIPage.records[index]['status'],
                    date: BMIPage.records[index]['date'],
                    time: BMIPage.records[index]['time'],
                    gender: BMIPage.records[index]['gender'],
                    age: BMIPage.records[index]['age'],
                    height: BMIPage.records[index]['height'],
                    weight: BMIPage.records[index]['weight'],
                    healthyweight1: BMIPage.records[index]['healthyweight1'],
                    healthyweight2: BMIPage.records[index]['healthyweight2'],
                    index: BMIPage.records.length - index,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
