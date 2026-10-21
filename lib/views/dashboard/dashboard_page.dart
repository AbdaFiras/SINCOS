import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../absensi/absensi_page.dart';
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

  void _handleNavTap(int index) {
    if (index == 1) {
      _navigateToAbsensi();
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
              onNotificationTap: () => _showFeatureToast('Notifikasi'),
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
                    onLogbookTap: () => _showFeatureToast('Logbook'),
                    onSertifikatTap: () => _showFeatureToast('Sertifikat'),
                    onAduanTap: () => _showFeatureToast('Aduan'),
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