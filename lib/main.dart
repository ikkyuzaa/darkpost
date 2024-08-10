import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DarKXPost',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Post> post = List.empty(growable: true);
  String? message;

  void _createNewPost(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("สร้างโพสใหม่"),
        content: SizedBox(
          child: TextField(
            onChanged: (value) {
              message = value;
              setState(() {});
            },
          ),
        ),
        actions: [
          Expanded(
            child: TextButton(
              onPressed: () {
                post.add(Post(title: message));
                Navigator.pop(context);
              },
              child: const Text("ตกลง"),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("ยกเลิก"),
            ),
          ),
        ],
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: post.length,
        itemBuilder: (context, index) => Card(
          child: Text(
            post[index].title ?? "",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createNewPost(context),
        tooltip: 'Increment',
        child: const Icon(
          Icons.edit,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Post {
  final String? profileImage; // avatar
  final String? firstname;
  final String? lastname;
  final String? title;

  Post({
    this.title,
    this.profileImage,
    this.firstname,
    this.lastname,
  });
}
