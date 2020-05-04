import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Local Notification'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var initializeSettingsAndroid;
  var initializeSettingsIOS;
  var initializeSettings;

  int _counter = 0;

  var vibrationPattern = new Int64List(4);
  


  @override
  void initState() {
    super.initState();

    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 5000;
    vibrationPattern[3] = 2000;

    initializeSettingsAndroid = AndroidInitializationSettings('@drawable/ic_stat_adb');
    initializeSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: (int id, String title, String body, String payload) async {
          print('Received a notification');
        });
        initializeSettings = InitializationSettings(initializeSettingsAndroid, initializeSettingsIOS); 
        _flutterLocalNotificationsPlugin.initialize(initializeSettings,
          onSelectNotification: (String payload) async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => SecondPage())
            );
          }
        );
        _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>().requestPermissions(
          alert: true,
          badge: true,
          sound: true
        )
          .then((value) async => print('result: $value'));
  
  }

  _onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
        return CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('Ok'),
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop();
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => SecondPage())
            );
          },
        );
      }

  Future<void> _notifyMe() async {
     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        color: Colors.green,
        timeoutAfter: 5,
        vibrationPattern: vibrationPattern,
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      presentAlert: true
    );
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      await _flutterLocalNotificationsPlugin.show(
        0, 'Hey, te uma notificação aqui', 'Você tem um novo pedido', platformChannelSpecifics,
        payload: 'item x');

    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 5));

      await _flutterLocalNotificationsPlugin.schedule(
        0, 'Hey, te uma notificação aqui', 'Você tem um novo pedido', scheduledNotificationDateTime, platformChannelSpecifics,
        payload: 'item x');
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _notifyMe,
        tooltip: 'Increment',
        child: Icon(Icons.notifications),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda página'),
      ),
    );
  }
}
