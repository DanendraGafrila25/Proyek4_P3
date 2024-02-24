// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                SizedBox(height: 80.0),
                Column(
                  children: <Widget>[
                    Image.asset('assets/diamond.png'),
                    const SizedBox(height: 16.0),
                    Text(
                      'SHRINE',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                SizedBox(height: 120.0),
                // Remove filled: true values (103)
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    // Removed filled: true
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 12.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    // Removed filled: true
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                // TODO: Add button bar (101)
                OverflowBar(
                  alignment: MainAxisAlignment.end,
                  // TODO: Add a beveled rectangular border to CANCEL (103)
                  children: <Widget>[
                    // TODO: Add buttons (101)
                    TextButton(
                      child: const Text('CANCEL'),
                      onPressed: () {
                        _usernameController.clear();
                        _passwordController.clear();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).colorScheme.secondary,
                        shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        ),
                      ),
                    ),

                    // TODO: Add an elevation to NEXT (103)
                    // TODO: Add a beveled rectangular border to NEXT (103)
                    ElevatedButton(
                      child: const Text('NEXT'),
                      onPressed: () {
                        // Memeriksa apakah kedua kolom terisi sebelum melanjutkan
                        if (_usernameController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          Navigator.pop(context);
                        } else {
                          // Jika tidak terisi, munculkan pesan notifikasi
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Harap isi kolom username dan password'),
                              duration:
                                  Duration(seconds: 2), // Durasi notifikasi
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: kShrineBrown900,
                        backgroundColor: kShrinePink100,
                        elevation: 8.0,
                        shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 20, // Ubah nilai ini sesuai dengan posisi yang diinginkan
              left: 0,
              right: 0,
              child: Container(
                color: const Color(0xFFEAA4A4),
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Dimodifikasi oleh: Dandendra Gafrila, NIM 221511046',
                    style: TextStyle(
                      color: Color(0xFF5D1049),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Add text editing controllers (101)
final _usernameController = TextEditingController();
final _passwordController = TextEditingController();
