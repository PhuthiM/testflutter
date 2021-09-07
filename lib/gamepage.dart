import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gamepage extends StatefulWidget {
  const gamepage({Key? key}) : super(key: key);

  @override
  _gamepageState createState() => _gamepageState();
}

class _gamepageState extends State<gamepage> {
  var i = 0;

  bool showred = false;
  bool showblue = true;

  bool showstatus = true;
  bool whowin = true;

  ClickButton(int a) {
    setState(() {
      i += a;
      showred = !showred;
      showblue = !showblue;
      number();
    });
  }

  number() {
    setState(() {
      if (i >= 20) {
        showstatus = false;
        if (!showred) {
          whowin = false;
          showblue = false;
        } else if (showred) {
          whowin = true;
          showblue = false;
          showred = false;
        }
      }
    });
  }

  newgame() {
    setState(() {
      i = 0;
      showred = false;
      showblue = true;
      showstatus = true;
      whowin = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage("assets/images/bg.jpg"),
            fit: BoxFit
                .fill, // ยืดเต็มพื้นที่โดยไม่สนใจสัดส่วนของภาพ หรือใช้ BoxFit.cover เพื่อยืดให้เต็มและคงสัดส่วนของภาพไว้ แต่บางส่วนของภาพอาจถูก crop
          ),
        ),
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 15.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: showred
                            ? ElevatedButton(
                                onPressed:() => ClickButton(3),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                child: Text(
                                  '3',
                                  style: TextStyle(fontSize: 40.0),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: null,
                                child: Text(
                                  '3',
                                  style: TextStyle(fontSize: 40.0),
                                ),
                              ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: showred
                            ? ElevatedButton(
                                onPressed:() => ClickButton(2),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                child: Text(
                                  '2',
                                  style: TextStyle(fontSize: 40.0),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: null,
                                child: Text(
                                  '2',
                                  style: TextStyle(fontSize: 40.0),
                                ),
                              ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: showred
                            ? ElevatedButton(
                                onPressed:() => ClickButton(1),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                child: Text(
                                  '1',
                                  style: TextStyle(fontSize: 40.0),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: null,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                child: Text(
                                  '1',
                                  style: TextStyle(fontSize: 40.0),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                //  SizedBox(width: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        i < 20
                            ? Column(
                                children: [
                                  for (var num = 1; num <= i; num++)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 15.0),
                                      child: Icon(
                                        Icons.star_rate, // รูปไอคอน
                                        size: 20.0, // ขนาดไอคอน
                                        color: Colors.pink, // สีไอคอน
                                      ),
                                    ),
                                  for (var j = 1; j <= 20 - i; j++)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 15.0),
                                      child: Icon(
                                        Icons.star_border, // รูปไอคอน
                                        size: 20.0, // ขนาดไอคอน
                                        color: Colors.pink, // สีไอคอน
                                      ),
                                    ),
                                ],
                              )
                            : Column(
                                children: [],
                              ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: showstatus
                                ? showred
                                    ? Icon(
                                        Icons.keyboard_arrow_up,
                                        size: 100.0,
                                      )
                                    : Icon(
                                        Icons.keyboard_arrow_up,
                                        color: Colors.black12,
                                        size: 100.0,
                                      )
                                : null,
                          ),
                          Center(
                            child: Column(
                              children: [
                                showstatus
                                    ? Text(
                                        i.toString(),
                                        style: TextStyle(fontSize: 100.0),
                                      )
                                    : whowin
                                        ? Text(
                                            'RED\n win!',
                                            style: TextStyle(fontSize: 100.0),
                                          )
                                        : Text(
                                            'BLUE\n win!',
                                            style: TextStyle(fontSize: 100.0),
                                          ),
                                showstatus
                                    ? Column(
                                        children: [],
                                      )
                                    : OutlinedButton(
                                        onPressed: () => newgame(),
                                        child: Text(
                                          'NEW GAME',
                                          style: TextStyle(fontSize: 30.0),
                                        ),
                                      )
                              ],
                            ),
                          ),
                          Center(
                            child: showstatus
                                ? showblue
                                    ? Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 100.0,
                                      )
                                    : Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black12,
                                        size: 100.0,
                                      )
                                : null,
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: showblue
                            ? ElevatedButton(
                                onPressed:() => ClickButton(1),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                                child: Text(
                                  '1',
                                  style: TextStyle(fontSize: 40.0),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: null,
                                child: Text(
                                  '1',
                                  style: TextStyle(fontSize: 40.0),
                                ),
                              ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: showblue
                            ? ElevatedButton(
                                onPressed:() => ClickButton(2),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                                child: Text(
                                  '2',
                                  style: TextStyle(fontSize: 40.0),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: null,
                                child: Text(
                                  '2',
                                  style: TextStyle(fontSize: 40.0),
                                ),
                              ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: showblue
                            ? ElevatedButton(
                                onPressed:() => ClickButton(3),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                                child: Text(
                                  '3',
                                  style: TextStyle(fontSize: 40.0),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: null,
                                child: Text(
                                  '3',
                                  style: TextStyle(fontSize: 40.0),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
