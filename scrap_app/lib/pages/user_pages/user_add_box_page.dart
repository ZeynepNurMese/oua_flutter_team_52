import 'package:flutter/material.dart';


class UserAddBoxPage extends StatefulWidget {
  const UserAddBoxPage({
    Key? key,
  }) : super(key: key);

  @override
  State<UserAddBoxPage> createState() => _UserAddBoxPageState();
}

class _UserAddBoxPageState extends State<UserAddBoxPage> {

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
              child: Center(
                  child: Text(
                      'Kutu giriş formu')),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Kutu id\'si gibi bilgiler buradan alınır'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Box İd Giriş Kutusu'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StudentsRow extends StatefulWidget {


  const StudentsRow({
        Key? key,
      }) : super(key: key);

  @override
  State<StudentsRow> createState() => _StudentsRowState();
}

class _StudentsRowState extends State<StudentsRow> {


  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text('FC'),
      trailing: IconButton(
        onPressed: () {
          setState(() {
          });
        },
        icon: Icon(Icons.favorite),
      ),
    );
  }
}
