import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class LogbookWidgets {
  // Widget Cetakan Input Teks Serbaguna (Tanggal, Durasi, Judul, Deskripsi)
  static Widget logbookInputField({
    required String judulField,
    required String hintText,
    IconData? iconKanan,
    int maxLines = 1,
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label Judul Kolom Input
        Text(
          judulField,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),

        // Kotak Kolom Input Teks
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textDark,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 13,
              color: AppColors.textGrey,
            ),
            suffixIcon: iconKanan != null
                ? Icon(iconKanan, color: AppColors.textGrey, size: 20)
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.cardBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.cardBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryDarkGreen,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget Tombol Pilihan Tab Horizontal (Tulis Aktivitas / Riwayat Logbook)
  static Widget logbookTabSwitcher({
    required int tabAktif,
    required ValueChanged<int> onTabBerubah,
  }) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surfaceGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Pilihan Tab 1: Tulis Aktivitas
          Expanded(
            child: GestureDetector(
              onTap: () => onTabBerubah(0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: tabAktif == 0 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: tabAktif == 0
                      ? const [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  'Tulis aktivitas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: tabAktif == 0
                        ? AppColors.primaryDarkGreen
                        : AppColors.textGrey,
                  ),
                ),
              ),
            ),
          ),

          // Pilihan Tab 2: Riwayat Logbook
          Expanded(
            child: GestureDetector(
              onTap: () => onTabBerubah(1),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: tabAktif == 1 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: tabAktif == 1
                      ? const [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  'Riwayat logbook',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: tabAktif == 1
                        ? AppColors.primaryDarkGreen
                        : AppColors.textGrey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget Kotak Area Unggah Lampiran Dokumen
  static Widget uploadDocumentCard({VoidCallback? onPilihFile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label Judul Lampiran
        const Text(
          'Lampiran (opsional)',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),

        // Kotak Area Klik Unggah File
        InkWell(
          onTap: onPilihFile,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.cardBorder,
                style: BorderStyle.solid,
              ),
            ),
            child: const Row(
              children: [
                // Ikon Awan Upload
                Icon(
                  Icons.cloud_upload_outlined,
                  color: AppColors.primaryDarkGreen,
                  size: 26,
                ),
                SizedBox(width: 12),

                // Teks Keterangan Upload File
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Unggah dokumentasi',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDarkGreen,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'JPG, PNG, atau PDF · Maks. 5 MB',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                // Ikon Tambah (+) di Kanan
                Icon(
                  Icons.add,
                  color: AppColors.primaryDarkGreen,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Widget Bar Pencarian Logbook Bulat dengan Tombol Filter di Kanan
  static Widget logbookSearchBar({
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    VoidCallback? onFilterTap,
  }) {
    return Row(
      children: [
        // Kotak Input Pencarian
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(fontSize: 13, color: AppColors.textDark),
              decoration: const InputDecoration(
                hintText: 'Cari aktivitas logbook',
                hintStyle: TextStyle(fontSize: 13, color: AppColors.textGrey),
                prefixIcon: Icon(Icons.search, color: AppColors.textGrey, size: 20),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Tombol Filter Kustom Slider
        InkWell(
          onTap: onFilterTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: const Icon(
              Icons.tune,
              color: AppColors.primaryDarkGreen,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  // Widget Header Penanda Kelompok Bulan (Contoh: BULAN INI · OKTOBER 2026)
  static Widget logbookSectionHeader(String judulKelompok) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 10),
      child: Text(
        judulKelompok,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: AppColors.textGrey,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  // Widget Kartu Riwayat Logbook Satuan Dinamis dengan Status Disetujui
  static Widget logbookHistoryCard({
    required String tanggalDurasi,
    required String judulAktivitas,
    String? feedbackMentor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Baris Info Tanggal dan Chip Disetujui
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tanggalDurasi,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textGrey,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.activeGreenBg,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Disetujui',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.activeGreen,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Judul Aktivitas yang Dikerjakan
            Text(
              judulAktivitas,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),

            // Feedback atau Catatan Evaluasi dari Mentor (Jika Ada)
            if (feedbackMentor != null && feedbackMentor.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                '“$feedbackMentor”',
                style: const TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: AppColors.textGrey,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Widget Seksi Aktivitas Terakhir untuk Tampilan Form Tulis Aktivitas
  static Widget aktivitasTerakhirSection({
    required String tanggalDurasi,
    required String judulAktivitas,
    required String feedbackMentor,
    VoidCallback? onLihatSemua,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul Bagian Aktivitas Terakhir dan Tombol Lihat Semua
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Aktivitas terakhir',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            InkWell(
              onTap: onLihatSemua,
              child: const Text(
                'Lihat semua',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDarkGreen,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Kartu Logbook Satuan
        logbookHistoryCard(
          tanggalDurasi: tanggalDurasi,
          judulAktivitas: judulAktivitas,
          feedbackMentor: feedbackMentor,
        ),
      ],
    );
  }
}
