import 'package:app/model/place.dart';
import 'package:app/model/trip.dart';
import 'package:app/supabase/supabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:niku/namespace.dart' as n;

class TripPage extends HookWidget {
  const TripPage({Key? key, required this.trip}) : super(key: key);

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final places = useState<List<Place>>([]);
    final client = getSubabaseClient();

    getPlaces() async {
      final res = (await client
          .from('place')
          .select(
              // '''
              // *, trip!inner(*)
              // '''
              )
          .eq('tripId', trip.id)
          .execute());
      print('response.data: ${res.data}');
      List<Place> _places = [];
      for (var i = 0; i < res.data.length; i++) {
        final data = res.data[i];
        _places.add(Place(
          data['id'],
          data['name'],
        ));
      }
      places.value = _places;
    }

    useEffect(() {
      getPlaces();
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: n.Text(trip.title)..color = Colors.white,
      ),
      body: ListView.builder(
        itemCount: places.value.length,
        itemBuilder: (context, index) {
          final trip = places.value[index];
          return n.ListTile(
            title: Text(trip.name),
          );
        },
      ),
    );
  }
}
