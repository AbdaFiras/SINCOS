import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../absensi/absensi_page.dart';
import '../dashboard/dashboard_page.dart';
import '../dashboard/dashboard_widgets.dart';
import '../logbook/logbook_page.dart';
import '../profil/profil_page.dart';
import 'aduan_widgets.dart';

class AduanPage extends StatefulWidget {
  const AduanPage({super.key});

  @override
  State<AduanPage> createState() => _AduanPageState();
}

class _AduanPageState extends State<AduanPage> {
  // Pilihan Kategori Masalah Terpilih
  String _kategoriTerpilih = 'Absensi & lokasi GPS';

  // Daftar Opsi Kategori Masalah
  final List<String> _daftarKategori = [
    'Absensi & lokasi GPS',
    'Logbook & laporan',
    'Akun & profil',
    'Lainnya',
  ];

  // Controller Form Input Aduan
  late final TextEditingController _judulController;
  late final TextEditingController _deskripsiController;

  // Status Apakah File Lampiran Masih Ada
  bool _lampiranTersedia = true;

  @override
  void initState() {
    super.initState();
    _judulController = TextEditingController(text: 'Lokasi GPS sering bergeser');
    _deskripsiController = TextEditingController(
      text: 'Lokasi GPS beberapa kali bergeser ke luar kantor saat saya berada di area kerja. '
          'Mohon pengecekan akurasi agar absensi tetap tercatat.',
    );
  }

  @override
  void dispose() {
    _judulController.dispose();
    _deskripsiController.dispose();
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
              'Aduan masalah',
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Kami siap membantu kendalamu',
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: 11,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: AppColors.textDark),
            onPressed: () => _tampilkanPesan('Membuka Pusat Bantuan FAQ...'),
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
            // 1. Banner Info Hijau Layanan Aduan
            AduanWidgets.infoBanner(),

            const SizedBox(height: 18),

            // 2. Dropdown Pilihan Kategori Masalah
            AduanWidgets.aduanDropdownField(
              value: _kategoriTerpilih,
              items: _daftarKategori,
              onChanged: (baru) {
                if (baru != null) {
                  setState(() {
                    _kategoriTerpilih = baru;
                  });
                }
              },
            ),

            const SizedBox(height: 16),

            // 3. Input Judul Aduan
            AduanWidgets.aduanInputField(
              judulField: 'Judul aduan',
              hintText: 'Tulis ringkasan masalah',
              controller: _judulController,
            ),

            const SizedBox(height: 16),

            // 4. Input Ceritakan Masalahmu (Multi-Line)
            AduanWidgets.aduanInputField(
              judulField: 'Ceritakan masalahmu',
              hintText: 'Jelaskan secara detail kendala yang dialami...',
              maxLines: 4,
              controller: _deskripsiController,
            ),

            const SizedBox(height: 16),

            // 5. Bukti Pendukung File Berhasil Diunggah
            if (_lampiranTersedia)
              AduanWidgets.uploadedFileCard(
                namaFile: 'bukti-lokasi.png',
                infoUkuranStatus: '248 KB · Berhasil diunggah',
                onHapus: () {
                  setState(() {
                    _lampiranTersedia = false;
                  });
                  _tampilkanPesan('Lampiran dihapus');
                },
              ),

            const SizedBox(height: 20),

            // 6. Tombol Besar Kirim Aduan
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () => _tampilkanPesan('Aduanmu berhasil dikirim!'),
                icon: const Icon(Icons.send_rounded, size: 18, color: Colors.white),
                label: const Text(
                  'Kirim aduan',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryDarkGreen,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // 7. Teks Proteksi Kecil di Bawah Tombol
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shield_outlined,
                    size: 14,
                    color: AppColors.textGrey,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Hanya kamu dan petugas terkait yang melihat aduan.',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 8. Card Aduan Terakhir Bagian Bawah
            AduanWidgets.aduanHistoryCard(
              idTanggal: 'ADU-0261 · 19 Okt 2026',
              judulAduan: 'Lampiran logbook gagal diunggah',
              responPetugas: 'Tim TI sedang memeriksa kendala.',
              onTap: () => _tampilkanPesan('Membuka detail aduan ADU-0261...'),
              onLihatRiwayat: () => _tampilkanPesan('Membuka seluruh riwayat aduan...'),
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

