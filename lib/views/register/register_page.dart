import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'register_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _nimController = TextEditingController();
  final _prodiController = TextEditingController();
  final _univController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _nimController.dispose();
    _prodiController.dispose();
    _univController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.primaryTeal.withOpacity(0.1), 
                borderRadius: BorderRadius.circular(6)
              ),
              child: const Icon(Icons.bolt, color: AppColors.primaryTeal, size: 16),
            ),
            const SizedBox(width: 8),
            const Text('SINCOS', style: TextStyle(color: AppColors.primaryTeal, fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Bantuan', style: TextStyle(color: AppColors.primaryTeal, fontSize: 13, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Mulai perjalananmu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDark)),
              const SizedBox(height: 8),
              const Text('Daftarkan akun mahasiswa untuk terhubung dengan program magang.', style: TextStyle(fontSize: 13, color: AppColors.textGrey, height: 1.4)),
              const SizedBox(height: 20),

              RegisterWidgets.buildInfoBanner(),
              const SizedBox(height: 24),

              RegisterWidgets.buildLabel('Nama lengkap'),
              TextField(
                controller: _fullNameController, 
                decoration: RegisterWidgets.inputDecoration(hint: 'Nabila Ayu Putri')
              ),
              const SizedBox(height: 16),

              RegisterWidgets.buildLabel('Email mahasiswa'),
              TextField(
                controller: _emailController, 
                keyboardType: TextInputType.emailAddress, 
                decoration: RegisterWidgets.inputDecoration(hint: 'nabila.ayu@students.undip.ac.id', suffixIcon: Icons.mail_outline)
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegisterWidgets.buildLabel('NIM'),
                        TextField(
                          controller: _nimController, 
                          keyboardType: TextInputType.number, 
                          decoration: RegisterWidgets.inputDecoration(hint: '24060122130042')
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegisterWidgets.buildLabel('Program studi'),
                        TextField(
                          controller: _prodiController, 
                          decoration: RegisterWidgets.inputDecoration(hint: 'Informatika')
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              RegisterWidgets.buildLabel('Asal universitas'),
              TextField(
                controller: _univController, 
                decoration: RegisterWidgets.inputDecoration(hint: 'Universitas Diponegoro')
              ),
              const SizedBox(height: 16),

              RegisterWidgets.buildLabel('Kata sandi'),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: RegisterWidgets.inputDecoration(
                  hint: '••••••••••••',
                  suffixWidget: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: AppColors.textGrey, size: 20),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Text('Minimal 8 karakter, kombinasi huruf dan angka.', style: TextStyle(fontSize: 11, color: AppColors.textGrey)),
              const SizedBox(height: 16),

              RegisterWidgets.buildLabel('Konfirmasi kata sandi'),
              TextField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: RegisterWidgets.inputDecoration(
                  hint: '••••••••••••',
                  suffixWidget: IconButton(
                    icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility, color: AppColors.textGrey, size: 20),
                    onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20, height: 20,
                    child: Checkbox(
                      value: _agreeToTerms, 
                      activeColor: AppColors.primaryTeal, 
                      onChanged: (val) => setState(() => _agreeToTerms = val ?? false)
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text('Saya menyetujui Syarat & Ketentuan serta Kebijakan Privasi penggunaan portal magang.', style: TextStyle(fontSize: 12, color: AppColors.textGrey, height: 1.4)),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity, height: 50,
                child: ElevatedButton(
                  onPressed: _agreeToTerms ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryTeal, 
                    foregroundColor: Colors.white, 
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
                    elevation: 0
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      Icon(Icons.arrow_forward, size: 20), 
                      SizedBox(width: 8), 
                      Text('Daftar akun mahasiswa', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                    ]
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sudah punya akun? ', style: TextStyle(fontSize: 13, color: AppColors.textGrey)),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text('Masuk di sini', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.primaryTeal)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}