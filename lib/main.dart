import 'package:flutter/material.dart';
import 'package:socialmedia_app/widgets/video_post.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SocialFeed()));

class SocialFeed extends StatelessWidget {
  final List<Map<String, dynamic>> posts = [
    {"name": "random_user", "text": "???", "image": "https://th.bing.com/th/id/OIP.aynW9TZrmwZAbxQjoUhZSgHaHa?w=166&h=180&c=7&r=0&o=7&pid=1.7&rm=3"},
    {"name": "username", "text": "cap video", "video": "https://v1.pinimg.com/videos/mc/720p/87/5d/9f/875d9f38edaf14bb2652e8938cb8e82f.mp4"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social Media"),
        leading: IconButton(icon: Icon(Icons.camera_alt_outlined), onPressed: () {}),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(icon: Icon(Icons.send_outlined), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, i) {
          final p = posts[i];
          final name = p["name"] as String? ?? "user";
          final text = p["text"] as String? ?? "";
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      child: Text(name.isNotEmpty ? name[0] : "?", style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(width: 10),
                    Expanded(child: Text(name, style: TextStyle(fontWeight: FontWeight.w600))),
                    IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}, padding: EdgeInsets.zero),
                  ],
                ),
              ),
              if (p.containsKey("image"))
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: Image.network(p["image"] as String, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Icon(Icons.broken_image, size: 48)),
                ),
              if (p.containsKey("video")) VideoPost(url: p["video"] as String),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}, padding: EdgeInsets.zero),
                    IconButton(icon: Icon(Icons.chat_bubble_outline), onPressed: () {}, padding: EdgeInsets.zero),
                    IconButton(icon: Icon(Icons.send_outlined), onPressed: () {}, padding: EdgeInsets.zero),
                  ],
                ),
              ),
              if (text.isNotEmpty)
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: "$name ", style: TextStyle(fontWeight: FontWeight.w600)),
                        TextSpan(text: text),
                      ],
                    ),
                  ),
                ),
              Divider(height: 1),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Reels"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
        onTap: (_) {},
      ),
    );
  }
}
