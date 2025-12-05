import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/app_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _extraController = TextEditingController();

  bool get _canSave =>
      _nameController.text.isNotEmpty && _emailController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onFieldChange);
    _emailController.addListener(_onFieldChange);
    _extraController.addListener(_onFieldChange);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _extraController.dispose();
    super.dispose();
  }

  void _onFieldChange() {
    setState(() {});
  }

  void _saveProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile saved'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: heading2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              style: normalText,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              style: normalText,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _extraController,
              decoration: const InputDecoration(
                labelText: 'Extra (optional)',
              ),
              style: normalText,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _canSave ? _saveProfile : null,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
