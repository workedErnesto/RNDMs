import 'dart:io';

void main() async {
  final directory = Directory('lib');
  
  if (!await directory.exists()) {
    print('Папка lib не найдена!');
    return;
  }

  int totalLines = 0;
  int fileCount = 0;

  await for (var entity in directory.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      final lines = await entity.readAsLines();
      totalLines += lines.length;
      fileCount++;
    }
  }

  print('--- Результат ---');
  print('Всего файлов: $fileCount');
  print('Всего строк кода: $totalLines');
}