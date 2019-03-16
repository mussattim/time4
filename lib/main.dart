import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Time Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Time Demo MIA'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double opacity = 1.0;
  bool visible = false;
  bool visible1 = true;
  bool plusOneVisible = false;
  bool plusOneEnabled = true;

  String _timeString;
  int counter = 0;
  int counter2 = 0;
  int doneno = -1;

  //int counter = int.parse(_myTextController1.text);
  String counter1 = "0";

  //final DateTime arrtime = DateTime.now().add(new Duration(hours: 1));
  //final DateTime arrtime = DateTime.now().toLocal();
  final DateTime arrtime = DateTime.now();

  /*var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(now);
  print(formattedDate); // 2016-01-25*/

  /*var berlinWallFell = new DateTime.utc(1989, DateTime.november, 9);
  var dDay = new DateTime.utc(1944, DateTime.june, 6);

  Duration difference = berlinWallFell.difference(dDay);
  assert(difference.inDays == 16592);*/

  //per l'input
  final _myTextController = new TextEditingController();
  final _myTextController1 = new TextEditingController();
  String _testData = "0";
  String _testData1 = "0";

  // gestore del'invisibiltà
  bool _visible = true;

  void _testOutput() {
    setState(() {
      _testData = _myTextController.text;
      _testData1 = _myTextController1.text;
      setState(() {
        _visible = false;
        visible = true;
        visible1 = false;
        plusOneVisible = true;
        counter1 = _testData1;
        //int counter = int.parse(_myTextController1.text);
      });
    });
  }

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      //counter = int.parse(counter);
      //counter++;
      int counter = int.parse(counter1);

      counter++;
      String counter2 = counter.toString();
      counter1 = counter2;
    });

    void miafunzione2(String counter1) {
      if (_testData != counter1) {
        // se numero attuale = mio numero
        print("deve essere true");
      } else {
        plusOneEnabled = false;
        plusOneVisible = false;

        print("questo non lo devo vedere");
      }
      print(counter1);
      print(_testData);
      print(plusOneEnabled);
    }

    miafunzione2(counter1);
  }

  @override
  Widget build(BuildContext ctxt) {
    final Size screenSize = MediaQuery.of(context).size;

    // ora orrivi, attuale e tempo mancante
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss').format(now);
    String formattedDate1 = DateFormat('kk:mm:ss').format(arrtime);
    var differenza = DateTime.now().difference(arrtime);
    var donesec_all = (differenza.inSeconds).toString();
    var donemin = differenza.inMinutes.toString();
    var donesec =
        (differenza.inSeconds - (60 * differenza.inMinutes)).toString();

    // numeri mancanti
    var missno_n = (int.parse(_testData) - int.parse(counter1));
    String missno = missno_n.toString();

    // numeri passati
    var doneno_real = (int.parse(counter1) - int.parse(_testData1));
    var doneno = (int.parse(counter1) - int.parse(_testData1) + 1);

    // tempo medio (parte da 0)
    //var mtime = int.parse(donesec_all) / doneno;
    var mtime = (int.parse(donesec_all) / doneno).round();

    // tempo stimato
    var estwait_n = mtime * missno_n;
    int estwait_int = estwait_n.toInt();
    var estwait_hour = (estwait_n / 3600).toInt();
    var estwait_min = ((estwait_n - (estwait_hour * 3600)) / 60).toInt();
    var estwait_sec =
        (estwait_n - ((estwait_hour * 3600) + (estwait_min * 60))).toInt();

    // orario stimato
    var esthour = now.add(new Duration(seconds: estwait_int));
    String esthour_fmt = DateFormat('kk:mm:ss').format(esthour);

    // percentuale
    miafunzione(int doneno) {
      if (doneno == 1) {
        int percent_text = 0;
        return percent_text;
      } else {
        double percent_text = ((100 * doneno) /
            (1 + (int.parse(_testData) - int.parse(_testData1))));
        return percent_text;
      }
    }

    miafunzione1(int doneno) {
      if (doneno == 1) {
        double percent = 0.0;
        return percent;
      } else {
        double percent = (((100 * doneno) /
                (1 + (int.parse(_testData) - int.parse(_testData1)))) /
            100);
        return percent;
      }
    }

    larghbox(int missno_n) {
      double missno_n_double = missno_n.toDouble();
      double x = missno_n_double * 16;
      print(x);
      return x;
    }

    var percent_text = miafunzione(doneno).toInt();
    var percent = miafunzione1(doneno);

    /**
        print("-----");
        print("counter1 = "+counter1);
        print("_testData = "+_testData);
        print("_testData1 = "+_testData1);
        print(doneno);
        print(doneno_real);
        print(percent_text);
        print(percent);


        var b=doneno;
        print("=====");
        print (b);
        if (b is int) {
        print("intero");
        }
        if (b is double) {
        print("doubble");
        }
        if (b is num) {
        print("num");
        }
     */ //tester

    return new Scaffold(
      backgroundColor: Colors.white,
/*
        appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text(
          "AttilApp",
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28.0, color: Colors.black),
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search, size: 38, color: Colors.black),
              onPressed: null)
        ],
      ),
*/

      body: new Container(
          child: Center(
        child: new Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                //padding: const EdgeInsets..symmetric(vertical: 20.0),
                child: new Text(
                  "Queue Waiting Time ",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.red[900]),
                ),
              ),
            ),
            //QWT

            // tre modi per inserire un'immagine
            // ---------------------------------
            //new Image(image: new AssetImage("assets/cobo_digital_II_sfo_85.gif")),

            /*new Image(
              image: new AssetImage("assets/people.jpg"),
              width: 220.0,
              fit: BoxFit.scaleDown,
              filterQuality: FilterQuality.high,
            ),
            */

            //new MyExploreWidget(),
            // ---------------------------------

            visible
                ? Padding(
                    padding: const EdgeInsets.all(0.0),
                    /*child: Opacity(
                  opacity: _visible ? 0.0 : 1.0,*/
                    child: new Image(
                      image: new AssetImage("assets/people.jpg"),
                      width: 140.0,
                      fit: BoxFit.scaleDown,
                      filterQuality: FilterQuality.high,
                    ),
                  )
                : Container(),

            visible
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    /*child: Opacity(
                  opacity: _visible ? 0.0 : 1.0,*/
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text("Ora arrivo"),
                                Text(
                                  formattedDate1,
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Tempo trascorso"),
                                Text(
                                  "$donemin:$donesec",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Ora attuale"),
                                Text(
                                  formattedDate,
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                      color: Colors.red),
                                ),
                              ],
                            )
                          ]),
                    ) /*),*/
                    )
                : Container(),
            //row1

            visible
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    /*child: Opacity(
                  opacity: _visible ? 0.0 : 1.0,*/
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text("Numeri passati"),
                                Text(
                                  "$doneno_real",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Numeri mancanti"),
                                Text(
                                  "$missno",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Mio numero"),
                                Text(
                                  _testData,
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                      color: Colors.red),
                                ),
                              ],
                            )
                          ]),
                    ) /*),*/
                    )
                : Container(),
            //row2

            visible
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    /*child: Opacity(
                opacity: _visible ? 0.0 : 1.0,*/
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text("Tempo medio"),
                                Text(
                                  "$mtime",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Tempo attesa stimato"),
                                Text(
                                  //"$estwait_n",
                                  "$estwait_hour:$estwait_min:$estwait_sec",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Ora Stimata"),
                                Text(
                                  "$esthour_fmt",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                          ]),
                    ),
                    /*),*/
                  )
                : Container(),
            //row3

            plusOneVisible
                ? Padding(
                    padding: const EdgeInsets.all(0.0),

                    // RAISED BUTTON
                    /*child: new RaisedButton(
                        child: const Text("+1",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold)),
                        color: Theme.of(context).accentColor,
                        elevation: 6.0,
                        splashColor: Colors.blueGrey,
                        onPressed: (_incrementCounter)
                        ),//RAISED BUTTON
                    */

                    // FLOATING ACTION BUTTON EXTENDED
                    child: new FloatingActionButton.extended(
                      //backgroundColor: Colors.redAccent,
                      backgroundColor: Colors.blueAccent,
                      //onPressed: () => {},
                      //onPressed: (_incrementCounter),

                      //onPressed: (() => plusOneEnabled ? _incrementCounter : null),
                      onPressed: plusOneEnabled ? _incrementCounter : null,

                      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      icon: Icon(Icons.add),
                      label: Text("1",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold)),
                    ),

                    // FLOATING BUTTON STANDARD
                    /*child: new FloatingActionButton(
              backgroundColor: Colors.blueAccent,
              onPressed: (_incrementCounter),
              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                child: Icon(Icons.add,),)
                */
                  )
                : Container(),
            // bottone +1

            visible
                ? Padding(
                    padding: const EdgeInsets.all(0.0),
                    /*child: Opacity(
                opacity: _visible ? 0.0 : 1.0,*/
                    child: new Text('$counter1',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 68.0,
                            fontWeight: FontWeight.bold)),
                    /*),*/
                  )
                : Container(),
            // numero in corso

