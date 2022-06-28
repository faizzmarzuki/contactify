import 'package:flutter/material.dart';
import 'package:contactify/user.dart';
// import 'package:contactify/FadeAnimation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Apps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Contact List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> {

  List<dynamic> contactList = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);

    setState(() {
      contactList = data['contacts']
        .map((data) => Contact.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    readJson();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: contactList.length,
            itemBuilder: (context, index) {
             return contactComponent(contact: contactList[index]);
            }),
      ),
    );
  }
  contactComponent({required Contact contact}) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contact.user, style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 5,),
                          Text(contact.phone, style: TextStyle(color: Colors.grey[500])),
                        ]
                      ),
                    )
                  ]
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(contact.checkIn, style: TextStyle(color: Colors.grey.shade800, fontSize: 12),)
              ],
            ),
          )
        ],
      ),
    );
  }
}


