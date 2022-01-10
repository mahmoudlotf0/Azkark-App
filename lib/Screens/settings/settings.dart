import 'package:azkarapp/Screens/settings/contents/dark_mode.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Settings extends StatelessWidget {
  static String routeName = 'Setting';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('الإعدادات', style: Theme.of(context).textTheme.headline1),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'المظهر',
              style: Theme.of(context).textTheme.headline1,
            ),
            leading: Icon(Icons.dark_mode_rounded,
                color: Theme.of(context).iconTheme.color),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).iconTheme.color),
            onTap: () {
              Navigator.of(context).pushNamed(
                DarkMode.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}
