import 'dart:io';
import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: AppTheme.primaryDark),
            child: Text(
              'Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            title: const Text('home'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Tipos'),
            onTap: () {
              Navigator.pushNamed(context, '/tipos');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Sair'),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
