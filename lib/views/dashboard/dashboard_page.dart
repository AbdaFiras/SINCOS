import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../absensi/absensi_page.dart';
import '../aduan/aduan_page.dart';
import '../logbook/logbook_page.dart';
import '../notifikasi/notifikasi_page.dart';
import '../profil/profil_page.dart';
import 'dashboard_widgets.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentNavIndex = 0;

  void _navigateToAbsensi() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AbsensiPage()),
    );
  }

  void _navigateToLogbook() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const LogbookPage()),
    );
  }

  void _navigateToProfil() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ProfilPage()),
    );
  }

  // Fungsi navigasi membuka halaman Notifikasi saat ikon lonceng diklik
  void _navigateToNotifikasi() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const NotifikasiPage()),
    );
  }

  // Fungsi navigasi membuka halaman Aduan saat menu Aduan diklik
  void _navigateToAduan() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AduanPage()),
    );
  }

  void _handleNavTap(int index) {
    if (index == 1) {
      _navigateToAbsensi();
    } else if (index == 2) {
      _navigateToLogbook();
    } else if (index == 3) {
      _navigateToProfil();
    } else {
      setState(() {
        _currentNavIndex = index;
      });
    }
  }

  void _showFeatureToast(String featureName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Membuka menu $featureName...'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Section (Warna Hijau Tua #005944)
            DashboardWidgets.buildHeaderSection(
              nama: 'Nabila',
              tanggal: 'Selasa, 20 Oktober 2026',
              // Navigasi ke halaman Notifikasi saat ikon lonceng diklik
              onNotificationTap: _navigateToNotifikasi,
            ),

            // 2. Area Konten Utama Berpadding Responsif
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // 3. Card Program Magang Aktif
                  DashboardWidgets.buildProgramMagangCard(
                    programTitle: 'PLN UID Jawa Tengah & DIY',
                    divisiLokasi: 'Divisi Teknologi Informasi · Semarang',
                    periode: '01 Sep – 30 Nov 2026',
                    mingguStatus: 'Minggu 8 dari 13',
                    progres: 8 / 13, // ~61.5%
                  ),

                  const SizedBox(height: 16),

                  // 4. Grid Statistik (Hari Hadir & Logbook Disetujui)
                  DashboardWidgets.buildStatGrid(
                    hariHadir: 34,
                    logbookDisetujui: 32,
                  ),

                  const SizedBox(height: 22),

                  // 5. Menu Akses Cepat (Absensi, Logbook, Sertifikat, Aduan)
                  DashboardWidgets.buildAksesCepatMenu(
                    onAbsensiTap: _navigateToAbsensi,
                    onLogbookTap: _navigateToLogbook,
                    onSertifikatTap: () => _showFeatureToast('Sertifikat'),
                    // Navigasi ke halaman Aduan saat menu Aduan diklik
                    onAduanTap: _navigateToAduan,
                  ),

                  const SizedBox(height: 22),

                  // 6. List Pengumuman & Banner Pengingat Masuk
                  DashboardWidgets.buildPengumumanList(
                    onLihatSemuaTap: () => _showFeatureToast('Semua Pengumuman'),
                    onBriefingTap: () => _showFeatureToast('Detail Briefing Evaluasi'),
                    onKeamananTap: () => _showFeatureToast('Panduan Keamanan Informasi'),
                    onBannerAbsenTap: _navigateToAbsensi,
                  ),

                  const SizedBox(height: 28),
                ],
              ),
            ),
          ],
        ),
      ),

      // 7. Bottom Navigation Bar Presisi
      bottomNavigationBar: DashboardWidgets.buildBottomNavigationBar(
        currentIndex: _currentNavIndex,
        onTap: _handleNavTap,
      ),
    );
  }
}