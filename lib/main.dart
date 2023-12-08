import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  List<bool> isStarred = List.generate(15, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GMAIL CLONE.',
          style: TextStyle(color: Color.fromARGB(255, 189, 157, 157)),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 60, 79),
        actions: const [
          // Profile Picture in the profile icon (On Top Right)
          CircleAvatar(
            backgroundImage: AssetImage(
                'images/images.jpeg'), // Replace with your image asset
          ),
          SizedBox(width: 16),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [
          // First Page - Mails Section
          ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Email $index'),
                subtitle: const Text(' u win 1000 points'),
                trailing: IconButton(
                  icon: Icon(
                    isStarred[index] ? Icons.star : Icons.star_border,
                    color: const Color.fromARGB(255, 255, 7, 106),
                  ),
                  onPressed: () {
                    setState(() {
                      isStarred[index] = !isStarred[index];
                    });
                  },
                ),
              );
            },
          ),

          // Second Page - Meet Section
          const Center(
            child: Text('chat with you friendsss'),
          ),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Mails',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Meet',
          ),
        ],
      ),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show Snackbar on FAB click
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('will update soonff'),
            ),
          );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 2, 79, 24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      'images/images.jpeg'), // Replace with your image asset
                ),
                SizedBox(height: 2),
                Text(
                  'Thamjid',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Thamjid@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Sent'),
            onTap: () {
              // Handle drawer item click if needed
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Unwanted'),
            onTap: () {
              // Handle drawer item click if needed
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Recieved'),
            onTap: () {
              // Handle drawer item click if needed
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Spam'),
            onTap: () {
              // Handle drawer item click if needed
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
