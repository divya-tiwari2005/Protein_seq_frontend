import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpPage(), // Start with the SignUpPage
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signUp() {
    // Navigate to the profile page and pass the name
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(name: _nameController.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple, // Navy blue background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp,
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.facebook_rounded), // Replace with Google icon
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.code_off_rounded), // Replace with Twitter icon
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.g_mobiledata), // Replace with Facebook icon
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.gamepad_rounded), // Replace with GitHub icon
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String name;

  const MyHomePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        toolbarHeight: 50,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePageContent()),
              );
            },
            tooltip: 'Home',
            iconSize: 30,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Upper box with person icon and name
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.person, size: 40, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  name, // Display the signed name
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          _buildBigHalfButton(context, "Predict / Classify", true, Colors.teal),
          _buildBigHalfButton(context, "Learn about this", false, Colors.lightGreen),
          _buildBigHalfButton(context, "Trace evolution / mutation", true, Colors.lightBlue),
          _buildBigHalfButton(context, "3D model", false, Colors.pinkAccent),
          _buildBigHalfButton(context, "Report", true, Colors.orangeAccent),
          _buildBigHalfButton(context, "Notes", false, Colors.deepPurple),
        ],
      ),
    );
  }

  Widget _buildBigHalfButton(BuildContext context, String text, bool isLeftSide, Color color) {
    return Align(
      alignment: isLeftSide ? Alignment.centerLeft : Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPage(buttonText: text),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width * 0.8,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.horizontal(
              left: isLeftSide ? Radius.zero : const Radius.circular(40),
              right: isLeftSide ? const Radius.circular(40) : Radius.zero,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[50], // Background color for home page
        appBar: AppBar(
        title: const Text('Home'),
    ),
    body: ListView(
    padding: const EdgeInsets.all(16.0),
    children: [
    _buildHomeOption(context, "Settings"),
    _buildHomeOption(context, "About Us"),
    _buildHomeOption(context, "FAQ"),
    _buildHomeOption(context, "Log Out"),
    _buildHomeOption(context, "Language"),
    ],
    )
    );
  }

  Widget _buildHomeOption(BuildContext context, String option) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewPage(buttonText: option)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            option,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

// Main content page for buttons with 3 or 2 boxes
class NewPage extends StatefulWidget {
  final String buttonText;

  const NewPage({super.key, required this.buttonText});

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  String _savedNote = ""; // To save the written notes

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _getBackgroundColor(widget.buttonText);

    return Scaffold(
      backgroundColor: backgroundColor, // Different background for each page
      appBar: AppBar(
        title: Text(widget.buttonText),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.buttonText == "Report"
            ? _buildTwoBoxes()
            : widget.buttonText == "Notes"
            ? _buildNotesBox(context)
            : widget.buttonText == "3D model"
            ? _buildThreeBoxes(
            ["Swissmodel", "I-TASSER", "PY-mol"], context)
            : widget.buttonText == "Learn about this"
            ? _buildThreeBoxes(
            ["NCBI", "BLAST", "ORF"], context)
            : widget.buttonText == "Trace evolution / mutation"
            ? _buildThreeBoxes(
            ["NCBI", "BLAST", "ORF"], context)
            : widget.buttonText == "Predict / Classify"
            ? _buildThreeBoxes(
            ["NCBI", "BLAST", "ORF"], context)
            : const Center(child: Text("Unknown Button")),
      ),
    );
  }

  Widget _buildThreeBoxes(List<String> boxNames, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBox(Colors.teal, boxNames[0], context),
        const SizedBox(height: 20),
        _buildBox(Colors.lightGreen, boxNames[1], context),
        const SizedBox(height: 20),
        _buildBox(Colors.lightBlue, boxNames[2], context),
      ],
    );
  }

  Widget _buildTwoBoxes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBox(Colors.teal, 'Downloaded Report', null),
        const SizedBox(height: 20),
        _buildBox(Colors.red, 'Upload Report', null),
      ],
    );
  }

  Widget _buildBox(Color color, String text, BuildContext? context) {
    return GestureDetector(
      onTap: () {
        if (context != null) {
          // Handle navigation or actions if context is available
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPage(buttonText: text)),
          );
        }
      },
      child: Container(
        width: double.infinity,
        height: 80,
        color: color,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget _buildNotesBox(BuildContext context) {
    final TextEditingController noteController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: noteController,
          decoration: const InputDecoration(
            labelText: 'Write your notes here',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            setState(() {
              _savedNote = value; // Save note as user types
            });
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle save action or any action with the note
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Note saved: $_savedNote')),
            );
          },
          child: const Text('Save Note'),
        ),
      ],
    );
  }

  Color _getBackgroundColor(String buttonText) {
    // You can set different background colors for different buttons
    switch (buttonText) {
      case "Predict / Classify":
        return Colors.blue[100]!;
      case "Learn about this":
        return Colors.green[100]!;
      case "Trace evolution / mutation":
        return Colors.yellow[100]!;
      case "3D model":
        return Colors.red[100]!;
      case "Report":
        return Colors.orange[100]!;
      case "Notes":
        return Colors.white; // No dark background for notes
      default:
        return Colors.white;
    }
  }
}