/*
            new Expanded(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Image(
                    image: new AssetImage("assets/man.jpg"),
                    width: 16.0,
                    fit: BoxFit.scaleDown,
                    filterQuality: FilterQuality.high,
                    ),
                  new Image(
                    image: new AssetImage("assets/man.jpg"),
                    width: 16.0,
                    fit: BoxFit.scaleDown,
                    filterQuality: FilterQuality.high,
                    ),
                  new Image(
                    image: new AssetImage("assets/man.jpg"),
                    width: 16.0,
                    fit: BoxFit.scaleDown,
                    filterQuality: FilterQuality.high,
                    ),
                  //stickgenerator(),

        //if (_testData > counter1) {}
                ],
                ),
              ),
            */
            //ominini

            visible1
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    /*child: Opacity(
                  opacity: _visible ? 1.0 : 0.0,*/
                    child: new Text("Inserisci i dati mancanti",
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)))
                : Container(),
            //dati mancanti

            visible1
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    /*child: Opacity(
                opacity: _visible ? 1.0 : 0.0,*/
                    child: new TextField(
                        controller: _myTextController,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          hintText: "Mio numero",
                          icon: new Icon(Icons.text_format),
                          //labelText: "Mio mumero",
                          //labelStyle: new TextStyle(color: Colors.redAccent)
                        ),
                        onSubmitted: (String val) {
                          int.parse(val);
                        }),
                    /*),*/
                  )
                : Container(),
            // text filed mio numero

            visible1
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    /*child: Opacity(
                opacity: _visible ? 1.0 : 0.0,*/
                    child: new TextField(
                      controller: _myTextController1,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        hintText: "Numero in corso",
                        icon: new Icon(Icons.text_format),
                        //labelText: "Numero in corso",
                        //labelStyle: new TextStyle(color: Colors.redAccent)
                      ),
                    ),
                    /*),*/
                  )
                : Container(),
            //// text field numero in corso

            visible1
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    /*child: Opacity(
                opacity: _visible ? 1.0 : 0.0,*/
                    child: new RaisedButton(
                      color: Colors.redAccent,
                      child: new Text("Conferma"),
                      onPressed: _testOutput,
                    ),
                    /*),*/
                  )
                : Container(),
            // bottone conferma

            visible
                ? Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                    child: new LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 50,
                      //animation: false,
                      lineHeight: 25.0,
                      animationDuration: 0,
                      //percent: 0.8,
                      percent: percent,
                      //center: Text("90"),
                      center: Text("$percent_text%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.blueAccent,
                    ),
                  ) //progress bar
                : Container(),
            // progress bar

            new SizedBox(
              width: larghbox(missno_n),
              height: 40.0,
              //child: Text('Hello World!'),
              child: new MyExploreWidget(),
            ),

            /*
            visible
                ? Expanded(
                    //padding: const EdgeInsets.only(top: 10.0),
                    child: new Text(
                      "by Attila, 2019",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.orangeAccent),
                    ),
                  ) // attila
                : Container(),
            // by attila
            */
            // by attila

            new Expanded(
              child: new Align(
                alignment: Alignment.bottomCenter,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[new Text("icons by simpleicon.com")],
                ),
              ),
            ), //by attila
          ],
        ),
      )),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }
}

class MyExploreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/man.jpg');
    //var image = new Image(image: assetsImage, width: 48.0, height: 48.0,repeat: ImageRepeat.repeatX);
    var image = new Image(
      image: assetsImage,
      width: 100.0,
      alignment: Alignment.bottomLeft,
      repeat: ImageRepeat.repeatX,
    );
    return new Container(child: image);
    /*return new Column(
          children: [
          Text("Ora Stimata"),
          ],
          );*/
  }
}
