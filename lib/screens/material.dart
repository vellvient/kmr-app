import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:toggle_switch/toggle_switch.dart';

// use custom TabBar below for borderless TabBar
class MyTabBar extends StatelessWidget implements PreferredSizeWidget {
  const MyTabBar({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Theme(
        data: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            surfaceVariant: Colors.transparent,
          ),
        ),
        child: child);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class MyCard extends StatefulWidget {
  const MyCard(
      {super.key,
      required this.select,
      required this.label,
      required this.switches,
      required this.initialValue,
      required this.gender,
      required this.age,
      required this.weight,
      required this.height});

  final bool select;
  final String label;
  final bool switches;
  final String initialValue;
  final Function gender;
  final Function age;
  final Function weight;
  final Function height;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  late String statefulInitialValue;
  late int switchindex;

  @override
  void initState() {
    super.initState();
    statefulInitialValue = widget.initialValue;
    switchindex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.label,
                      style: const TextStyle(
                          fontFamily: "LeagueSpartan",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: widget.select
                            ? () {
                                setState(() {
                                  statefulInitialValue == "Male"
                                      ? statefulInitialValue = "Female"
                                      : statefulInitialValue = "Male";
                                  widget.gender(statefulInitialValue);
                                });
                              }
                            : () {
                                setState(() {
                                  statefulInitialValue =
                                      (int.parse(statefulInitialValue) - 1)
                                          .toString();
                                  widget.label == "Age"
                                      ? widget.age(statefulInitialValue)
                                      : widget.label == "Weight"
                                          ? widget.weight(statefulInitialValue)
                                          : widget.height(statefulInitialValue);
                                });
                              },
                        child: Icon(
                          widget.select
                              ? Icons.arrow_back_ios_new
                              : Icons.remove,
                          size: 24,
                          color: Color(0xffa6a6a6),
                        ),
                      ),
                      Text(
                        statefulInitialValue,
                        style: const TextStyle(
                            fontFamily: "LeagueSpartan",
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: widget.select
                            ? () {
                                setState(() {
                                  statefulInitialValue == "Male"
                                      ? statefulInitialValue = "Female"
                                      : statefulInitialValue = "Male";
                                  widget.gender(statefulInitialValue);
                                });
                              }
                            : () {
                                setState(() {
                                  statefulInitialValue =
                                      (int.parse(statefulInitialValue) + 1)
                                          .toString();
                                  widget.label == "Age"
                                      ? widget.age(statefulInitialValue)
                                      : widget.label == "Weight"
                                          ? widget.weight(statefulInitialValue)
                                          : widget.height(statefulInitialValue);
                                });
                              },
                        child: Icon(
                          widget.select ? Icons.arrow_forward_ios : Icons.add,
                          size: 24,
                          color: Color(0xffa6a6a6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: widget.switches
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ToggleSwitch(
                              minHeight: 30.0,
                              minWidth: 45.0,
                              initialLabelIndex: switchindex,
                              cornerRadius: 20.0,
                              activeFgColor: Colors.black,
                              inactiveBgColor: Colors.white,
                              inactiveFgColor: Color(0xffa6a6a6),
                              totalSwitches: 2,
                              labels: widget.label == "Weight"
                                  ? ['kg', 'lb']
                                  : ['cm', 'in'],
                              radiusStyle: true,
                              activeBgColors: [
                                [Color(0xffd9d9d9)],
                                [Color(0xffd9d9d9)]
                              ],
                              onToggle: (index) {
                                setState(() {
                                  switchindex = index!;
                                  widget.label == "Weight"
                                      ? index == 0
                                          ? statefulInitialValue = "60"
                                          : statefulInitialValue = "132"
                                      : index == 0
                                          ? statefulInitialValue = "170"
                                          : statefulInitialValue = "67";
                                });
                              },
                            ),
                          ],
                        )
                      : SizedBox()),
            ],
          ),
        ),
      ],
    );
  }
}

