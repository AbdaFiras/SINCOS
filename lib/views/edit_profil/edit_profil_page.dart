import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'edit_profil_widgets.dart';

class EditProfilPage extends StatefulWidget {
  const EditProfilPage({super.key});

  @override
  State<EditProfilPage> createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  // Controller Kolom yang Dapat Diedit
  late final TextEditingController _namaController;
  late final TextEditingController _teleponController;
  late final TextEditingController _emailController;

  // Controller Kolom Terkunci (Keamanan Data)
  late final TextEditingController _nimController;
  late final TextEditingController _universitasController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: 'Nabila Ayu Putri');
    _teleponController = TextEditingController(text: '081234567890');
    _emailController = TextEditingController(text: 'nabila.ayu@students.undip.ac.id');
    _nimController = TextEditingController(text: '24060122130042');
    _universitasController = TextEditingController(text: 'Universitas Diponegoro');
  }

  @override
  void dispose() {
    _namaController.dispose();
    _teleponController.dispose();
    _emailController.dispose();
    _nimController.dispose();
    _universitasController.dispose();
    super.dispose();
  }

  // Fungsi Menampilkan Notifikasi Toast Singkat
  void _tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(pesan),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Fungsi Simpan Perubahan Profil
  void _simpanProfil() {
    _tampilkanPesan('Perubahan profil berhasil disimpan!');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Bagian AppBar Mobile
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'Edit profil',
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // Tombol Simpan Berwarna Teal dengan Area Sentuh Minimal 48x48px
          InkWell(
            onTap: _simpanProfil,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
              child: const Text(
                'Simpan',
                style: TextStyle(
                  color: AppColors.primaryTeal,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),

      // Bagian Konten yang Dapat Di-scroll
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Bagian Avatar Foto Profil
            EditProfilWidgets.avatarEditor(
              onUbahFoto: () => _tampilkanPesan('Pilih foto profil baru...'),
            ),

            const SizedBox(height: 24),

            // 2. Kolom Input Nama Lengkap (Bisa Diedit)
            EditProfilWidgets.editInputField(
              label: 'Nama Lengkap',
              controller: _namaController,
            ),

            const SizedBox(height: 16),

            // 3. Kolom Input Nomor Telepon (Bisa Diedit)
            EditProfilWidgets.editInputField(
              label: 'Nomor Telepon',
              controller: _teleponController,
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 16),

            // 4. Kolom Input Email (Bisa Diedit)
            EditProfilWidgets.editInputField(
              label: 'Email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 16),

            // 5. Kolom Terkunci NIM (Keamanan Data)
            EditProfilWidgets.editInputField(
              label: 'NIM',
              controller: _nimController,
              enabled: false,
            ),

            const SizedBox(height: 16),

            // 6. Kolom Terkunci Universitas (Keamanan Data)
            EditProfilWidgets.editInputField(
              label: 'Universitas',
              controller: _universitasController,
              enabled: false,
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

