import 'package:progress/progress.dart' show ProgressBar;

void main() {
  final bar = new ProgressBar(10.0);

  for (int i = 0; i <= 10; i++) {
    bar.set(i.toDouble());
    print('$bar');
  }
}
