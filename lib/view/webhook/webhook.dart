import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuvio/core/common/appbar.dart';
import 'package:nuvio/core/common/inputbox.dart';

import '../../core/common/button.dart';

class WebhookScreen extends StatefulWidget {
  const WebhookScreen({super.key});

  @override
  State<WebhookScreen> createState() => _WebhookScreenState();
}

class _WebhookScreenState extends State<WebhookScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: DimeAppBar('Webhook', context),
      backgroundColor: colorScheme.background,
      body: Column(
        children: [
          const SizedBox(height: 10),
          InputBox(
            controller: _controller,
            label: 'Webhook',
            hint: 'https://',
            keyboard: TextInputType.url,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Webhook is a URL that receives a POST request when a transaction is made. You can use this to send a notification to your app or website.',
              style: TextStyle(color: colorScheme.onBackground),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
      bottomNavigationBar: DimeButton(
        text: 'Save',
        onTap: () {
          Navigator.pop(context);
        },
        color: colorScheme.secondary,
      ),
    );
  }
}
