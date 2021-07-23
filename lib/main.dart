import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magic_site/pages/trial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      routes: {
        '/': (context) => Trial(),
        "/home": (context) => Home(),
      },
      initialRoute: "/",
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  double l1PositionH = 9000;
  double l1PositionV = 90;
  double l1Size = 15;
  double l1Speed = 0.01;
  double l21Position = -2000;
  double l21Size = 2;
  double l21Speed = 1;
  double l22Position = -2000;
  double l22Size = 1.3;
  double l22Speed = 2.6;
  double l23Position = -2000;
  double l23Size = 2;
  double l23Speed = 4;
  double l3Position = -3000;
  double l3Size = 0.5;
  double l3Speed = 1;
  double l4Position = -3000;
  double l4Size = 0.65;
  double l4Speed = 1;
  double l5Position = -3000;
  double l5Size = 0.9;
  double l5Speed = 1;
  double l6Position = -3000;
  double l6Size = 3;
  double l6Speed = 1;
  double l7Position = -3000;
  double l7Size = 12;
  double l7Speed = 1;
  double fontsize = 60;
  double scrollAmount = 0;
  double startTimer = 0;
  bool showBegin = false;
  bool blast = false;
  int cometSpeed = 100;

  int i = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final _tictoc = ValueNotifier<Timer>(Timer.periodic(Duration(milliseconds: cometSpeed), (timer) {
      _counter.value += 1;
    }));
  }

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
    double cSize = sWidth / 4 > 250 ? 250 : sWidth / 4;
    double totalScroll = sHeight * 1;
    double setScroll = sHeight * 2;

    return Scaffold(
      body: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
            debugPrint(v.toString());
            debugPrint(v.metrics.pixels.toString());
            debugPrint(sHeight.toString());

            setState(() {
              scrollAmount += v.scrollDelta.abs();

              if (scrollAmount < totalScroll * 5) {
                l1PositionV = 80 - (v.metrics.pixels * l1Speed);
                l1PositionH = ((sWidth / 6) + (v.metrics.pixels * l1Speed) / 6);

                l3Position = -(cSize / 6) + ((cSize / 6) * (v.metrics.pixels / totalScroll));

                l21Position =
                    (sHeight / 20) - (((sHeight / 20) + (cSize * l21Size)) * (v.metrics.pixels / totalScroll));
                l22Position = (sHeight / 5) - (((sHeight / 5) + (cSize * l22Size)) * (v.metrics.pixels / totalScroll));
                l23Position = (sHeight / 4) - (((sHeight / 4) + (cSize * l23Size)) * (v.metrics.pixels / totalScroll));

                l4Position =
                    -((cSize * l4Size * 2) / 3) + (((cSize * l4Size * 2) / 3) * (v.metrics.pixels / totalScroll));

                l5Position =
                    -((cSize * l5Size * 4) / 3) + (((cSize * l5Size * 4) / 3) * (v.metrics.pixels / totalScroll));

                l6Position =
                    -((cSize * l6Size * 6) / 3) + (((cSize * l6Size * 6) / 3) * (v.metrics.pixels / totalScroll));
              } else {
                showBegin = true;
              }
            });
          }

          return true;
        },
        child: Stack(
          children: [
            //Night
            //Backgroung

            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: sHeight,
                width: sWidth,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "back2.gif",
                    ),
                  ),
                ),
              ),
            ),

            // Layer 1 (Moon)
            Positioned(
              top: l1PositionV,
              left: l1PositionH,
              child: Container(
                width: cSize * 1.3,
                height: cSize * 1.3,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      "moon.png",
                    ),
                  ),
                ),
              ),
            ),

            // layer1.1 (astroid)
            showBegin
                ? ValueListenableBuilder(
                    valueListenable: _counter,
                    builder: (BuildContext context, int value, Widget child) {
                      return Positioned(
                        top: l1PositionV - (cSize / 4),
                        left: l1PositionH + (cSize),
                        child: Container(
                          width: cSize * 1.3,
                          height: cSize * 1.3,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                "comet.gif",
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : SizedBox(),

            // Layer 2 (Clouds)
            // L2.1-1
            Positioned(
              top: l21Position,
              left: 0 * l21Size * (cSize),
              child: Opacity(
                opacity: 0.9,
                child: Container(
                  width: l21Size * cSize,
                  height: l21Size * cSize,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "TC1.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // L2.1-2
            Positioned(
              top: 1.1 * l21Position,
              left: 1.2 * l21Size * (cSize),
              child: Opacity(
                opacity: 0.9,
                child: Container(
                  width: l21Size * cSize,
                  height: l21Size * cSize,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "TC2.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // L2.1-3
            Positioned(
              top: 0.9 * l21Position,
              left: 3 * l21Size * (cSize),
              child: Opacity(
                opacity: 0.9,
                child: Container(
                  width: l21Size * cSize,
                  height: l21Size * cSize,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "TC4.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // L2.1-4
            Positioned(
              top: 0.1 * l21Position,
              left: 4.2 * l21Size * (cSize),
              child: Opacity(
                opacity: 0.9,
                child: Container(
                  width: l21Size * cSize,
                  height: l21Size * cSize,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "TC3.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // L2.1-5
            Positioned(
              top: 0.9 * l21Position,
              left: 5.2 * l21Size * (cSize),
              child: Opacity(
                opacity: 0.9,
                child: Container(
                  width: l21Size * cSize,
                  height: l21Size * cSize,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "TC1.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // L2.2-1
            Positioned(
              top: l22Position,
              left: -0.2 * l22Size * (cSize),
              child: Opacity(
                opacity: 0.85,
                child: Container(
                  width: l22Size * cSize,
                  height: l22Size * cSize,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "TC3.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // L2.2-2
            Positioned(
              top: 0.9 * l22Position,
              left: 1.3 * l22Size * (cSize),
              child: Opacity(
                opacity: 0.85,
                child: Container(
                  width: l22Size * cSize,
                  height: l22Size * cSize,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "TC4.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // L2.2-3
            Positioned(
              top: 1.1 * l22Position,
              left: 2.5 * l22Size * (cSize),
              child: Opacity(
                opacity: 0.85,
                child: Container(
                  width: l22Size * cSize,
                  height: l22Size * cSize,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "TC1.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // L2.2-4
            Positioned(
              top: 1 * l22Position,
              left: 3.7 * l22Size * (cSize),
              child: Opacity(
                opacity: 0.85,
                child: Container(
                  width: l22Size * cSize,
                  height: l22Size * cSize,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "TC2.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Layer 3 (group of trees Tree2)
            Positioned(
              left: 0,
              bottom: l3Position,
              child: Container(
                width: cSize,
                height: cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree2.png",
                    ),
                  ),
                ),
              ),
            ),
            // L3.1
            Positioned(
              left: cSize,
              bottom: l3Position,
              child: Container(
                width: cSize,
                height: cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree2.png",
                    ),
                  ),
                ),
              ),
            ),
            //L 3.2
            Positioned(
              left: 2 * (cSize),
              bottom: l3Position,
              child: Container(
                width: cSize,
                height: cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree2.png",
                    ),
                  ),
                ),
              ),
            ),
            // L 3.3
            Positioned(
              left: 3 * (cSize),
              bottom: l3Position,
              child: Container(
                width: cSize,
                height: cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree2.png",
                    ),
                  ),
                ),
              ),
            ),
            // L 3.4
            Positioned(
              left: 4 * (cSize),
              bottom: l3Position,
              child: Container(
                width: cSize,
                height: cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree2.png",
                    ),
                  ),
                ),
              ),
            ),
            // L 3.5
            Positioned(
              left: 5 * (cSize),
              bottom: l3Position,
              child: Container(
                width: cSize,
                height: cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree2.png",
                    ),
                  ),
                ),
              ),
            ),
            // L 3.6
            Positioned(
              left: 6 * (cSize),
              bottom: l3Position,
              child: Container(
                width: cSize,
                height: cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree2.png",
                    ),
                  ),
                ),
              ),
            ),

            // L 4 ( Tree 1)
            // l 4.1
            Positioned(
              left: 0 * l4Size * (cSize),
              bottom: l4Position,
              child: Container(
                width: l4Size * cSize,
                height: l4Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree1.png",
                    ),
                  ),
                ),
              ),
            ),
            // l 4.2
            Positioned(
              left: 0.9 * l4Size * (cSize),
              bottom: l4Position,
              child: Container(
                width: l4Size * cSize,
                height: 1.1 * l4Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree3.png",
                    ),
                  ),
                ),
              ),
            ),
            // l 4.3
            Positioned(
              left: 1.5 * l4Size * (cSize),
              bottom: l4Position,
              child: Container(
                width: l4Size * cSize,
                height: 0.9 * l4Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree1.png",
                    ),
                  ),
                ),
              ),
            ),
            // l 4.4
            Positioned(
              left: 2.2 * l4Size * (cSize),
              bottom: l4Position,
              child: Container(
                width: l4Size * cSize,
                height: l4Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree1.png",
                    ),
                  ),
                ),
              ),
            ),
            // l 4.5
            Positioned(
              left: 3 * l4Size * (cSize),
              bottom: l4Position,
              child: Container(
                width: l4Size * cSize,
                height: 1.2 * l4Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree3.png",
                    ),
                  ),
                ),
              ),
            ),
            // l 4.6
            Positioned(
              left: 3.6 * l4Size * (cSize),
              bottom: l4Position,
              child: Container(
                width: l4Size * cSize,
                height: l4Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree1.png",
                    ),
                  ),
                ),
              ),
            ),
            // l 4.7
            Positioned(
              left: 4.5 * l4Size * (cSize),
              bottom: l4Position,
              child: Container(
                width: l4Size * cSize,
                height: 0.8 * l4Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree1.png",
                    ),
                  ),
                ),
              ),
            ),
            // l 4.8
            Positioned(
              left: 5.3 * l4Size * (cSize),
              bottom: l4Position,
              child: Container(
                width: l4Size * cSize,
                height: l4Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree1.png",
                    ),
                  ),
                ),
              ),
            ),

            // L 5 ( Tree 1, Tree2)
            // l 5.1
            Positioned(
              left: 0 * l5Size * (cSize),
              bottom: l5Position,
              child: Container(
                width: l5Size * cSize,
                height: l5Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree1.png",
                    ),
                  ),
                ),
              ),
            ),
            // l 5.2
            Positioned(
              left: 0.9 * l5Size * (cSize),
              bottom: l5Position,
              child: Container(
                width: l5Size * cSize,
                height: 1.1 * l5Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree3.png",
                    ),
                  ),
                ),
              ),
            ),
            // l 5.3
            Positioned(
              left: 1.5 * l5Size * (cSize),
              bottom: l5Position,
              child: Container(
                width: l5Size * cSize,
                height: 0.9 * l5Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree1.png",
                    ),
                  ),
                ),
              ),
            ),
            // l 5.4
            Positioned(
              left: 2.2 * l5Size * (cSize),
              bottom: l5Position,
              child: Container(
                width: l5Size * cSize,
                height: l5Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree1.png",
                    ),
                  ),
                ),
              ),
            ),
            // l 5.5
            Positioned(
              left: 3 * l5Size * (cSize),
              bottom: l5Position,
              child: Container(
                width: l5Size * cSize,
                height: 1.2 * l5Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree3.png",
                    ),
                  ),
                ),
              ),
            ),
            // l 5.6
            Positioned(
              left: 3.6 * l5Size * (cSize),
              bottom: l5Position,
              child: Container(
                width: l5Size * cSize,
                height: l5Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree3.png",
                    ),
                  ),
                ),
              ),
            ),
            // l 5.7
            Positioned(
              left: 4.5 * l5Size * (cSize),
              bottom: l5Position,
              child: Container(
                width: l5Size * cSize,
                height: 0.8 * l5Size * cSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "tree1.png",
                    ),
                  ),
                ),
              ),
            ),
            // NAME
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: sHeight / 2,
                width: sWidth,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GlowText(
                        'COSMIC',
                        blurRadius: 4,
                        style: TextStyle(fontSize: fontsize, fontFamily: 'BreatheFire', color: Colors.white70),
                      ),
                      GlowText(
                        '3D view (try scrolling)',
                        blurRadius: 6,
                        style: GoogleFonts.cookie(fontSize: fontsize * 0.3, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Clouds L2.2

            // L2.3-1
            Positioned(
              top: l23Position,
              left: 0.1 * l23Size * (cSize),
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  width: l23Size * cSize,
                  height: l23Size * cSize,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "TC2.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // L2.3-2
            Positioned(
              top: 1.1 * l23Position,
              left: 1.15 * l23Size * (cSize),
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  width: l23Size * cSize,
                  height: l23Size * cSize,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "TC1.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // L2.3-3
            Positioned(
              top: 1 * l23Position,
              left: 2 * l23Size * (cSize),
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  width: l23Size * cSize,
                  height: l23Size * cSize,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "TC3.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // L2.3-4
            Positioned(
              top: 1 * l23Position,
              left: 3.2 * l23Size * (cSize),
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  width: l23Size * cSize,
                  height: l23Size * cSize,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "TC4.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // BOY
            Positioned(
              right: 0,
              bottom: l6Position,
              child: Container(
                width: (cSize * l6Size * 0.7742),
                height: (cSize * l6Size),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "foreground.png",
                    ),
                  ),
                ),
              ),
            ),

            // layer1.2 (blast)
            blast
                ? ValueListenableBuilder(
                    valueListenable: _counter,
                    builder: (BuildContext context, int value, Widget child) {
                      return Positioned(
                        top: l1PositionV,
                        left: l1PositionH,
                        child: Container(
                          width: cSize * 1.3,
                          height: cSize * 1.3,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                "explosion.gif",
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : SizedBox(),
            // LISTVIEW
            Container(
              height: sHeight,
              child: ListView(
                children: [
                  Container(
                    color: Colors.transparent,
                    height: setScroll,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
