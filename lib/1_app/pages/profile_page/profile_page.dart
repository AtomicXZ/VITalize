import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildFieldCard('Student Name', 'John Doe'),
        _buildFieldCard('VIT Register Number', '19BCE1234'),
        _buildFieldCard('Application Number', 'VT1234567'),
        _buildFieldCard('Date Of Birth', '01-Jan-2000'),
        _buildFieldCard('Gender', 'Male'),
        _buildFieldCard('Program', 'B.Tech'),
        _buildFieldCard('Branch', 'Computer Science'),
        _buildFieldCard('School', 'School of Computer Science and Engineering'),
        _buildFieldCard('Mobile Number', '1234567890'),
      ],
    );
  }

  Widget _buildFieldCard(String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