class MyDateCard extends StatefulWidget {
  const MyDateCard(
      {super.key,
      required this.initialValue,
      required this.type,
      required this.monthselected,
      required this.yearselected,
      required this.month,
      required this.year});
  final String initialValue;
  final String type;
  final Function monthselected;
  final Function yearselected;
  final int month;
  final String year;
  static final List<String> months = <String>[
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  State<MyDateCard> createState() => _MyDateCardState();
}

class _MyDateCardState extends State<MyDateCard> {
  late String statefulInitialValue;
  late int monthsindex;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    statefulInitialValue = widget.initialValue;
    monthsindex = widget.month;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: widget.type == "year"
              ? () {
                  setState(() {
                    statefulInitialValue =
                        (int.parse(statefulInitialValue) + 1).toString();
                    widget.yearselected(statefulInitialValue);
                  });
                }
              : widget.type == "month"
                  ? () {
                      setState(() {
                        monthsindex += 1;
                        monthsindex = monthsindex % 12;
                        statefulInitialValue = MyDateCard.months[monthsindex];
                        widget.monthselected(monthsindex);
                      });
                    }
                  : () {
                      setState(() {
                        statefulInitialValue =
                            (int.parse(statefulInitialValue) + 1).toString();
                        if (widget.type == "day") {
                          final int temp;
                          temp = widget.month + 1;
                          if (temp == 1 ||
                              temp == 3 ||
                              temp == 5 ||
                              temp == 7 ||
                              temp == 8 ||
                              temp == 10 ||
                              temp == 12) {
                            if (int.parse(statefulInitialValue) > 31) {
                              statefulInitialValue = (1).toString();
                            }
                            if (int.parse(statefulInitialValue) < 1) {
                              statefulInitialValue = (31).toString();
                            }
                          } else if (temp == 2) {
                            if (int.parse(widget.year) % 4 == 0) {
                              if (int.parse(widget.year) % 400 != 0) {
                                if (int.parse(statefulInitialValue) > 29) {
                                  statefulInitialValue = (1).toString();
                                }
                                if (int.parse(statefulInitialValue) < 1) {
                                  statefulInitialValue = (29).toString();
                                }
                              } else {
                                if (int.parse(statefulInitialValue) > 28) {
                                  statefulInitialValue = (1).toString();
                                }
                                if (int.parse(statefulInitialValue) < 1) {
                                  statefulInitialValue = (28).toString();
                                }
                              }
                            } else {
                              if (int.parse(statefulInitialValue) > 28) {
                                statefulInitialValue = (1).toString();
                              }
                              if (int.parse(statefulInitialValue) < 1) {
                                statefulInitialValue = (28).toString();
                              }
                            }
                          } else {
                            if (int.parse(statefulInitialValue) > 30) {
                              statefulInitialValue = (1).toString();
                            }
                            if (int.parse(statefulInitialValue) < 1) {
                              statefulInitialValue = (30).toString();
                            }
                          }
                        }
                      });
                    },
          child: const Icon(
            Icons.keyboard_arrow_up,
            size: 40,
            color: Color(0xffa6a6a6),
          ),
        ),
        Text(
          statefulInitialValue,
          style: const TextStyle(
              fontFamily: "LeagueSpartan",
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.black),
        ),
        GestureDetector(
          onTap: widget.type == "year"
              ? () {
                  setState(() {
                    statefulInitialValue =
                        (int.parse(statefulInitialValue) - 1).toString();
                    widget.yearselected(statefulInitialValue);
                  });
                }
              : widget.type == "month"
                  ? () {
                      setState(() {
                        monthsindex -= 1;
                        monthsindex = monthsindex % 12;
                        statefulInitialValue = MyDateCard.months[monthsindex];
                        widget.monthselected(monthsindex);
                      });
                    }
                  : () {
                      setState(() {
                        statefulInitialValue =
                            (int.parse(statefulInitialValue) - 1).toString();
                        if (widget.type == "day") {
                          final int temp;
                          temp = widget.month + 1;
                          if (temp == 1 ||
                              temp == 3 ||
                              temp == 5 ||
                              temp == 7 ||
                              temp == 8 ||
                              temp == 10 ||
                              temp == 12) {
                            if (int.parse(statefulInitialValue) > 31) {
                              statefulInitialValue = (1).toString();
                            }
                            if (int.parse(statefulInitialValue) < 1) {
                              statefulInitialValue = (31).toString();
                            }
                          } else if (temp == 2) {
                            if (int.parse(widget.year) % 4 == 0) {
                              if (int.parse(widget.year) % 400 != 0) {
                                if (int.parse(statefulInitialValue) > 29) {
                                  statefulInitialValue = (1).toString();
                                }
                                if (int.parse(statefulInitialValue) < 1) {
                                  statefulInitialValue = (29).toString();
                                }
                              }
                            } else {
                              if (int.parse(statefulInitialValue) > 28) {
                                statefulInitialValue = (1).toString();
                              }
                              if (int.parse(statefulInitialValue) < 1) {
                                statefulInitialValue = (28).toString();
                              }
                            }
                          } else {
                            if (int.parse(statefulInitialValue) > 30) {
                              statefulInitialValue = (1).toString();
                            }
                            if (int.parse(statefulInitialValue) < 1) {
                              statefulInitialValue = (30).toString();
                            }
                          }
                        }
                      });
                    },
          child: const Icon(
            Icons.keyboard_arrow_down,
            size: 40,
            color: Color(0xffa6a6a6),
          ),
        ),
      ],
    );
  }
}

