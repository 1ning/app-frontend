import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_circular_slider/flutter_circular_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Color.fromARGB(255, 104, 75, 182),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF380E4A),
                Color(0xFFE87461),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: weightpage()),
    ));
  }
}

class weightpage extends StatefulWidget {
  @override
  _weightpageState createState() => _weightpageState();
}

class _weightpageState extends State<weightpage> {
  final baseColor = Color(0xFFE87461);

  int initWeight = 0;
  int inWeight = 0;

  @override
  void initState() {
    super.initState();
    _shuffle();
  }

//Initialized values
  void _shuffle() {
    setState(() {
      initWeight = 0;
      inWeight = initWeight;
    });
  }

//Functions called when the button is slid
  void _updateLabels(int init, int end, int b) {
    setState(() {
      inWeight = end;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: kToolbarHeight,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const LinearProgressIndicator(
                    value: 0.5,
                    valueColor: AlwaysStoppedAnimation(
                      Color(0xFFE87461),
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Text(
                    'Next',
                    style: TextStyle(color: Color(0xFFE87461), fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
          child: Text(
            'What is your height ?',
            style: TextStyle(
              color: Color(0xFFE87461),
            ),
          ),
        ),
        SingleCircularSlider(
          288,
          initWeight,
          height: 180.0,
          width: 210.0,
          showRoundedCapInSelection: false,
          baseColor: Color.fromARGB(255, 46, 45, 45),
          selectionColor: baseColor,
          handlerColor: Color.fromARGB(255, 0, 0, 0),
          handlerOutterRadius: 2.0,
          onSelectionChange: _updateLabels,
          sliderStrokeWidth: 20.0,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('${_formatIntervalWeight(inWeight)}',
                  style: TextStyle(fontSize: 40.0, color: Colors.white)),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text('CM',
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
              ),
            ]),
          ),
        ),
        //Jump button
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 28, 8, 8),
            child: ElevatedButton(
              onPressed: () {
                print('Pressed');
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(180, 40),
                primary: Color(0xFF7265E3),
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: []),
      ],
    );
  }

//Output the changed weight value
  String _formatIntervalWeight(int init) {
    var Weight = init;
    return '${Weight}';
  }
}
