import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms/AdminPage.dart';
import 'package:sms/Announcement.dart';
import 'package:sms/BadChatsPage.dart';
import 'package:sms/ChatScreen.dart';
import 'package:sms/Policeoffline.dart';
import 'package:sms/Responders.dart';
import 'package:sms/SettingsPage.dart';
import 'package:sms/TrafficScreenChat.dart';
import 'package:sms/firstaidpage.dart';

class AdminDashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildServiceRow(
                context,
                images: ['assets/users.gif', 'assets/fire.gif'],
                labels: ['User Mgt', 'Responders'],
                actions: [
                  () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminPage())),
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RespondersPage())),
                ],
              ),
              SizedBox(height: 15),
              _buildServiceRow(
                context,
                images: ['assets/announcement.gif', 'assets/settings.gif'],
                labels: ['Anoucement', 'Settings'],
                actions: [
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnnouncementSend())),
                  () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage())),
                ],
              ),
              // SizedBox(height: 15),
              // _buildServiceRow(
              //   context,
              //   images: ['assets/traffic.gif', 'assets/assis.gif'],
              //   labels: ['Chats Word', 'Assist'],
              //   actions: [
              //     () => Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => BadChatsPage())),
              //     () => Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => PoliceOffline())),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceRow(BuildContext context,
      {required List<String> images,
      required List<String> labels,
      required List<VoidCallback> actions}) {
    assert(images.length == labels.length && labels.length == actions.length,
        'Images, labels, and actions lists must have the same length');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(images.length, (index) {
          return Expanded(
            child: _buildServiceImage(
              context,
              image: images[index],
              label: labels[index],
              onTap: actions[index],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildServiceImage(BuildContext context,
      {required String image, required String label, VoidCallback? onTap}) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 30.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(10.0),
            // boxShadow: [
            //   BoxShadow(
            //     color: theme.shadowColor.withOpacity(0.3),
            //     spreadRadius: 1,
            //     blurRadius: 0,
            //     offset: Offset(0, 2),
            //   ),
            // ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(image, width: 90, height: 75),
              SizedBox(height: 5),
              Text(label,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
