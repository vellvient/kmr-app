import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'lib/assets/images/profile.png',
            width: 200,
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  leadingWidth: 0,
                  toolbarHeight: 0,
                  bottom: MyTabBar(
                    child: TabBar(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.05,
                          0,
                          MediaQuery.of(context).size.width * 0.05,
                          0),
                      tabs: [
                        Tab(text: "Details"),
                        Tab(text: "Ongoing Appointments"),
                        Tab(text: "Past Appointments"),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              labelText: 'Full Name',
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 30),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                labelText: 'IC Number'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              labelText: 'Phone Number',
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 30),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                labelText: 'E-mail'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 50),
                              decoration: BoxDecoration(
                                color: Colors.red[600],
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text('12/03/24 | 2:00 PM - 3:00 PM'),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    color: Color(0xFFC7E9E6),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          width: 60,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 64, 255, 191),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Icon(
                                            Ionicons.person,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Klinik Mesra Remaja ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              ' KK Kota Putera',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('12/03/24 | 2:00 PM - 3:00 PM'),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    color: Color(0xFFC7E9E6),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          width: 60,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 64, 255, 191),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Icon(
                                            Ionicons.person,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Klinik Mesra Remaja ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              ' KK Kota Putera',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text('12/03/24 | 2:00 PM - 3:00 PM'),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    color: Color(0xFFC7E9E6),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 60,
                                          padding: EdgeInsets.all(5),
                                          width: 60,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 64, 255, 191),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Icon(
                                            Ionicons.person,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Klinik Mesra Remaja ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              ' KK Kota Putera',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
