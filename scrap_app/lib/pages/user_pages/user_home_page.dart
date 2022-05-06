import 'package:flutter/material.dart';
import 'call_scrap_dealer_page.dart';
import 'user_add_box_page.dart';


class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {



  void runToUserAddBoxPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => UserAddBoxPage(),
    ));
  }

  void runToCallScrapDealerPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CallScrapDealerPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('UserHomePage'),
            Padding(
              padding: const EdgeInsets.all(8),
              child: true == false ? ElevatedButton(
                onPressed: () {
                  runToUserAddBoxPage();
                },
                child: Text('Kutu Ekle'),
              ) : Text('Kutu Eklendi'),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    runToCallScrapDealerPage();
                  });
                },
                child: Text('Hurdacı Çağır'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

