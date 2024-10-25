import 'package:flutter/material.dart';
import 'package:zendesk_chat/zendesk_chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final TextEditingController _tokenController;

  @override
  void initState() {
    super.initState();
    _tokenController = TextEditingController();
    initZendesk();
  }

  @override
  void dispose() {
    _tokenController.dispose();
    super.dispose();
  }

  Future<void> initZendesk() async {
    if (!mounted) {
      return;
    }
    const _accountKey = String.fromEnvironment(
      'ACCOUNT_KEY',
      defaultValue: 'C4NkxGBoxHSTMW3Gm3gznZ6AxIqYXWkZ',
    );
    const _appId = String.fromEnvironment(
      'APP_ID',
      defaultValue: 'ff92947363297c35ad960e50edc747e7a19dbbd7235a852e',
    );

    await Zendesk.initialize(_accountKey, _appId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Zendesk Chat Plugin'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Initialize  example with proper\nkeys in main.dart',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: TextField(
                  controller: _tokenController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your token',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: openChat,
                color: Colors.blueGrey,
                textColor: Colors.white,
                child: const Text('Open Chat'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> openChat() async {
    try {
      if (_tokenController.text.isEmpty) {
        await Zendesk.setVisitorInfo(
            name: 'Text Client',
            email: 'test+client@example.com',
            phoneNumber: '0000000000',
            department: 'Support');
      } else {
        await Zendesk.setIdentity(_tokenController.text.trim());
      }
      await Zendesk.startChat(primaryColor: Colors.red);
    } catch (ex) {
      print('An error occured $ex');
    }
  }
}
