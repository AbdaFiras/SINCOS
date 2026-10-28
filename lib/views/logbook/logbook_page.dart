import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../absensi/absensi_page.dart';
import '../dashboard/dashboard_page.dart';
import '../dashboard/dashboard_widgets.dart';
import '../profil/profil_page.dart';
import 'logbook_widgets.dart';

class LogbookPage extends StatefulWidget {
  const LogbookPage({super.key});

  @override
  State<LogbookPage> createState() => _LogbookPageState();
}

class _LogbookPageState extends State<LogbookPage> {
  // Variabel untuk Pilihan Tab Logbook (0 = Tulis Aktivitas, 1 = Riwayat)
  int _tabAktif = 0;

  // Getter Boolean Penanda Tab Tulis Aktif
  bool get _isTulisAktif => _tabAktif == 0;

  // Variabel Indeks Navigasi Bawah (2 = Tab Logbook)
  int _navigasiIndex = 2;

  // Controller Form Input Sesuai Data pada Desain
  late final TextEditingController _tanggalController;
  late final TextEditingController _durasiController;
  late final TextEditingController _judulController;
  late final TextEditingController _deskripsiController;
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _tanggalController = TextEditingController(text: '20 Okt 2026');
    _durasiController = TextEditingController(text: '8 jam');
    _judulController = TextEditingController(text: 'Pembaruan dashboard monitoring');
    _deskripsiController = TextEditingController(
      text: 'Menyusun rancangan dashboard monitoring jaringan, '
          'memvalidasi data aset, dan berdiskusi dengan mentor terkait kebutuhan pengguna.',
    );
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _tanggalController.dispose();
    _durasiController.dispose();
    _judulController.dispose();
    _deskripsiController.dispose();
    _searchController.dispose();
    super.dispose();
  }

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
    } else if (index == 3) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const ProfilPage()),
      );
    } else {
      setState(() {
        _navigasiIndex = index;
      });
    }
  }

  // Fungsi Menampilkan Notifikasi Singkat (Snackbar)
  void _tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(pesan),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
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
              'Logbook harian',
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Dokumentasikan proses belajarmu',
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: 11,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isTulisAktif ? Icons.calendar_month_outlined : Icons.history,
              color: AppColors.textDark,
            ),
            onPressed: () => _tampilkanPesan(
              _isTulisAktif ? 'Membuka kalender logbook...' : 'Riwayat filter logbook...',
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
            // Bagian Tab Switcher Pilihan Logbook
            LogbookWidgets.logbookTabSwitcher(
              tabAktif: _tabAktif,
              onTabBerubah: (index) {
                setState(() {
                  _tabAktif = index;
                });
              },
            ),

            const SizedBox(height: 18),

            // Percabangan Logika Tampilan (Tulis Aktivitas vs Riwayat Logbook)
            if (_isTulisAktif) ...[
              // --- TAMPILAN TAB 1: FORM TULIS AKTIVITAS ---
              // Baris Input Tanggal dan Durasi Berdampingan
              Row(
                children: [
                  Expanded(
                    child: LogbookWidgets.logbookInputField(
                      judulField: 'Tanggal aktivitas',
                      hintText: 'Pilih tanggal',
                      iconKanan: Icons.calendar_today_outlined,
                      controller: _tanggalController,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: LogbookWidgets.logbookInputField(
                      judulField: 'Durasi',
                      hintText: 'Contoh: 8 jam',
                      iconKanan: Icons.access_time,
                      controller: _durasiController,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Bagian Input Judul Kegiatan
              LogbookWidgets.logbookInputField(
                judulField: 'Judul kegiatan',
                hintText: 'Tulis ringkasan kegiatan',
                controller: _judulController,
              ),

              const SizedBox(height: 16),

              // Bagian Input Deskripsi Pekerjaan (Multi Baris)
              LogbookWidgets.logbookInputField(
                judulField: 'Deskripsi pekerjaan',
                hintText: 'Jelaskan rincian aktivitas dan pencapaianmu',
                maxLines: 4,
                controller: _deskripsiController,
              ),

              const SizedBox(height: 16),

              // Bagian Kotak Area Unggah Lampiran
              LogbookWidgets.uploadDocumentCard(
                onPilihFile: () => _tampilkanPesan('Pilih dokumen lampiran...'),
              ),

              const SizedBox(height: 20),

              // Bagian Baris Tombol Aksi (Simpan Draf & Kirim ke Mentor)
              Row(
                children: [
                  // Tombol Simpan Draf
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _tampilkanPesan('Draf logbook berhasil disimpan!'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: AppColors.cardBorder),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Simpan draf',
                        style: TextStyle(
                          color: AppColors.primaryDarkGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Tombol Kirim ke Mentor
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _tampilkanPesan('Logbook terkirim ke mentor!'),
                      icon: const Icon(Icons.send_rounded, size: 18, color: Colors.white),
                      label: const Text(
                        'Kirim ke mentor',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: AppColors.primaryDarkGreen,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Teks Keterangan Peninjau
              const Center(
                child: Text(
                  'Akan ditinjau oleh Budi Santoso · Mentor TI',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textGrey,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Bagian Kotak Riwayat Aktivitas Terakhir
              LogbookWidgets.aktivitasTerakhirSection(
                tanggalDurasi: '19 Okt 2026 · 8 jam',
                judulAktivitas: 'Validasi data aset jaringan',
                feedbackMentor: 'Data sudah sesuai. Kerja bagus, Nabila!',
                onLihatSemua: () {
                  setState(() {
                    _tabAktif = 1; // Pindah ke tab riwayat
                  });
                },
              ),
            ] else ...[
              // --- TAMPILAN TAB 2: RIWAYAT LOGBOOK DINAMIS ---
              // 1. Bar Pencarian dan Tombol Filter
              LogbookWidgets.logbookSearchBar(
                controller: _searchController,
                onFilterTap: () => _tampilkanPesan('Membuka filter logbook...'),
              ),

              const SizedBox(height: 6),

              // 2. Kelompok Bulan Ini: OKTOBER 2026
              LogbookWidgets.logbookSectionHeader('BULAN INI · OKTOBER 2026'),
              LogbookWidgets.logbookHistoryCard(
                tanggalDurasi: '20 Okt 2026 · 8 jam',
                judulAktivitas: 'Pembaruan dashboard monitoring',
                feedbackMentor: 'Data sudah sesuai. Kerja bagus, Nabila!',
                onTap: () => _tampilkanPesan('Membuka detail logbook 20 Okt...'),
              ),
              LogbookWidgets.logbookHistoryCard(
                tanggalDurasi: '19 Okt 2026 · 8 jam',
                judulAktivitas: 'Validasi data aset jaringan',
                feedbackMentor: 'Kerja bagus, pertahankan arsitektur modularnya.',
                onTap: () => _tampilkanPesan('Membuka detail logbook 19 Okt...'),
              ),

              const SizedBox(height: 8),

              // 3. Kelompok Bulan Lalu: SEPTEMBER 2026
              LogbookWidgets.logbookSectionHeader('BULAN LALU · SEPTEMBER 2026'),
              LogbookWidgets.logbookHistoryCard(
                tanggalDurasi: '30 Sep 2026 · 8 jam',
                judulAktivitas: 'Integrasi API push notification',
                onTap: () => _tampilkanPesan('Membuka detail logbook 30 Sep...'),
              ),
            ],

            const SizedBox(height: 20),
          ],
        ),
      ),

      // Bagian Navigasi Bawah (Tab Logbook Aktif)
      bottomNavigationBar: DashboardWidgets.buildBottomNavigationBar(
        currentIndex: _navigasiIndex,
        onTap: _pindahMenuBawah,
      ),
    );
  }
}
