import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../absensi/absensi_page.dart';
import '../aduan/aduan_page.dart';
import '../dashboard/dashboard_page.dart';
import '../dashboard/dashboard_widgets.dart';
import '../edit_profil/edit_profil_page.dart';
import '../login/login_page.dart';
import '../logbook/logbook_page.dart';
import 'profil_widgets.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  // Variabel Indeks Navigasi Bawah (3 = Tab Profil)
  int _navigasiIndex = 3;

  // Fungsi Berpindah Menu pada Navigasi Bawah
  void _pindahMenuBawah(int index) {
    if (index == 0) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DashboardPage()),
      );
    } else if (index == 1) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const AbsensiPage()),
      );
    } else if (index == 2) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LogbookPage()),
      );
    } else {
      setState(() {
        _navigasiIndex = index;
      });
    }
  }

  // Fungsi Notifikasi Toast Singkat
  void _tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(pesan),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Fungsi Dialog Konfirmasi Keluar Akun
  void _konfirmasiKeluar() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Keluar dari Akun?'),
        content: const Text('Apakah Anda yakin ingin keluar dari aplikasi SINCOS?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
            ),
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginPage()),
                (route) => false,
              );
            },
            child: const Text(
              'Keluar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,

      // Bagian AppBar Mobile Bawaan
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profil saya',
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Akun dan informasi peserta',
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: 11,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: AppColors.textDark),
            onPressed: () => _tampilkanPesan('Pengaturan akun...'),
          ),
        ],
      ),

      // Bagian Konten yang Dapat Di-scroll
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Panggil ProfilHeaderCard
            ProfilWidgets.profilHeaderCard(
              // Navigasi ke halaman Edit Profil saat tombol Edit diklik
              onEditTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const EditProfilPage()),
                );
              },
            ),

            const SizedBox(height: 20),

            // 2. Judul Bagian dan Card Data Mahasiswa
            const Text(
              'Data mahasiswa',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 12),
            ProfilWidgets.dataMahasiswaCard(
              email: 'nabila.ayu@students.undip.ac.id',
              nim: '24060122130042',
              universitas: 'Universitas Diponegoro',
              programStudi: 'Informatika',
            ),
            const SizedBox(height: 20),

            // 3. Judul Bagian dan Card Penempatan Magang
            const Text(
              'Penempatan magang',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 12),
            ProfilWidgets.penempatanMagangCard(
              lokasi: 'PLN UID Jateng & DIY',
              divisi: 'Teknologi Informasi',
              periode: '01 Sep – 30 Nov 2026',
            ),

            const SizedBox(height: 20),

            // 4. Susunan Ketiga MenuListTile dalam Wadah Bersama
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: Column(
                children: [
                  ProfilWidgets.menuListTile(
                    icon: Icons.verified_user_outlined,
                    judul: 'Keamanan akun',
                    subjudul: 'Ubah kata sandi',
                    onTap: () => _tampilkanPesan('Membuka menu Keamanan Akun...'),
                  ),
                  ProfilWidgets.menuListTile(
                    icon: Icons.bookmark_outline,
                    judul: 'Sertifikat & laporan',
                    onTap: () => _tampilkanPesan('Membuka Sertifikat & Laporan...'),
                  ),
                  ProfilWidgets.menuListTile(
                    icon: Icons.headset_mic_outlined,
                    judul: 'Pusat bantuan & aduan',
                    tampilkanGarisBawah: false,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const AduanPage()),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 5. Tombol Keluar dari Akun Berwarna Merah di Posisi Tengah
            Center(
              child: TextButton.icon(
                onPressed: _konfirmasiKeluar,
                icon: const Icon(
                  Icons.logout_rounded,
                  color: Color(0xFFDC2626),
                  size: 20,
                ),
                label: const Text(
                  'Keluar dari akun',
                  style: TextStyle(
                    color: Color(0xFFDC2626),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // Bagian Navigasi Bawah (Tab Profil Aktif)
      bottomNavigationBar: DashboardWidgets.buildBottomNavigationBar(
        currentIndex: _navigasiIndex,
        onTap: _pindahMenuBawah,
      ),
    );
  }
}