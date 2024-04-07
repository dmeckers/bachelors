import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:jam_ui/jam_ui.dart';

class AskQuestionPage extends StatelessWidget {
  const AskQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Ask Question',
          style: context.jText.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => debugPrint('search'),
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
