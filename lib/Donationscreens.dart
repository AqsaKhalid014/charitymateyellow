import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class DonateFoodScreen extends StatelessWidget {
  const DonateFoodScreen({super.key});

  Future<String> getAccessToken() async {
    final jsonString = await rootBundle.loadString(
        'assets/charitymate-bc611-firebase-adminsdk-fbsvc-8d75db682f.json');

    final serviceAccountCredentials =
    ServiceAccountCredentials.fromJson(jsonDecode(jsonString));

    final authClient = await clientViaServiceAccount(
      serviceAccountCredentials,
      ['https://www.googleapis.com/auth/firebase.messaging'],
    );

    final accessToken = (await authClient.credentials.accessToken).data;
    return accessToken;
  }

  Future<void> sendRequestNotification(String itemId) async {
    print(" Sending notification for post ID: $itemId");

    try {
      // Step 1: Get the item (donation) document
      final itemDoc = await FirebaseFirestore.instance.collection('Food').doc(
          itemId).get();

      if (!itemDoc.exists) {
        print(" Item document not found for ID: $itemId");
        return;
      }

      final data = itemDoc.data();
      final productName = data?['product_name'];
      final donorId = data?['donorId']; // Make sure you have this field in each document

      if (donorId == null) {
        print(" No donorId found in the document");
        return;
      }

      // Step 2: Get the donor's FCM token
      final donorDoc = await FirebaseFirestore.instance.collection('user').doc(
          donorId).get();
      final donorToken = donorDoc.data()?['fcmToken'];

      if (donorToken == null) {
        print(" No fcmToken found for user ID: $donorId");
        return;
      }

      // Get FCM access token
      final accessToken = await getAccessToken();

      //  Construct and send the notification
      final message = {
        "message": {
          "token": donorToken,
          "notification": {
            "title": "Food Request",
            "body": "Someone requested your item: $productName"
          },
          "data": {
            "itemId": itemId,
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
            "action_accept": "accept_request",
            "action_reject": "reject_request"
          }
        }
      };

      final response = await http.post(
        Uri.parse(
            'https://fcm.googleapis.com/v1/projects/charitymate-bc611/messages:send'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        print(" Notification sent successfully!");
      } else {
        print(" Failed to send notification: ${response.body}");
      }
    } catch (e) {
      print("Error in sendRequestNotification: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate Food'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Food').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return const Center(child: Text('No items to display.'));
          }

          return GridView.count(
            crossAxisCount: 3,
            children: List.generate(docs.length, (index) {
              var data = docs[index];
              var imageUrl = data['image_url'];
              var productName = data['product_name'];
              var location = data['location'];
              var description = data['description'];
              var itemId = data.id;

              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) =>
                        Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(imageUrl),
                                  ),
                                  const SizedBox(height: 12),
                                  Text("Name: $productName",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  Text("Location: $location"),
                                  Text("Description: $description"),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await sendRequestNotification(itemId);
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(content: Text(
                                            'Request sent to donor')),
                                      );
                                    },
                                    child: const Text("Request"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
//define getaccesstoken and send notification function outside the class so don't write again n again

class DonateItemScreen extends StatelessWidget {
 // const DonateItemScreen({super.key});
  Future<String> getAccessToken() async {
    final jsonString = await rootBundle.loadString(
        'assets/charitymate-bc611-firebase-adminsdk-fbsvc-8d75db682f.json');

    final serviceAccountCredentials =
    ServiceAccountCredentials.fromJson(jsonDecode(jsonString));

    final authClient = await clientViaServiceAccount(
      serviceAccountCredentials,
      ['https://www.googleapis.com/auth/firebase.messaging'],
    );

    final accessToken = (await authClient.credentials.accessToken).data;
    return accessToken;
  }

  Future<void> sendRequestNotification(String itemId) async {
    print(" Sending notification for post ID: $itemId");

    try {
      // Step 1: Get the item (donation) document
      final itemDoc = await FirebaseFirestore.instance.collection('other item').doc(
          itemId).get();

      if (!itemDoc.exists) {
        print(" Item document not found for ID: $itemId");
        return;
      }

      final data = itemDoc.data();
      final productName = data?['product_name'];
      final donorId = data?['donorId']; // Make sure you have this field in each document

      if (donorId == null) {
        print(" No donorId found in the document");
        return;
      }

      // Step 2: Get the donor's FCM token
      final donorDoc = await FirebaseFirestore.instance.collection('user').doc(
          donorId).get();
      final donorToken = donorDoc.data()?['fcmToken'];

      if (donorToken == null) {
        print(" No fcmToken found for user ID: $donorId");
        return;
      }

      // Get FCM access token
      final accessToken = await getAccessToken();

      //  Construct and send the notification
      final message = {
        "message": {
          "token": donorToken,
          "notification": {
            "title": "other item Request",
            "body": "Someone requested your item: $productName"
          },
          "data": {
            "itemId": itemId,
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
            "action_accept": "accept_request",
            "action_reject": "reject_request"
          }
        }
      };

      final response = await http.post(
        Uri.parse(
            'https://fcm.googleapis.com/v1/projects/charitymate-bc611/messages:send'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        print(" Notification sent successfully!");
      } else {
        print(" Failed to send notification: ${response.body}");
      }
    } catch (e) {
      print("Error in sendRequestNotification: $e");
    }
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Items'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('other item').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return Center(child: Text('No items to display.'));
          }

          return GridView.count(
            crossAxisCount: 3,
            children: List.generate(docs.length, (index) {
              var data = docs[index];
              var imageUrl = data['image_url'];
              var productName = data['product_name'];
              var location = data['location'];
              var description = data['description'];
              var itemId = data.id;

              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(imageUrl),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Name: $productName",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text("Location: $location"),
                                Text("Description: $description"),
                                ElevatedButton(
                                  onPressed: () async {
                                    await sendRequestNotification(itemId);
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(content: Text(
                                          'Request sent to donor')),
                                    );
                                  },
                                  child: const Text("Request"),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class DonateFurnitureScreen extends StatelessWidget {
  Future<String> getAccessToken() async {
    final jsonString = await rootBundle.loadString(
        'assets/charitymate-bc611-firebase-adminsdk-fbsvc-8d75db682f.json');

    final serviceAccountCredentials =
    ServiceAccountCredentials.fromJson(jsonDecode(jsonString));

    final authClient = await clientViaServiceAccount(
      serviceAccountCredentials,
      ['https://www.googleapis.com/auth/firebase.messaging'],
    );

    final accessToken = (await authClient.credentials.accessToken).data;
    return accessToken;
  }

  Future<void> sendRequestNotification(String itemId) async {
    print(" Sending notification for post ID: $itemId");

    try {
      // Step 1: Get the item (donation) document
      final itemDoc = await FirebaseFirestore.instance.collection('Furniture').doc(
          itemId).get();

      if (!itemDoc.exists) {
        print(" Item document not found for ID: $itemId");
        return;
      }

      final data = itemDoc.data();
      final productName = data?['product_name'];
      final donorId = data?['donorId']; // Make sure you have this field in each document

      if (donorId == null) {
        print(" No donorId found in the document");
        return;
      }

      // Step 2: Get the donor's FCM token
      final donorDoc = await FirebaseFirestore.instance.collection('user').doc(
          donorId).get();
      final donorToken = donorDoc.data()?['fcmToken'];

      if (donorToken == null) {
        print(" No fcmToken found for user ID: $donorId");
        return;
      }

      // Get FCM access token
      final accessToken = await getAccessToken();

      //  Construct and send the notification
      final message = {
        "message": {
          "token": donorToken,
          "notification": {
            "title": "Furniture Request",
            "body": "Someone requested your item: $productName"
          },
          "data": {
            "itemId": itemId,
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
            "action_accept": "accept_request",
            "action_reject": "reject_request"
          }
        }
      };

      final response = await http.post(
        Uri.parse(
            'https://fcm.googleapis.com/v1/projects/charitymate-bc611/messages:send'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        print(" Notification sent successfully!");
      } else {
        print(" Failed to send notification: ${response.body}");
      }
    } catch (e) {
      print("Error in sendRequestNotification: $e");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Furniture'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Furniture').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return Center(child: Text('No items to display.'));
          }

          return GridView.count(
            crossAxisCount: 3,
            children: List.generate(docs.length, (index) {
              var data = docs[index];
              var imageUrl = data['image_url'];
              var productName = data['product_name'];
              var location = data['location'];
              var description = data['description'];
              var itemId = data.id;
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(imageUrl),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Name: $productName",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text("Location: $location"),
                                Text("Description: $description"),
                                ElevatedButton(
                                  onPressed: () async {
                                    await sendRequestNotification(itemId);
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(content: Text(
                                          'Request sent to donor')),
                                    );
                                  },
                                  child: const Text("Request"),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class DonateStationaryScreen extends StatelessWidget {
  Future<String> getAccessToken() async {
    final jsonString = await rootBundle.loadString(
        'assets/charitymate-bc611-firebase-adminsdk-fbsvc-8d75db682f.json');

    final serviceAccountCredentials =
    ServiceAccountCredentials.fromJson(jsonDecode(jsonString));

    final authClient = await clientViaServiceAccount(
      serviceAccountCredentials,
      ['https://www.googleapis.com/auth/firebase.messaging'],
    );

    final accessToken = (await authClient.credentials.accessToken).data;
    return accessToken;
  }

  Future<void> sendRequestNotification(String itemId) async {
    print(" Sending notification for post ID: $itemId");

    try {
      // Step 1: Get the item (donation) document
      final itemDoc = await FirebaseFirestore.instance.collection('Stationery').doc(
          itemId).get();

      if (!itemDoc.exists) {
        print(" Item document not found for ID: $itemId");
        return;
      }

      final data = itemDoc.data();
      final productName = data?['product_name'];
      final donorId = data?['donorId']; // Make sure you have this field in each document

      if (donorId == null) {
        print(" No donorId found in the document");
        return;
      }

      // Step 2: Get the donor's FCM token
      final donorDoc = await FirebaseFirestore.instance.collection('user').doc(
          donorId).get();
      final donorToken = donorDoc.data()?['fcmToken'];

      if (donorToken == null) {
        print(" No fcmToken found for user ID: $donorId");
        return;
      }

      // Get FCM access token
      final accessToken = await getAccessToken();

      //  Construct and send the notification
      final message = {
        "message": {
          "token": donorToken,
          "notification": {
            "title": "Stationary Request",
            "body": "Someone requested your item: $productName"
          },
          "data": {
            "itemId": itemId,
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
            "action_accept": "accept_request",
            "action_reject": "reject_request"
          }
        }
      };

      final response = await http.post(
        Uri.parse(
            'https://fcm.googleapis.com/v1/projects/charitymate-bc611/messages:send'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        print(" Notification sent successfully!");
      } else {
        print(" Failed to send notification: ${response.body}");
      }
    } catch (e) {
      print("Error in sendRequestNotification: $e");
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Stationary'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Stationery').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return Center(child: Text('No items to display.'));
          }

          return GridView.count(
            crossAxisCount: 3,
            children: List.generate(docs.length, (index) {
              var data = docs[index];
              var imageUrl = data['image_url'];
              var productName = data['product_name'];
              var location = data['location'];
              var description = data['description'];
              var itemId= data.id;
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(imageUrl),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Name: $productName",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text("Location: $location"),
                                Text("Description: $description"),
                                ElevatedButton(
                                  onPressed: () async {
                                    await sendRequestNotification(itemId);
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(content: Text(
                                          'Request sent to donor')),
                                    );
                                  },
                                  child: const Text("Request"),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class DonateClothScreen extends StatelessWidget {
  Future<String> getAccessToken() async {
    final jsonString = await rootBundle.loadString(
        'assets/charitymate-bc611-firebase-adminsdk-fbsvc-8d75db682f.json');

    final serviceAccountCredentials =
    ServiceAccountCredentials.fromJson(jsonDecode(jsonString));

    final authClient = await clientViaServiceAccount(
      serviceAccountCredentials,
      ['https://www.googleapis.com/auth/firebase.messaging'],
    );

    final accessToken = (await authClient.credentials.accessToken).data;
    return accessToken;
  }

  Future<void> sendRequestNotification(String itemId) async {
    print(" Sending notification for post ID: $itemId");

    try {
      // Step 1: Get the item (donation) document
      final itemDoc = await FirebaseFirestore.instance.collection('clothes').doc(
          itemId).get();

      if (!itemDoc.exists) {
        print(" Item document not found for ID: $itemId");
        return;
      }

      final data = itemDoc.data();
      final productName = data?['product_name'];
      final donorId = data?['donorId']; // Make sure you have this field in each document

      if (donorId == null) {
        print(" No donorId found in the document");
        return;
      }

      // Step 2: Get the donor's FCM token
      final donorDoc = await FirebaseFirestore.instance.collection('user').doc(
          donorId).get();
      final donorToken = donorDoc.data()?['fcmToken'];

      if (donorToken == null) {
        print(" No fcmToken found for user ID: $donorId");
        return;
      }

      // Get FCM access token
      final accessToken = await getAccessToken();

      //  Construct and send the notification
      final message = {
        "message": {
          "token": donorToken,
          "notification": {
            "title": "Clothe Request",
            "body": "Someone requested your item: $productName"
          },
          "data": {
            "itemId": itemId,
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
            "action_accept": "accept_request",
            "action_reject": "reject_request"
          }
        }
      };

      final response = await http.post(
        Uri.parse(
            'https://fcm.googleapis.com/v1/projects/charitymate-bc611/messages:send'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        print(" Notification sent successfully!");
      } else {
        print(" Failed to send notification: ${response.body}");
      }
    } catch (e) {
      print("Error in sendRequestNotification: $e");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Clothes'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('clothes').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return Center(child: Text('No items to display.'));
          }

          return GridView.count(
            crossAxisCount: 3,
            children: List.generate(docs.length, (index) {
              var data = docs[index];
              var imageUrl = data['image_url'];
              var productName = data['product_name'];
              var location = data['location'];
              var description = data['description'];
              var itemId = data.id;
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(imageUrl),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Name: $productName",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text("Location: $location"),
                                Text("Description: $description"),
                                ElevatedButton(
                                  onPressed: () async {
                                    await sendRequestNotification(itemId);
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(content: Text(
                                          'Request sent to donor')),
                                    );
                                  },
                                  child: const Text("Request"),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class DonateMedicalItemsScreen extends StatelessWidget {
  Future<String> getAccessToken() async {
    final jsonString = await rootBundle.loadString(
        'assets/charitymate-bc611-firebase-adminsdk-fbsvc-8d75db682f.json');

    final serviceAccountCredentials =
    ServiceAccountCredentials.fromJson(jsonDecode(jsonString));

    final authClient = await clientViaServiceAccount(
      serviceAccountCredentials,
      ['https://www.googleapis.com/auth/firebase.messaging'],
    );

    final accessToken = (await authClient.credentials.accessToken).data;
    return accessToken;
  }

  Future<void> sendRequestNotification(String itemId) async {
    print(" Sending notification for post ID: $itemId");

    try {
      // Step 1: Get the item (donation) document
      final itemDoc = await FirebaseFirestore.instance.collection('medical').doc(
          itemId).get();

      if (!itemDoc.exists) {
        print(" Item document not found for ID: $itemId");
        return;
      }

      final data = itemDoc.data();
      final productName = data?['product_name'];
      final donorId = data?['donorId']; // Make sure you have this field in each document

      if (donorId == null) {
        print(" No donorId found in the document");
        return;
      }

      // Step 2: Get the donor's FCM token
      final donorDoc = await FirebaseFirestore.instance.collection('user').doc(
          donorId).get();
      final donorToken = donorDoc.data()?['fcmToken'];

      if (donorToken == null) {
        print(" No fcmToken found for user ID: $donorId");
        return;
      }

      // Get FCM access token
      final accessToken = await getAccessToken();

      //  Construct and send the notification
      final message = {
        "message": {
          "token": donorToken,
          "notification": {
            "title": "Medical Request",
            "body": "Someone requested your item: $productName"
          },
          "data": {
            "itemId": itemId,
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
            "action_accept": "accept_request",
            "action_reject": "reject_request"
          }
        }
      };

      final response = await http.post(
        Uri.parse(
            'https://fcm.googleapis.com/v1/projects/charitymate-bc611/messages:send'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        print(" Notification sent successfully!");
      } else {
        print(" Failed to send notification: ${response.body}");
      }
    } catch (e) {
      print("Error in sendRequestNotification: $e");
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Donate MedicalItems'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('medical').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return Center(child: Text('No items to display.'));
          }

          return GridView.count(
            crossAxisCount: 3,
            children: List.generate(docs.length, (index) {
              var data = docs[index];
              var imageUrl = data['image_url'];
              var productName = data['product_name'];
              var location = data['location'];
              var description = data['description'];
              var itemId=data.id;
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(imageUrl),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Name: $productName",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text("Location: $location"),
                                Text("Description: $description"),
                                ElevatedButton(
                                  onPressed: () async {
                                    await sendRequestNotification(itemId);
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(content: Text(
                                          'Request sent to donor')),
                                    );
                                  },
                                  child: const Text("Request"),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
Future<void> sendNotificationToDonor(String token, String itemName) async {
  final serverKey = 'BO-DbXInTtRbByTjnCouVSjzGX9z5kfe52jfqm3gWGElENEU6egq4XyFB6PUkILXlYRlMsQ_SrjalcBE3NHPt4w'; // Replace with your Firebase Cloud Messaging server key

  final message = {
    "to": token,
    "notification": {
      "title": "Food Request",
      "body": "Someone requested your donated item: $itemName"
    }
  };

  await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "key=$serverKey",
    },
    body: jsonEncode(message),
  );
}
