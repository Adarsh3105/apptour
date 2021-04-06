import 'package:apptour/drawer.dart';
import 'package:apptour/search.dart';
import 'package:flutter/material.dart';
import 'showcase.dart';
import 'showcase_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final one = GlobalKey();
  final two = GlobalKey();
  final three = GlobalKey();
  final four = GlobalKey();
  final five = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  int counter = 0;
   bool finished=false;

   @override
   void initState() { 
     super.initState();
     
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Center(
        child: Builder(
          builder: (BuildContext context) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => ShowCaseWidget.of(context)
                  .startShowCase([one, two, three, four, five]),
            );
            return Icon(Icons.west_rounded);
          },
        ),
      ),
      appBar: AppBar(
        title: Showcase.withWidget(
          shapeBorder: CircleBorder(),
          height: 100,
          width: 100,
          container: Container(),
          //description: '',
          key: one,
          //showArrow: false,
          centerText: 'Welcome to \n App Tour',
          child: Text('  App Tour  '),
        ),
        actions: [
          Showcase(
            //centerText: 'Haan tu bhi',
            showArrow: false,
            key: two,
            description:
                'I walk a lonely road The only one that I have ever known Dont know where it goes But its home to me, and I walk alone',
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ),
                ),
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            TextButton(
              child: Text('Menu Item'),
              onPressed: null,
            ),
            TextButton(
              child: Text('Menu Item'),
              onPressed: null,
            ),
            TextButton(
              child: Text('Menu Item'),
              onPressed: null,
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          BottomNavigationBar(currentIndex: 1, items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Showcase.withWidget(
              height: 100,
              width: 100,
              container: Container(
                height: 100,
                width: 100,
                child: TextButton(
                  child: Text('Next'),
                  onPressed: ()=>{
                    scaffoldkey.currentState.openDrawer(),
                    //ShowCase
                  },
                ),
              ),
              //centerText: 'Ek aur',
              //showArrow: false,
              key: five,
              // onTargetClick: () => {Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => Search(),
              //     ),
              //   ),},
              // disposeOnTap: false,
              description: 'Thandi hawa',
              descTextStyle: TextStyle(color: Colors.blue, fontSize: 15),
              title: 'Voltas',
              child: Icon(Icons.ac_unit),
            ),
            label: 'Air'),
        BottomNavigationBarItem(
            icon: Showcase.withWidget(
                width: 100,
                height: 100,
                container: Column(
                  children: [
                    Text(
                      'Click to access settings',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Container(
                      //color: Colors.blue,
                      height: 200,
                      width: 200,
                      child: CustomPaint(
                        painter: Arrow(),
                      ),
                    ),
                  ],
                ),
                key: four,
                description: 'Click for to change settings',
                child: Icon(Icons.settings)),
            label: 'Settings'),
        BottomNavigationBarItem(
            icon: Showcase(
                //centerText: 'Ekasdsaa',
                textColor: Colors.white,
                showcaseBackgroundColor: Colors.black.withOpacity(0.0075),
                showArrow: false,
                key: three,
                description: 'Ek aur random button',
                child: Icon(Icons.tab)),
            label: 'Tab')
      ]
              // child: Icon(Icons.settings),
              // color: Colors.blue,
              ),
    );
  }
}

class Arrow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint();
    var path = Path();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 4;
    paint.color = Colors.white;
    path.moveTo(size.width / 2, 0);
    path.quadraticBezierTo(size.width * 0.90, size.height * 0.30,
        size.width * 0.62, size.height * 0.36);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.45,
        size.width * 0.18, size.height * 0.70);
    path.moveTo(size.width * 0.09, size.height * 0.67);
    path.quadraticBezierTo(size.width * 0.14, size.height * 0.68,
        size.width * 0.17, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.22, size.height * 0.68,
        size.width * 0.28, size.height * 0.67);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

