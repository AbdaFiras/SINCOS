import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'perizinan_widgets.dart';

class PerizinanPage extends StatefulWidget {
  const PerizinanPage({super.key});

  @override
  State<PerizinanPage> createState() => _PerizinanPageState();
}

class _PerizinanPageState extends State<PerizinanPage> {
  // Pilihan Tipe Izin (0 = Sakit, 1 = Izin Lainnya)
  int _tipeIzin = 0;

  // Controller Form Input Perizinan
  late final TextEditingController _tanggalMulaiController;
  late final TextEditingController _tanggalSelesaiController;
  late final TextEditingController _alasanController;

  @override
  void initState() {
    super.initState();
    _tanggalMulaiController = TextEditingController();
    _tanggalSelesaiController = TextEditingController();
    _alasanController = TextEditingController();
  }

  @override
  void dispose() {
    _tanggalMulaiController.dispose();
    _tanggalSelesaiController.dispose();
    _alasanController.dispose();
    super.dispose();
  }

  // Fungsi Pemilih Tanggal Kalender
  Future<void> _pilihTanggal(TextEditingController controller) async {
    final DateTime? hasil = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryTeal,
              onPrimary: Colors.white,
              onSurface: AppColors.textDark,
            ),
          ),
          child: child!,
        );
      },
    );

    if (hasil != null) {
      final String hari = hasil.day.toString().padLeft(2, '0');
      final String bulan = hasil.month.toString().padLeft(2, '0');
      final String tahun = hasil.year.toString();
      setState(() {
        controller.text = '$hari/$bulan/$tahun';
      });
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

  // Fungsi Kirim Pengajuan Izin
  void _kirimPengajuan() {
    _tampilkanPesan('Pengajuan izin berhasil dikirimkan!');
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
          'Form Perizinan',
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Bagian Konten Form Perizinan
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Toggle Tipe Perizinan (Sakit / Izin Lainnya)
            PerizinanWidgets.perizinanTypeSwitcher(
              tipeAktif: _tipeIzin,
              onTipeChanged: (index) {
                setState(() {
                  _tipeIzin = index;
                });
              },
            ),

            const SizedBox(height: 18),

            // 2. Baris Tanggal Mulai dan Tanggal Selesai
            Row(
              children: [
                Expanded(
                  child: PerizinanWidgets.perizinanInputField(
                    label: 'Tanggal Mulai',
                    hintText: 'DD/MM/YYYY',
                    suffixIcon: Icons.calendar_today_outlined,
                    controller: _tanggalMulaiController,
                    readOnly: true,
                    onTap: () => _pilihTanggal(_tanggalMulaiController),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PerizinanWidgets.perizinanInputField(
                    label: 'Tanggal Selesai',
                    hintText: 'DD/MM/YYYY',
                    suffixIcon: Icons.calendar_today_outlined,
                    controller: _tanggalSelesaiController,
                    readOnly: true,
                    onTap: () => _pilihTanggal(_tanggalSelesaiController),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 3. Kolom Alasan / Keterangan (Multi-Line)
            PerizinanWidgets.perizinanInputField(
              label: 'Alasan / Keterangan',
              hintText: 'Tuliskan alasan pengajuan Anda...',
              maxLines: 5,
              controller: _alasanController,
            ),

            const SizedBox(height: 18),

            // 4. Area Unggah Surat Dokter / Bukti Pendukung
            PerizinanWidgets.medicalUploadCard(
              onTap: () => _tampilkanPesan('Pilih file surat dokter / bukti pendukung...'),
            ),

            const SizedBox(height: 24),

            // 5. Tombol Besar Kirim Pengajuan Izin
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _kirimPengajuan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryTeal,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Kirim Pengajuan Izin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

