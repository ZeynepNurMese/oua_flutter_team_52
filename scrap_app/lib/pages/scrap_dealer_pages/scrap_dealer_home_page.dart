import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:convert';



class ScrapDealerHomePage extends StatefulWidget {
  const ScrapDealerHomePage({Key? key}) : super(key: key);

  @override
  State<ScrapDealerHomePage> createState() => _ScrapDealerHomePageState();
}

class _ScrapDealerHomePageState extends State<ScrapDealerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
              child: Center(child: Text('Teklife Açık Kutular')),
            ),
          ),
          Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => filledBoxRow(),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 3,
              )),
        ],
      ),
    );
  }
}

class filledBoxRow extends StatefulWidget {
  const filledBoxRow({
    Key? key,
  }) : super(key: key);

  @override
  State<filledBoxRow> createState() => _filledBoxRowState();
}

class _filledBoxRowState extends State<filledBoxRow> {

  DatabaseReference taskRef = FirebaseDatabase.instance.ref('box00001');
  String? data;
  Map<String,dynamic>? convertedData;

  @override
  void initState() {
    taskRef.onValue.listen((event) {
      setState(() {
      data = jsonEncode(event.snapshot.value);
      convertedData = jsonDecode(data!);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: convertedData != null ? Text('Aysa Apt. Kağıt Kutusu: %${convertedData!['loadFactor']}') : Text('Veri Null'),
      trailing: IconButton(
        onPressed: () {
          print(convertedData!['filledRate']);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}


