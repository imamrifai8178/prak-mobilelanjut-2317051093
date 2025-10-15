import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk input username dan password
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // FormKey untuk validasi form
  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true; // toggle show/hide password
  bool _isLoading = false; // indikator loading tombol login

  // Fungsi untuk login sederhana (tanpa database)
  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simulasi proses login 1 detik
      Future.delayed(const Duration(seconds: 1), () {
        setState(() => _isLoading = false);

        // Cek username & password
        if (_usernameController.text == "admin" &&
            _passwordController.text == "12345") {
          // Jika benar → pindah ke Dashboard
          Navigator.pushReplacementNamed(context, '/dashboard');
        } else {
          // Jika salah → tampilkan pesan error
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Username atau password salah!"),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Form(
                key: _formKey, // aktifkan validasi form
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Judul login
                    const Text(
                      "Login Aplikasi",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Input Username
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: "Username",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Masukkan username" : null,
                    ),
                    const SizedBox(height: 20),

                    // Input Password
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () =>
                              setState(() => _isObscure = !_isObscure),
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Masukkan password" : null,
                    ),
                    const SizedBox(height: 30),

                    // Tombol Login
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
