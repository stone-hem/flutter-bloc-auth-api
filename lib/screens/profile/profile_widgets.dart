import 'package:flutter/material.dart';
import 'package:onboarding/common/routes/routes.dart';

Widget buildProfileList(BuildContext context) {
  var profileList = [
    {
      'title': 'setttings',
      'subtitle': 'Tap here to see settings',
      'icon': Icons.settings
    },
    {
      'title': 'account',
      'subtitle': 'Tap here to see account',
      'icon': Icons.manage_accounts
    },
    {
      'title': 'another',
      'subtitle': 'Tap here to see others',
      'icon': Icons.settings
    },
    {
      'title': 'setttings',
      'subtitle': 'Tap here to see settings',
      Icon: Icons.settings
    }
  ];
  return Column(
    children: [
      ...List.generate(profileList.length, (index) {
        var iconData = profileList[index]['icon'] as IconData? ??
            Icons.error; // Use Icons.error as a default icon

        return ListTile(
          leading: Icon(iconData),
          title: Text('${profileList.elementAt(index)['title']}'),
          subtitle: Text('${profileList.elementAt(index)['subtitle']}'),
          tileColor: Theme.of(context).colorScheme.onInverseSurface,
          onTap: () => Navigator.pushNamed(context,RouteNames.settings),
        );
      })
    ],
  );
}
