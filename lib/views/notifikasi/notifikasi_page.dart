import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../absensi/absensi_page.dart';
import '../dashboard/dashboard_page.dart';
import '../dashboard/dashboard_widgets.dart';
import '../logbook/logbook_page.dart';
import '../profil/profil_page.dart';
import 'notifikasi_widgets.dart';

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({super.key});

  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  // Status Apakah Masih Ada Notifikasi Belum Dibaca
  bool _adaNotifikasiBaru = true;

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
    } else if (index == 3) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const ProfilPage()),
      );
    }
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

  // Fungsi Tandai Semua Notifikasi Sudah Dibaca
  void _tandaiSemuaDibaca() {
    setState(() {
      _adaNotifikasiBaru = false;
    });
    _tampilkanPesan('Semua notifikasi telah ditandai dibaca');
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
              'Notifikasi',
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Kabar terbaru perjalanan magangmu',
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: 11,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined, color: AppColors.textDark),
            onPressed: () => _tampilkanPesan('Pengaturan notifikasi...'),
          ),
        ],
      ),

      // Bagian Konten yang Dapat Di-scroll
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Baris Header: Teks Semua Notifikasi, Badge, dan Tombol Tandai Dibaca
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Semua notifikasi',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (_adaNotifikasiBaru)
                      NotifikasiWidgets.notificationBadge(jumlah: '3 baru'),
                  ],
                ),
                InkWell(
                  onTap: _tandaiSemuaDibaca,
                  borderRadius: BorderRadius.circular(4),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Text(
                      'Tandai dibaca',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDarkGreen,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Kelompok Waktu: HARI INI · 20 OKT 2026
            NotifikasiWidgets.sectionHeader('HARI INI · 20 OKT 2026'),

            // Notifikasi 1: Briefing Evaluasi Tengah Magang
            NotifikasiWidgets.notificationItemCard(
              icon: Icons.campaign_outlined,
              iconBgColor: AppColors.accentAmber,
              iconColor: AppColors.accentAmberText,
              judul: 'Briefing evaluasi tengah magang',
              deskripsi: 'Besok pukul 09.00 WIB di Ruang Rapat 2. Siapkan ringkasan progres magangmu.',
              kategoriWaktu: 'Pengumuman · 1 jam lalu',
              isUnread: _adaNotifikasiBaru,
              onTap: () => _tampilkanPesan('Membuka detail pengumuman briefing...'),
            ),

            // Notifikasi 2: Logbook Kamu Disetujui
            NotifikasiWidgets.notificationItemCard(
              icon: Icons.edit_note_outlined,
              judul: 'Logbook kamu disetujui',
              deskripsi: 'Budi Santoso menyetujui aktivitas ”Validasi data aset jaringan” tanggal 19 Oktober.',
              kategoriWaktu: 'Logbook · 2 jam lalu',
              isUnread: _adaNotifikasiBaru,
              onTap: () => _tampilkanPesan('Membuka detail logbook...'),
            ),

            // Notifikasi 3: Jangan Lupa Absensi Hari Ini
            NotifikasiWidgets.notificationItemCard(
              icon: Icons.location_on_outlined,
              judul: 'Jangan lupa absensi hari ini',
              deskripsi: 'Catat kehadiran saat berada dalam radius 50 meter dari kantor penempatanmu.',
              kategoriWaktu: 'Absensi · 08.00 WIB',
              isUnread: _adaNotifikasiBaru,
              onTap: () => _tampilkanPesan('Membuka halaman absensi...'),
            ),

            const SizedBox(height: 14),

            // Kelompok Waktu: KEMARIN · 19 OKT 2026
            NotifikasiWidgets.sectionHeader('KEMARIN · 19 OKT 2026'),

            // Notifikasi 4: Aduan Sedang Ditangani
            NotifikasiWidgets.notificationItemCard(
              icon: Icons.headset_mic_outlined,
              judul: 'Aduan sedang ditangani',
              deskripsi: 'Tim TI sedang memeriksa kendala unggah lampiran pada aduan ADU-0261.',
              kategoriWaktu: 'Aduan · 15.20 WIB',
              isUnread: false,
              onTap: () => _tampilkanPesan('Membuka status aduan...'),
            ),

            // Notifikasi 5: Rekap September Tersedia
            NotifikasiWidgets.notificationItemCard(
              icon: Icons.description_outlined,
              judul: 'Rekap September tersedia',
              deskripsi: 'Ringkasan kehadiran dan aktivitas bulananmu sudah dapat diunduh di menu laporan.',
              kategoriWaktu: 'Laporan · 10.15 WIB',
              isUnread: false,
              onTap: () => _tampilkanPesan('Membuka rekap laporan...'),
            ),

            const SizedBox(height: 18),

            // Pesan Penutup di Bagian Bawah
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.done_all,
                    size: 16,
                    color: AppColors.textGrey,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Kamu sudah melihat semua notifikasi terbaru.',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // Bagian Navigasi Bawah
      bottomNavigationBar: DashboardWidgets.buildBottomNavigationBar(
        currentIndex: 0,
        onTap: _pindahMenuBawah,
      ),
    );
  }
}

