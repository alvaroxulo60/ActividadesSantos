import 'dart:math';

import 'package:flutter/material.dart';

import 'app_texts.dart';
import 'result_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final Random _random = Random();
  String _name = '';
  int _lastDie = 0;
  int _total = 0;
  int _totalled = 0;
  final int _lanzTotal = 5;

  bool get _hasName => _name.trim().isNotEmpty;

  void _roll() {
    if (!_hasName) return;
    setState(() {
      _totalled += 1;
      _lastDie = _random.nextInt(6) + 1;
      _total += _lastDie;
    });
  }

  void _reset() {
    setState(() {
      _lastDie = 0;
      _total = 0;
      _totalled = 0;
    });
  }

  void _finish() {
    if (!_hasName) return;
    FocusScope.of(context).unfocus();
    Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (context) =>
            ResultScreen(playerName: _name.trim(), total: _total),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppTexts.title)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: AppTexts.nameLabel,
                      helperText: AppTexts.nameHelp,
                      helperMaxLines: 3,
                    ),
                    onChanged: (value) => setState(() => _name = value),
                  ),
                  const SizedBox(height: 24),
                  Text(AppTexts.lastDie(_lastDie)),
                  const SizedBox(height: 12),
                  Text(AppTexts.total(_total)),
                  const SizedBox(height: 12),
                  Text(AppTexts.totalDices(_totalled)),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _hasName && _totalled < _lanzTotal
                        ? _roll
                        : null,
                    child: const Text(AppTexts.roll),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: _hasName ? _finish : null,
                    child: const Text(AppTexts.finish),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: _totalled == 5 ? _reset : null,
                    child: const Text(AppTexts.reset),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
