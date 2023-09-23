import 'package:event_app/UI/event_details/event_detail_background.dart';
import 'package:event_app/UI/event_details/event_details_content.dart';
import 'package:event_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({super.key, required this.event});
  final Event event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Event>.value(
        value: event,
        child: const Stack(
          children: [
            EventDetailsBackground(),
            EventDetailsContent(),
          ],
        ),
      ),
    );
  }
}
