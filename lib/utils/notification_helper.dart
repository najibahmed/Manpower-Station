import 'dart:io';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'helper_function.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await NotificationService.instance.setupFlutterNotification();
  await NotificationService.instance.showNotification(message);
}

class NotificationService {

  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final _flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();


  Future<void> initialize() async {

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // Request permission
    await requestPermission();

    // Setup message handler
    await setupMessageHandlers();

    // if(await HelperFunction.instance.isInternetConnected()){
    //   String? token = await _messaging.getToken();
    //   print("fcm token-------:  $token");
    // }

    // Get initial FCM token
    await getToken();

    // Listen for token refresh
    isTokenRefresh();
  }

  Future<bool> requestPermission() async {
    final settings = await _messaging.requestPermission(
        provisional: true,
        alert: true,
        announcement: false,
        criticalAlert: false,
        badge: true,
        carPlay: false,
        sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if(kDebugMode){
        print("user granted permission");
      }
      // Subscribe to a topic when initializing
      await subscribeToTopic("general_updates");
      return true;
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
      return false;
    } else {
      if (kDebugMode) {
        print('user denied permission');
      }
      return false;
    }
    print('User granted permission: ${settings.authorizationStatus}');
  }

  /// Fetch the current FCM token
  Future<void> getToken() async {
    try {
      String? token = await _messaging.getToken();
      if (token != null) {
        print("FCM Token: $token");
        // TODO: Send token to your server if necessary
      }
    } catch (e) {
      print("Error getting FCM token: $e");
    }
  }

  void isTokenRefresh()  {
    _messaging.onTokenRefresh.listen((newToken) {
      print("FCM Token Refreshed: $newToken");
      // TODO: Send the updated token to your server if necessary
    }).onError((error) {
      print("Error getting refreshed FCM token: $error");
    });
  }

  /// Subscribe to an FCM topic
  Future<void> subscribeToTopic(String topic) async {

    if(await HelperFunction.instance.isInternetConnected()){
      try {
        await _messaging.subscribeToTopic(topic);
        print("Subscribed to topic: $topic");
      } catch (e) {
        print("Error subscribing to topic: $e");
      }
    }
    else{
      print("No internet can't Subscribed to topic: $topic");
    }
  }

  void handleMessage() {
    print("Message Handled Successfully");
  }

  Future<void> showNotification(RemoteMessage message) async {
    // # 1  android setup
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
      description: "this channel is used for important notification",
      "High Importance Notification",
      importance: Importance.max,
    );

    var androidInitializationSettings =
        const AndroidInitializationSettings("@mipmap/ic_launcher");

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            importance: Importance.high,
            priority: Priority.high,
            ticker: "ticker");

    // #  IOS Setup
    var iosInitializationSettings = const DarwinInitializationSettings();
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentBadge: true,
      presentAlert: true,
      presentSound: true,
    );

    // #2   initialize notification details
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    // #3   initialize settings
    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    // # 4 initialize local notification
    await _flutterLocalNotificationPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
      // # handle interaction when app is active for android
      handleMessage();
    });

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      _flutterLocalNotificationPlugin.show(notification.hashCode,
          notification.title, notification.body, notificationDetails);
    }
  }

  Future<void> setupMessageHandlers() async {
    // foreground message
    try {
      FirebaseMessaging.onMessage.listen((message) {
            RemoteNotification? notification = message.notification;
            AndroidNotification? android = message.notification!.android;

            if (Platform.isIOS) {
              showNotification(message);
              _showDialogNotification(message);
            }

            if (Platform.isAndroid) {
              showNotification(message);
              _showDialogNotification(message);
            }
          });

      // background message
      FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMsg);

      // opened app
      final initialMsg = await _messaging.getInitialMessage();
      if (initialMsg != null) {
            _handleBackgroundMsg(initialMsg);
          }
    } catch (e) {
      print("setup Message Handlers error:$e");
    }
  }

  void _handleBackgroundMsg(RemoteMessage message) {
    print("handle background message");
    if (message.data["Offer"] == 'productId') {
      // open chat
    }
  }

  void _showDialogNotification(RemoteMessage message){
    print("show dialog");
    final context =  Get.context;
    print("context:"+context.toString());
    if(context!= null){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(message.notification!.title ?? "notification"),
        content: Text(message.notification!.body ?? " You have a new message!"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          },
              child: const Text("Close")),
          TextButton(onPressed: (){
            print("Success button or view button");
            Navigator.pop(context);
            // _handleBackgroundMsg(message.data['type']?? "");
          },
              child: const Text("View")),
        ],
      );
    });
    }

  }

}


// Future<void> setupFlutterNotification() async {
//   // # 1  android setup
//   AndroidNotificationChannel channel = AndroidNotificationChannel(
//     Random.secure().nextInt(100000).toString(),
//     description: "this channel is used for important notification",
//     "High Importance Notification",
//     importance: Importance.max,
//   );
//
//   var androidInitializationSettings =
//   const AndroidInitializationSettings("@minmap/ic_launcher");
//
//   AndroidNotificationDetails androidNotificationDetails =
//   AndroidNotificationDetails(
//       channel.id.toString(), channel.name.toString(),
//       importance: Importance.high,
//       priority: Priority.high,
//       ticker: "ticker");
//
//   // #  IOS Setup
//   var iosInitializationSettings = const DarwinInitializationSettings();
//   DarwinNotificationDetails darwinNotificationDetails =
//   const DarwinNotificationDetails(
//     presentBadge: true,
//     presentAlert: true,
//     presentSound: true,
//   );
//
//   // #2   initialize notification details
//   NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails, iOS: darwinNotificationDetails);
//
//   // #3   initialize settings
//   var initializationSetting = InitializationSettings(
//       android: androidInitializationSettings, iOS: iosInitializationSettings);
//
//   // # 4 initialize local notification
//   await _flutterLocalNotificationPlugin.initialize(initializationSetting,
//       onDidReceiveNotificationResponse: (payload) {
//         // # handle interaction when app is active for android
//         // handleMessage();
//       });
// }
/// Lazy techno youtube
/// https://www.youtube.com/watch?v=CCrBHh8TcIE