import 'dart:io';

main(List<String> args) {
  if (args.isEmpty) {
    return print(
        'argumentos no especificados \n e para encriptar \n d para desencriptar');
  }

  if (args[0] != 'd' && args[0] != 'e') {
    return print('opcion no valida \n e para encriptar \n d para desencriptar');
  }

  if (args.length == 1) {
    return print('ingrese el directorio del archivo');
  }

  if (args.length == 2) {
    return print('ingrese el nombre del archivo');
  }

  final fileNameToRead = args[1];
  final nombreArchivo = args[2];

  if (args[0] == 'e') encriptar(fileNameToRead, nombreArchivo);
  if (args[0] == 'd') desencriptar(fileNameToRead, nombreArchivo);
}

void encriptar(String toRead, String toWrite) {
  String abc = 'abcdefghijklmnñopqrstuvwxyz1234567890 \n';
  String zyx = 'zyxwvutsrqpoñnmlkjihgfedcba0987654321 \n';
  String enc = '';
  bool found;
  new File(toRead).readAsString().then((String content) {
    String minus = content.toLowerCase();
    for (var i = 0; i < minus.length; i++) {
      found = false;
      for (var j = 0; j < abc.length; j++) {
        if (minus[i] == abc[j]) {
          enc += zyx[j];
          found = true;
        }
      }
      if (found == false) enc += minus[i];
    }
    final fileName = './$toWrite.txt';
    new File(fileName).writeAsString(enc).then((File file) {
      print('archivo encriptado');
    });
  });
}

void desencriptar(String toRead, String toWrite) {
  String abc = 'abcdefghijklmnñopqrstuvwxyz1234567890 \n';
  String zyx = 'zyxwvutsrqpoñnmlkjihgfedcba0987654321 \n';
  String desenc = '';
  bool found;
  new File(toRead).readAsString().then((String content) {
    String minus = content.toLowerCase();
    for (var i = 0; i < minus.length; i++) {
      found = false;
      for (var j = 0; j < zyx.length; j++) {
        if (minus[i] == zyx[j]) {
          desenc += abc[j];
          found = true;
        }
      }
      if (found == false) desenc += minus[i];
    }
    final fileName = './$toWrite.txt';
    new File(fileName).writeAsString(desenc).then((File file) {
      print('archivo traducido');
    });
  });
}
