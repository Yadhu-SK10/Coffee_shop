import 'package:flutter/material.dart';

class ProgressInt extends StatefulWidget {
  const ProgressInt({super.key});

  @override
  State<ProgressInt> createState() => _ProgressIntState();
}

class _ProgressIntState extends State<ProgressInt> {
  double progress = 0.0;
  void increment() {
    setState(() {

    });
  }

  void decrement() {
    setState(() {
      if (progress > 0) {
        progress -= 0.1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
          height: 812,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Stack(
                children: [
                  Container(
                    height: 12,
                    width: 300,
                    decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(12)),
                  ),
                  AnimatedContainer(
                    alignment: Alignment.topLeft,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    width: 300*progress.clamp(0,1),
                    height: 12,
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(12)),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: increment,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.add, color: Colors.black),
                    ),
                  ),

                  const SizedBox(width: 50),

                  GestureDetector(
                    onTap: decrement,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.remove, color: Colors.black),
                    ),
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
