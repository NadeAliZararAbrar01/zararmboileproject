

import 'package:flutter/material.dart';

class TasbeehCounterScreen extends StatefulWidget {
  const TasbeehCounterScreen({super.key});

  @override
  State<TasbeehCounterScreen> createState() =>
      _TasbeehCounterScreenState();
}

class _TasbeehCounterScreenState
    extends State<TasbeehCounterScreen> {
  int _count = 0;
  int _target = 33;

  final List<int> _targets = [33, 99, 100, 1000];

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  double get _progress {
    return (_count / _target).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final bool isComplete = _count >= _target;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Tasbeeh'),
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Select target
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Target: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  DropdownButton<int>(
                    value: _target,
                    items: _targets.map((target) {
                      return DropdownMenuItem<int>(
                        value: target,
                        child: Text('$target'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _target = value;
                          _count = 0;
                        });
                      }
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Circular progress and current count
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      value: _progress,
                      strokeWidth: 12,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                      AlwaysStoppedAnimation<Color>(
                        isComplete
                            ? Colors.green
                            : Colors.teal,
                      ),
                    ),
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$_count',
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: isComplete
                              ? Colors.green
                              : (isDark
                              ? Colors.white
                              : Colors.teal[900]),
                        ),
                      ),
                      Text(
                        '/ $_target',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Show message after reaching target
              if (isComplete)
                const Text(
                  'Alhamdulillah! Target reached 🎉',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

              const SizedBox(height: 30),

              // Main counting button
              GestureDetector(
                onTap: _increment,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.teal.shade600,
                        Colors.teal.shade800,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withValues(alpha: 0.3),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 56,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Reset counter
              OutlinedButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text('Reset'),
                onPressed: _reset,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
