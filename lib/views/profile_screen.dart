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
        title: const Text('Profile', style: heading2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      child: Icon(Icons.person, size: 36),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your name',
                      ),
                      style: normalText,
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'you@example.com',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      style: normalText,
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _extraController,
                      decoration: const InputDecoration(
                        labelText: 'Extra (optional)',
                        hintText: 'Phone, note, etc.',
                      ),
                      style: normalText,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: _canSave ? _saveProfile : null,
                      icon: const Icon(Icons.check),
                      label: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
