import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {

  final storage = new FlutterSecureStorage();

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    String username1 = await storage.read(key: 'username');
    String password1 = await storage.read(key: 'password');

    await Future.delayed(Duration(seconds: 1));
    if (username == username1 && password == password1) {
      return 'token';
    } else {
      return 'Username atau password salah';
    }
  }

  Future<void> deleteToken() async {
    // menghapus dari keystore/keychain
    await storage.delete(key: 'token');
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    // memasukkan ke keystore/keychain
    await storage.write(key: 'token', value: token);
    await Future.delayed(Duration(seconds: 1)) ;
    return;
  }

  Future<bool> hasToken() async {
    // membaca dari keystore/keychain
    String token = await storage.read(key: 'token');
    
    await Future.delayed(Duration(seconds: 1));
    if (token == 'token') {
      return true;
    } else {
      return false;
    }
  }
}