class Records extends StatelessWidget {
  const Records(
      {super.key,
      required this.BMI,
      required this.status,
      required this.date,
      required this.time,
      required this.gender,
      required this.age,
      required this.height,
      required this.weight,
      required this.healthyweight1,
      required this.healthyweight2,
      required this.index});
  final String BMI;
  final String status;
  final String date;
  final String time;
  final String gender;
  final String age;
  final String height;
  final String weight;
  final String healthyweight1;
  final String healthyweight2;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
            color: Color(0xFFEDEDEB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container()),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            BMI: double.parse(BMI),
                            gender: gender,
                            age: age,
                            date: date,
                            healthyweight1: healthyweight1,
                            healthyweight2: healthyweight2,
                            weight: weight,
                            height: height,
                            index: index,
                          )));
            },
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        BMI,
                        style: TextStyle(
                          fontFamily: "LeagueSpartan",
                          fontWeight: FontWeight.w300,
                          fontSize: 30,
                          color: double.parse(BMI) < 18.5
                              ? Color(0xff87ADC7)
                              : double.parse(BMI) < 25.0
                                  ? Color(0xff70C099)
                                  : double.parse(BMI) < 30.0
                                      ? Color(0xffF9D230)
                                      : double.parse(BMI) < 35
                                          ? Color(0xffEF9852)
                                          : double.parse(BMI) < 40
                                              ? Color(0xffDF434A)
                                              : Color(0xffBD2B37),
                        ),
                      ),
                      Text(
                        status,
                        style: TextStyle(
                          fontFamily: "LeagueSpartan",
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: double.parse(BMI) < 18.5
                              ? Color(0xff87ADC7)
                              : double.parse(BMI) < 25.0
                                  ? Color(0xff70C099)
                                  : double.parse(BMI) < 30.0
                                      ? Color(0xffF9D230)
                                      : double.parse(BMI) < 35
                                          ? Color(0xffEF9852)
                                          : double.parse(BMI) < 40
                                              ? Color(0xffDF434A)
                                              : Color(0xffBD2B37),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                            fontFamily: "LeagueSpartan",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                            fontFamily: "LeagueSpartan",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 40,
                    color: Color(0xffa6a6a6),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.BMI,
      required this.gender,
      required this.age,
      required this.date,
      required this.healthyweight1,
      required this.healthyweight2,
      required this.weight,
      required this.height,
      required this.index});
  final double BMI;
  final String gender;
  final String age;
  final String date;
  final String healthyweight1;
  final String healthyweight2;
  final String weight;
  final String height;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Record $index",
                  style: TextStyle(
                    fontFamily: "LeagueSpartan",
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                    color: Colors.black,
                  ),
                )
              ],
            ),
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
                      backgroundImage: AssetImage("lib/assets/images/bmi.png"),
                      startAngle: 180,
                      endAngle: 360,
                      minimum: 15.0,
                      maximum: 45.0,
                      pointers: <GaugePointer>[
                        NeedlePointer(
                            value: BMI < 25 && BMI > 18.4
                                ? 24.9 - ((24.9 - BMI) / (6.4 / 4.9))
                                : BMI < 18.5 && BMI > 15
                                    ? 15 + ((BMI - 15) / (3.4 / 4.9))
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
                                                    ? Color(0xffF9D230)
                                                    : BMI < 35
                                                        ? Color(0xffEF9852)
                                                        : BMI < 40
                                                            ? Color(0xffDF434A)
                                                            : Color(0xffBD2B37),
                                        fontWeight: FontWeight.w400))),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$gender | ${age}y/o | ${height}cm | ${weight}kg",
                                style: const TextStyle(
                                    fontFamily: "LeagueSpartan",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  const Text(
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
                                          ? const Color(0xff87ADC7)
                                          : BMI < 25.0
                                              ? const Color(0xff70C099)
                                              : BMI < 30.0
                                                  ? const Color(0xffF9D230)
                                                  : BMI < 35
                                                      ? const Color(0xffEF9852)
                                                      : BMI < 40
                                                          ? const Color(
                                                              0xffDF434A)
                                                          : const Color(
                                                              0xffBD2B37),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    "Calculation Date",
                                    style: TextStyle(
                                        fontFamily: "LeagueSpartan",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color(0xffa6a6a6)),
                                  ),
                                  Text(
                                    date,
                                    style: const TextStyle(
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    "Healthy Weight for You",
                                    style: TextStyle(
                                        fontFamily: "LeagueSpartan",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color(0xffa6a6a6)),
                                  ),
                                  Text(
                                    "${healthyweight1}kg - ${healthyweight2}kg",
                                    style: const TextStyle(
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
                  SizedBox(
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
                              Navigator.pop(context);
                            },
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Close",
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
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
