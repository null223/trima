import 'package:app/model/trip.dart';
import 'package:app/screen/home.dart';
import 'package:app/screen/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:niku/namespace.dart' as n;
import '../supabase/supabase.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

extension MyShortenProperties on n.Text {
  void get primary {
    color = Colors.lightBlue;
    fontSize = 24;
  }

  get heading1 {
    fontWeight = FontWeight.bold;
    fontSize = 32;
  }

  get heading2 {
    fontWeight = FontWeight.bold;
    fontSize = 24;
  }

  get heading3 {
    fontWeight = FontWeight.bold;
    fontSize = 20;
  }

  get heading4 {
    fontWeight = FontWeight.bold;
    fontSize = 18;
  }

  // set heading(int number) {
  //   fontWeight = FontWeight.bold;
  //   switch (number) {
  //     case 1:
  //       fontSize = 32;
  //       break;
  //     case 2:
  //       fontSize = 24;
  //       break;
  //     case 3:
  //       fontSize = 20;
  //       break;
  //     case 4:
  //       fontSize = 18;
  //       break;
  //   }
  // }
}

extension MyShortenPropertiesButton on n.Button {
  get primary {
    rounded = 8;
    px = 24;
    py = 16;
    fontSize = 18;
    w500;
    bg = Colors.lightBlue;
    color = Colors.white;
  }
}

class ServicePageStyled {
  static button(Color color) => n.Button(SizedBox.shrink())
    ..rounded = 4
    ..px = 24
    ..py = 12
    ..fontSize = 18
    ..w500
    ..bg = color
    ..color = Colors.white;

  static final primaryAccent = n.Text('')
    ..color = Colors.lightBlue
    ..fontSize = 24
    ..bold;
}

class ServicePage extends HookWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: n.Text("とりまっ！")
          ..color = Colors.white
          ..bold,
      ),
      body: n.Column([
        n.Text('このアプリについて')
          ..heading1
          ..primary
          ..mb = 16,
        Text('Q.このアプリは画像ではなく、思い出が残るアプリです。'),
        n.Row([n.Box()..w = 16, Text('それはなぜでしょう')])..mb = 32,
        n.Box()..h = 24,
        n.Text('撮りたくなった気持ちも載ってるから')
          ..heading4
          ..mb = 8,
        n.Text('――― なる')
          ..ml = 128
          ..italic
          ..color = Colors.grey.shade700,
        n.Box()..h = 32,
        n.Text('特別な日な私からメッセージが届くから')
          ..heading4
          ..mb = 8,
        n.Text('――― ゆりの')
          ..color = Colors.grey.shade700
          ..italic
          ..ml = 128
          ..mb = 48,
        // Spacer(),
        // n.Text('そんなふたりの想いを詰め込みました！')
        //   ..heading2
        //   ..mb = 32,
      ])
        ..p = 20
        ..useParent(
          (child) => Card(
            elevation: 10,
            child: Container(child: child),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ).niku
            ..w100
            ..p = 10,
        )
        ..crossStart,
      bottomNavigationBar: Container(
        child: n.Row([
          const Spacer(),
          n.Button(n.Row([Icon(Icons.home), Text('ホーム')])..gap = 4)
            // ..apply = ServicePageStyled.button(Colors.lightBlue)
            ..primary
            ..onPressed = () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
        ])
          ..py = 12
          ..px = 8
          ..bg = Colors.white,
        // ..alignCenterRight,
      ),
    );
  }
}
