import 'package:assesmentflutter2/Models/Weather.dart';
import 'package:flutter/material.dart';

class LocationInfoWidget extends StatelessWidget {
  Location? location;

  LocationInfoWidget({this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location Info',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text('Name: ${location?.name}'),
          Text('Region: ${location?.region}'),
          Text('Country: ${location?.country}'),
          Text('Latitude: ${location?.lat}'),
          Text('Longitude: ${location?.lon}'),
          Text('Timezone ID: ${location?.tzId}'),
          Text('Local Time Epoch: ${location?.localtimeEpoch}'),
        ],
      ),
    );
  }
}
