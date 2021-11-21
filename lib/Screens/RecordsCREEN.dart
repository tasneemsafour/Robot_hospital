import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:sound_stream/sound_stream.dart';

class Record extends StatefulWidget {
  static String routName = 'Record';
  @override
  _RecordState createState() => _RecordState();
}

class _RecordState extends State<Record> {
  RecorderStream _recorder = RecorderStream();
  PlayerStream _player = PlayerStream();
  List<Uint8List> _micChunks = [];
  bool _isRecording = false;
  bool _isPlaying = false;
  StreamSubscription _recorderStatus;
  StreamSubscription _playerStatus;
  StreamSubscription _audioStream;

  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  @override
  void dispose() {
    _recorderStatus?.cancel();
    _playerStatus?.cancel();
    _audioStream?.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlugin() async {
    _recorderStatus = _recorder.status.listen((status) {
      if (mounted)
        setState(() {
          _isRecording = status == SoundStreamStatus.Playing;
        });
    });

    _audioStream = _recorder.audioStream.listen((data) {
      if (_isPlaying) {
        _player.writeChunk(data);
      } else {
        _micChunks.add(data);
      }
    });

    _playerStatus = _player.status.listen((status) {
      if (mounted)
        setState(() {
          _isPlaying = status == SoundStreamStatus.Playing;
        });
    });

    await Future.wait([
      _recorder.initialize(),
      _player.initialize(),
    ]);
  }

  void _play() async {
    await _player.start();

    if (_micChunks.isNotEmpty) {
      for (var chunk in _micChunks) {
        await _player.writeChunk(chunk);
      }
      _micChunks.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome" , style: TextStyle(fontSize: 50),) ,

            Image(image: AssetImage(_isRecording ?'assets/images/sound-wave.gif' : 'assets/images/RemoveImage.png' ),
                fit: BoxFit.fill),

              IconButton(
                iconSize: 96.0,
                icon: Icon(_isRecording ? Icons.mic_off : Icons.mic),
                onPressed: _isRecording ? _recorder.start : _recorder.start,
              ),
             /* IconButton(
                iconSize: 96.0,
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: _isPlaying ? _player.stop : _play,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}