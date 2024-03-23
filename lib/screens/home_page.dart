import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kmrapp/screens/location.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 2;
    return Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(top: 0, bottom: 14),
          children: [
            Container(
              width: double.infinity,
              height: 320,
              decoration: const BoxDecoration(
                  color: Color(0xffDFCEFA),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'lib/assets/images/3.png',
                    width: 150,
                    height: 150,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LocationPage()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 75,
                        alignment: Alignment.center,
                        child: Text(
                          'Reach Us',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xff966FD6),
                            borderRadius: BorderRadius.circular(10)),
                      )),
                  Text(
                    'Hi, User!',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff966FD6)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Container(
                width: double.infinity,
                height: 150,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                decoration: BoxDecoration(
                    color: const Color(0xff966FD6),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('DR IMAGE'),
                    const ClipRect(
                        // child: Image.asset('', width:45px),
                        ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Dr. whatever name',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const Text(
                          'whatever position',
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 6),
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            children: [
                              Icon(
                                Ionicons.calendar_outline,
                                size: 17,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 14, right: 6),
                                child: Text(
                                  'Today',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8, left: 6),
                                child: Icon(
                                  Ionicons.time_outline,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '14:30 - 15:30',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: Container(
              color: Color(0xffDFCEFA),
              child: BottomNavigationBar(
                backgroundColor: Color(0xffDFCEFA),
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: index,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Ionicons.thumbs_up_outline), label: 'Review'),
                  BottomNavigationBarItem(
                      icon: Icon(Ionicons.scale_outline), label: 'BMI'),
                  BottomNavigationBarItem(
                      icon: Icon(Ionicons.home_outline), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Ionicons.document_text_outline),
                      label: 'TCA & BSSK'),
                  BottomNavigationBarItem(
                      icon: Icon(Ionicons.person_outline), label: 'Profile')
                ],
                onTap: (index) {
                  if (index == 0) {
                  } else if (index == 1) {
                  } else if (index == 2) {
                  } else if (index == 3) {
                  } else if (index == 4) {}
                },
              ),
            )));
  }
}
