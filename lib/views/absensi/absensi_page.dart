import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../dashboard/dashboard_page.dart';
import '../dashboard/dashboard_widgets.dart';
import '../logbook/logbook_page.dart';
import '../perizinan/perizinan_page.dart';
import '../profil/profil_page.dart';
import 'absensi_widgets.dart';

class AbsensiPage extends StatefulWidget {
  const AbsensiPage({super.key});

  @override
  State<AbsensiPage> createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  int _selectedStatusIndex = 0; // Default: 0 (Hadir)
  int _currentNavIndex = 1;     // Tab Absensi aktif

  void _handleNavTap(int index) {
    if (index == 0) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DashboardPage()),
      );
    } else if (index == 2) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LogbookPage()),
      );
    } else if (index == 3) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const ProfilPage()),
      );
    } else {
      setState(() {
        _currentNavIndex = index;
      });
    }
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header (AppBar + Info Tanggal & Jam Kerja)
              AbsensiWidgets.buildAbsensiHeader(
                context: context,
                onHistoryTap: () => _showToast('Membuka riwayat absensi...'),
              ),

              const SizedBox(height: 16),

              // 2. Mockup Visual Peta GPS Kantor
              AbsensiWidgets.buildMapMockupView(),

              const SizedBox(height: 18),

              // 3. Grid Status Kehadiran (Looping .map)
              AbsensiWidgets.buildStatusKehadiranGrid(
                selectedIndex: _selectedStatusIndex,
                onSelect: (index) {
                  setState(() {
                    _selectedStatusIndex = index;
                  });
                },
              ),

              const SizedBox(height: 22),

              // 4. Tombol Aksi Absen Masuk
              AbsensiWidgets.buildAbsenButton(
                onPressed: () => _showToast('Absensi masuk berhasil dicatat!'),
              ),

              const SizedBox(height: 16),

              // Tombol Pintas Pengajuan Izin atau Sakit
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const PerizinanPage()),
                    );
                  },
                  child: const Text(
                    'Berhalangan hadir? Ajukan izin atau sakit di sini',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryTeal,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // 5. Catatan Hari Ini (ListTile Masuk & Pulang)
              AbsensiWidgets.buildCatatanHariIniCard(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // 6. Bottom Navigation Bar dengan Tab Absensi Aktif
      bottomNavigationBar: DashboardWidgets.buildBottomNavigationBar(
        currentIndex: _currentNavIndex,
        onTap: _handleNavTap,
      ),
    );
  }
}