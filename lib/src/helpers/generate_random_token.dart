import 'dart:math';

const String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));