import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({super.key, required this.title});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;
  List<BubbleNormal> mylist = [
    BubbleNormal(
      text: 'Bonjour monsieur ahmed cv',
      isSender: false,
      color: const Color(0xFF1B97F3),
      tail: true,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    BubbleNormal(
      text: 'Hamdoulah weldi iheb hasitou mahouch kima lada',
      isSender: true,
      color: const Color(0xFFE8E8EE),
      tail: true,
      sent: true,
    ),
    BubbleNormal(
      text: 'kifeh bedhabt tnajm tzid tfasrli ',
      isSender: false,
      color: const Color(0xFF1B97F3),
      tail: false,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    BubbleNormal(
      text: 'hasitou demotiveé bch yemchi yakra nhb narf ken sart haja',
      color: const Color(0xFFE8E8EE),
      tail: false,
      sent: true,
      seen: true,
      delivered: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.title),
        actions: [
          Image.asset(
            "images/ourlogo2.png",
            height: 50,
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                BubbleNormalImage(
                  id: 'id001',
                  image: _image(),
                  color: Colors.purpleAccent,
                  tail: true,
                  delivered: true,
                ),
                BubbleNormalAudio(
                  color: const Color(0xFFE8E8EE),
                  duration: duration.inSeconds.toDouble(),
                  position: position.inSeconds.toDouble(),
                  isPlaying: isPlaying,
                  isLoading: isLoading,
                  isPause: isPause,
                  onSeekChanged: _changeSeek,
                  onPlayPauseButtonClick: _playAudio,
                  sent: true,
                ),
                mylist[0],
                mylist[1],
                DateChip(
                  date: DateTime(now.year, now.month, now.day - 2),
                ),
                mylist[2],
                mylist[3],
                const BubbleSpecialOne(
                  text: 'okay taw nhelouha lmochokla lyouma matkhafch alih',
                  isSender: false,
                  color: Color(0xFF1B97F3),
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                DateChip(
                  date: DateTime(now.year, now.month, now.day - 1),
                ),
                const BubbleSpecialOne(
                  text: 'dont be harsh on him and make it easy on him ',
                  color: Color(0xFFE8E8EE),
                  seen: true,
                ),
                const BubbleSpecialOne(
                  text: 'menghyr matkhamem monsieur ',
                  isSender: false,
                  tail: false,
                  color: Color(0xFF1B97F3),
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const BubbleSpecialOne(
                  text: 'Merci monsieur mohamed',
                  tail: false,
                  color: Color(0xFFE8E8EE),
                  sent: true,
                ),
                const BubbleSpecialTwo(
                  text: 'Mahich mzia ',
                  isSender: false,
                  color: Color(0xFF1B97F3),
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                DateChip(
                  date: now,
                ),
                mylist.length == 5
                    ? mylist[4]
                    : const SizedBox(
                        height: 50,
                      ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          MessageBar(
            // ignore: avoid_print
            onSend: (_) {
              mylist.add(BubbleNormal(
                text: _,
                color: const Color(0xFFE8E8EE),
                tail: false,
                sent: true,
                seen: true,
                delivered: true,
              ));
              setState(() {});
            },

            actions: [
              InkWell(
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 24,
                ),
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: InkWell(
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.green,
                    size: 24,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 20.0,
        minWidth: 20.0,
      ),
      child: CachedNetworkImage(
        imageUrl:
            'https://www.kids.org.uk/wp-content/uploads/2023/09/image02-scaled-e1707912765463-700x401.webp',
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  void _changeSeek(double value) {
    setState(() {
      audioPlayer.seek(Duration(seconds: value.toInt()));
    });
  }

  void _playAudio() async {
    const url =
        'https://file-examples.com/storage/fef1706276640fa2f99a5a4/2017/11/file_example_MP3_700KB.mp3';
    if (isPause) {
      await audioPlayer.resume();
      setState(() {
        isPlaying = true;
        isPause = false;
      });
    } else if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
        isPause = true;
      });
    } else {
      setState(() {
        isLoading = true;
      });
      await audioPlayer.play(UrlSource(url));
      setState(() {
        isPlaying = true;
      });
    }

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
        isLoading = false;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
    });
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        duration = const Duration();
        position = const Duration();
      });
    });
  }
}
