// import 'package:flutter/material.dart';
// import 'package:audio_waveforms/audio_waveforms.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:async';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(AudioWaveformApp());
// }

// class AudioWaveformApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Chat Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         brightness: Brightness.dark,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: ChatPage(),
//     );
//   }
// }

// class ChatPage extends StatefulWidget {
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   final RecorderController _recorderController = RecorderController();
//   final PlayerController _playerController = PlayerController();
//   final TextEditingController _textController = TextEditingController();
//   final ImagePicker _picker = ImagePicker();
//   bool _isRecording = false;
//   bool _isPlaying = false;
//   String? _recordedFilePath;
//   List<Message> messages = [];

//   @override
//   void dispose() {
//     _recorderController.dispose();
//     _playerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat Demo'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 final message = messages[index];
//                 if (message.type == MessageType.text) {
//                   return ListTile(title: Text(message.content));
//                 } else if (message.type == MessageType.image) {
//                   return ListTile(
//                     title: Image.file(File(message.content)),
//                   );
//                 } else if (message.type == MessageType.voice) {
//                   return ListTile(
//                     title: Text('Voice Message'),
//                     onTap: () => _playAudio(message.content),
//                   );
//                 }
//                 return SizedBox.shrink();
//               },
//             ),
//           ),
//           TextField(
//             controller: _textController,
//             decoration: InputDecoration(
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.send),
//                 onPressed: _sendTextMessage,
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.photo_camera),
//                 onPressed: _sendImageMessage,
//               ),
//               IconButton(
//                 icon: Icon(_isRecording ? Icons.stop : Icons.mic),
//                 onPressed: _toggleRecording,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void _sendTextMessage() async {
//     final text = _textController.text;
//     if (text.isNotEmpty) {
//       _textController.clear();
//       // Add message to local list and send to Firestore
//       final message = Message(content: text, type: MessageType.text);
//       messages.add(message);
//       await FirebaseFirestore.instance.collection('messages').add(message.toJson());
//       setState(() {});
//     }
//   }

//   void _sendImageMessage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//       // Send image file path to Firestore
//       final message = Message(content: image.path, type: MessageType.image);
//       messages.add(message);
//       await FirebaseFirestore.instance.collection('messages').add(message.toJson());
//       setState(() {});
//     }
//   }

//   void _toggleRecording() async {
//     if (_isRecording) {
//       final path = await _recorderController.stop();
//       setState(() {
//         _isRecording = false;
//         _recordedFilePath = path;
//       });
//       // Send voice file path to Firestore
//       final message = Message(content: path!, type: MessageType.voice);
//       messages.add(message);
//       await FirebaseFirestore.instance.collection('messages').add(message.toJson());
//     } else {
//       await _recorderController.record();
//       setState(() {
//         _isRecording = true;
//         _recordedFilePath = null; // Optionally hide the waveform while recording
//       });
//     }
//   }

//   void _playAudio(String filePath) {
//     _playerController.preparePlayer(path: filePath, shouldExtractWaveform: true);
//     _playerController.startPlayer();
//   }
// }

// enum MessageType { text, image, voice }

// class Message {
//   final String content;
//   final MessageType type;

//   Message({required this.content, required this.type});

//   Map<String, dynamic> toJson() {
//     return {
//       'content': content,
//       'type': type.toString(),
//     };
//   }
// }
