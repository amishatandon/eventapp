import 'package:event_app/UI/event_details/events_details_page.dart';
import 'package:event_app/UI/homepage/category_widget.dart';
import 'package:event_app/UI/homepage/event_widget.dart';
import 'package:event_app/UI/homepage/home_page_background.dart';
import 'package:event_app/app_state.dart';
import 'package:event_app/models/category.dart';
import 'package:event_app/models/event.dart';
import 'package:event_app/styleguide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(), //having selected category id as zero here.
        child: Stack(children: [
          HomePageBackground(screenHeight: MediaQuery.of(context).size.height),
          SafeArea(
            //inserts child with sufficient padding to avoid obstacles.
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'LOCAL EVENTS',
                          style: fadedTextStyle,
                        ),
                        Spacer(),
                        Icon(
                          Icons.person_2_outlined,
                          color: Color(0x99FFFFFF),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Text(
                      "What's Up",
                      style: whiteHeadingTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                    ),
                    child: Consumer<AppState>(
                      builder: (context, appState, _) => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (final category in categories)
                              CategoryWidget(category: category)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Consumer<AppState>(
                      builder: (context, appState, _) => Column(
                        children: [
                          for (final event in events.where(
                            // event list have all the events
                            (e) => e.categoryIds.contains(
                              // if the selected id is in the category id of that event, that event will be returned.
                              appState.selectedCategoryId,
                            ),
                          ))
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      EventDetailsPage(event: event),
                                ));
                              },
                              child: EventWidget(
                                event: event,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
