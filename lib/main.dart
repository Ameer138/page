import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bidding App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        canvasColor: Colors.blueAccent.shade100,
      ),
      home: const MaximumBid(title: 'Bidding App'),
    );
  }
}

class MaximumBid extends StatefulWidget {
  const MaximumBid({super.key, required this.title});
  final String title;

  @override
  State<MaximumBid> createState() => _MaximumBidState();
}

class _MaximumBidState extends State<MaximumBid> {
  double _maxBid = 0.0;

  void _increaseMyMaxBid() {
    setState(() {
      _maxBid += 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(cardColor: Colors.lightGreen),
              child: Card(
                color: Colors.lightGreen,
                child: Text(
                  'Your current bid is \$${_maxBid.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'You have pushed the button to increase the bid:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, // Text color
                backgroundColor: Colors.blue, // Background color
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _increaseMyMaxBid,
          tooltip: 'Increment',
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
      ),
    );
  }
}
