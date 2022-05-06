import 'package:flutter/material.dart';

class CallScrapDealerPage extends StatefulWidget {
  const CallScrapDealerPage({Key? key}) : super(key: key);

  @override
  State<CallScrapDealerPage> createState() => _CallScrapDealerPageState();
}

class _CallScrapDealerPageState extends State<CallScrapDealerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Elinizdeki atık nedir? = DropDown Button'),
            Text('Şehir = DropDown Button'),
            Text('Semt = DropDown Button'),
            Text('Tahmini Ağırlık'),
            Text('Kullanıcının gireceği açıklama'),
            Text('Birim Fiyat Aralığı = 100-1000Tl'),
            ElevatedButton(
              onPressed: () {

              },
              child: Text('İlanı Oluştur'),
            ),
          ],
        ),
      ),
    );
  }
}
