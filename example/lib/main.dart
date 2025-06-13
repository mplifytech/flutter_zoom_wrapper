import 'package:flutter/material.dart';
import 'package:flutter_zoom_wrapper/flutter_zoom_wrapper.dart';

void main() {
  runApp(const ZoomExampleApp());
}

/// Entry point for the Flutter Zoom Wrapper example app.
class ZoomExampleApp extends StatelessWidget {
  const ZoomExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Zoom Wrapper Example',
      home: ZoomHomePage(),
    );
  }
}

/// A demo page to initialize and join Zoom meetings with user input.
class ZoomHomePage extends StatefulWidget {
  const ZoomHomePage({super.key});

  @override
  State<ZoomHomePage> createState() => _ZoomHomePageState();
}

class _ZoomHomePageState extends State<ZoomHomePage> {
  final TextEditingController _sdkKeyController = TextEditingController();
  final TextEditingController _sdkSecretController = TextEditingController();
  final TextEditingController _meetingIdController = TextEditingController();
  final TextEditingController _meetingPasswordController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController(text: 'Guest User');

  String _logOutput = '';

  void _appendLog(String text) {
    setState(() {
      _logOutput += '$text\n';
    });
  }

  Future<void> _initializeZoomSDK() async {
    final sdkKey = _sdkKeyController.text.trim();
    final sdkSecret = _sdkSecretController.text.trim();

    if (sdkKey.isEmpty || sdkSecret.isEmpty) {
      _appendLog('❗ Please enter both SDK Key and SDK Secret.');
      return;
    }

    try {
      final jwtToken = FlutterZoomWrapper.generateZoomJWT(sdkKey, sdkSecret);
      await FlutterZoomWrapper.initializeZoom(jwtToken);
      _appendLog('✅ Zoom SDK initialized successfully.');
    } catch (e) {
      _appendLog('❌ Error initializing Zoom SDK: $e');
    }
  }

  Future<void> _joinZoomMeeting() async {
    final meetingId = _meetingIdController.text.trim();
    final meetingPassword = _meetingPasswordController.text.trim();
    final displayName = _displayNameController.text.trim();

    if (meetingId.isEmpty || meetingPassword.isEmpty || displayName.isEmpty) {
      _appendLog('❗ Please fill all meeting fields.');
      return;
    }

    try {
      await FlutterZoomWrapper.joinMeeting(
        meetingId: meetingId,
        meetingPassword: meetingPassword,
        displayName: displayName,
      );
      _appendLog('📞 Attempting to join the Zoom meeting...');
    } catch (e) {
      _appendLog('❌ Error joining Zoom meeting: $e');
    }
  }

  @override
  void dispose() {
    _sdkKeyController.dispose();
    _sdkSecretController.dispose();
    _meetingIdController.dispose();
    _meetingPasswordController.dispose();
    _displayNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoom Integration Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              '⚠️ For testing purposes only.\nIn production, generate JWT on your secure backend!',
              style: TextStyle(color: Colors.orange, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            _buildTextField(_sdkKeyController, 'Zoom SDK Key'),
            _buildTextField(_sdkSecretController, 'Zoom SDK Secret'),
            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: _initializeZoomSDK,
              icon: const Icon(Icons.power),
              label: const Text('Initialize Zoom SDK'),
            ),

            const Divider(height: 40),

            _buildTextField(_meetingIdController, 'Meeting ID'),
            _buildTextField(_meetingPasswordController, 'Meeting Password'),
            _buildTextField(_displayNameController, 'Your Display Name'),

            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _joinZoomMeeting,
              icon: const Icon(Icons.video_call),
              label: const Text('Join Zoom Meeting'),
            ),

            const SizedBox(height: 30),
            const Text(
              'Logs',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 8),
              color: Colors.black12,
              child: SingleChildScrollView(
                child: Text(
                  _logOutput,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
