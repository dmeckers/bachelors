import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

final formElements = StateProvider<List<JamFormElementData>>((ref) => []);

class EditJamForm extends StatelessWidget {
  const EditJamForm({super.key, required this.jam});

  final JamModel jam;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SimpleAppBar(title: 'Form builder'),
      body: Center(
        child: Text('Edit jam form'),
      ),
    );
  }
}
