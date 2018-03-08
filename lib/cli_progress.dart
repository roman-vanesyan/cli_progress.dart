class ProgressBar {
  final List<String> delimiters;
  final String filled;
  final String empty;
  final int width;

  final double total;
  double _current;

  ProgressBar(this.total,
      {this.delimiters = const <String>['[', ']'],
      this.filled = '=',
      this.empty = ' ',
      this.width = 70}) {
    _current = .0;
  }

  double get _coeficient => (_current / total);
  double get current => _current;
  bool get isComplete => width == _current;

  void set(double value) {
    if (value > total) {
      throw new Exception(
          'Bar current value cannot be higher than total value!');
    }

    _current = value;
  }

  String get bar {
    final filledWidth = (width * _coeficient).ceil();
    final emptyWidth = (width - filledWidth).floor();
    final filledBar = filled * filledWidth;
    final emptyBar = empty * emptyWidth;
    final startDelim = delimiters[0];
    final endDelim = delimiters[1];

    return '$startDelim$filledBar$emptyBar$endDelim';
  }

  String _render() {
    return '$bar';
  }

  @override
  String toString() => _render();
}
