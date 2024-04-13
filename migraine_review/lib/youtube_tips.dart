import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlaylistPage extends StatefulWidget {
  final String playlistUrl;

  const YouTubePlaylistPage({Key? key, required this.playlistUrl}) : super(key: key);

  @override
  _YouTubePlaylistPageState createState() => _YouTubePlaylistPageState();
}

class _YouTubePlaylistPageState extends State<YouTubePlaylistPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.playlistUrl) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Playlist'),
        backgroundColor: Colors.redAccent, // Change the app bar color
        elevation: 0, // Remove app bar elevation
        centerTitle: true, // Center the app bar title
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.redAccent, // Change the progress indicator color
          progressColors: const ProgressBarColors(
            playedColor: Colors.red,
            handleColor: Colors.redAccent,
          ),
          onReady: () {
            // Perform any operations when the player is ready
          },
          onEnded: (metaData) {
            // Perform any operations when the video ends
          },
        ),
      ),
      backgroundColor: Colors.black, // Change the background color of the page
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
