import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TCABSSKPage extends StatefulWidget {
  const TCABSSKPage({super.key});
  static final List<Map<String, dynamic>> questions = [
    {
      "text": "Full Name",
      "child": FormBuilderTextField(
        name: 'fullname',
      )
    },
    {
      "text": "Full Name",
      "child": FormBuilderTextField(
        name: 'fullname',
      )
    },
    {
      "text": "Full Name",
      "child": FormBuilderTextField(
        name: 'fullname',
      )
    },
  ];

  @override
  State<TCABSSKPage> createState() => _TCABSSKPageState();
}

class _TCABSSKPageState extends State<TCABSSKPage> {
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
                Tab(text: "TCA"),
                Tab(text: "BSSK"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontFamily: "LeagueSpartan",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "This form consists of 12 sections "),
                                TextSpan(
                                    text: "(A - L).",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold))
                              ]),
                        ),
                        Text(
                          "Please fill in your information in each section accordingly.",
                          style: TextStyle(
                              fontFamily: "LeagueSpartan",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.1),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15, left: 4, right: 4),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Color(0xffd9d9d9), width: 3)),
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                padding: EdgeInsets.only(top: 30),
                                constraints: BoxConstraints(maxHeight: 300),
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: TCABSSKPage.questions.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 20,
                                                child: Text("${index + 1})"),
                                              ),
                                              Text(TCABSSKPage.questions[index]
                                                  ['text']),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: TCABSSKPage.questions[index]
                                                ['child'],
                                          )
                                        ],
                                      );
                                    }),
                              )),
                        ),
                        Card(
                            color: Color(0xFFededeb),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Text("A. BIODATA"),
                              width: MediaQuery.of(context).size.width * 0.8,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
