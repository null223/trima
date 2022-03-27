import 'package:app/model/trip.dart';
import 'package:app/screen/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:niku/namespace.dart' as n;
import 'package:supabase/supabase.dart';
import '../supabase/supabase.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trips = useState<List<Trip>>([]);
    final client = getSubabaseClient();

    getTrips() async {
      final res = (await client.from('trip').select().execute());
      print('response.data: ${res.data}');
      List<Trip> _trips = [];
      for (var i = 0; i < res.data.length; i++) {
        final data = res.data[i];
        _trips.add(Trip(
          data['id'],
          data['title'],
          // start_at: data['start_at'] ? DateTime.parse(data['start_at']) : null,
          // end_at: data['end_at'] ? DateTime.parse(data['end_at']) : null,
        ));
      }
      trips.value = _trips;
    }

    useEffect(
      () {
        getTrips();
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        title: n.Text("とりまっ！")..color = Colors.white,
      ),
      body: ListView.builder(
        itemCount: trips.value.length,
        itemBuilder: (context, index) {
          final trip = trips.value[index];
          return n.ListTile(
            title: Text(trip.title),
          )..onTap = () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TripPage(trip: trip)));
            };
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
