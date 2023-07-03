import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'Jony', email: 'jony@example.com', phoneNumber: '1234567890'),
    Contact(
        name: 'Josim', email: 'jpsim@example.com', phoneNumber: '0987654321'),
    Contact(name: 'Alif', email: 'alif@example.com', phoneNumber: '9876543210'),
  ];

  ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(
              contact.name,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            onTap: () {
              _showContactDetails(context, contact);
            },
          );
        },
      ),
    );
  }

  void _showContactDetails(BuildContext context, contact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${contact.name}'),
                const SizedBox(height: 8.0),
                Text('Email: ${contact.email}'),
                const SizedBox(height: 8.0),
                Text('Phone: ${contact.phoneNumber}'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}
