import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class AduanWidgets {
  // Widget Banner Hijau Muda Informasi Layanan Aduan di Bagian Atas
  static Widget infoBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.bannerGreen,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.bannerGreenBorder),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ikon Layanan Bantuan / Headset
          Icon(
            Icons.headset_mic_outlined,
            color: AppColors.primaryDarkGreen,
            size: 22,
          ),
          SizedBox(width: 12),

          // Teks Judul dan Keterangan Banner
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sampaikan kendalamu',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDarkGreen,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Aduan ditangani tim terkait dalam 1–2 hari kerja. Pantau perkembangannya di riwayat aduan.',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.primaryDarkGreen,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget Dropdown Pilihan Kategori Masalah Aduan
  static Widget aduanDropdownField({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label Judul Kategori
        const Text(
          'Kategori masalah',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),

        // Kotak Dropdown Pilihan
        DropdownButtonFormField<String>(
          value: value,
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.textGrey),
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textDark,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
              borderSide: const BorderSide(color: AppColors.primaryDarkGreen, width: 1.5),
            ),
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  // Widget Input Teks Sentuh Fleksibel (Single Line & Multi Line)
  static Widget aduanInputField({
    required String judulField,
    required String hintText,
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
              borderSide: const BorderSide(color: AppColors.primaryDarkGreen, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  // Widget Kotak Informasi File Berhasil Diunggah
  static Widget uploadedFileCard({
    required String namaFile,
    required String infoUkuranStatus,
    VoidCallback? onHapus,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label Bukti Pendukung
        const Text(
          'Bukti pendukung (opsional)',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),

        // Kotak File yang Diunggah
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Row(
            children: [
              // Ikon Gambar Lampiran
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.mintLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.image_outlined,
                  color: AppColors.primaryDarkGreen,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),

              // Detail Nama File dan Status Berhasil
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaFile,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      infoUkuranStatus,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),

              // Tombol Silang Hapus Lampiran
              IconButton(
                icon: const Icon(Icons.close, color: AppColors.textGrey, size: 20),
                onPressed: onHapus,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget Kotak Riwayat Aduan Terakhir dengan Status Diproses
  static Widget aduanHistoryCard({
    required String idTanggal,
    required String judulAduan,
    required String responPetugas,
    VoidCallback? onTap,
    VoidCallback? onLihatRiwayat,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Baris Judul Bagian dan Tombol Lihat Riwayat
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Aduan terakhir',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            InkWell(
              onTap: onLihatRiwayat,
              child: const Text(
                'Lihat riwayat',
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

        // Kotak Informasi Riwayat Aduan
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Baris ID Aduan & Badge Status Diproses
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      idTanggal,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textGrey,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.accentAmber,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'Diproses',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentAmberText,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Judul Kendala Masalah
                Text(
                  judulAduan,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 6),

                // Respon dari Petugas IT dan Ikon Panah Kanan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        responPetugas,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: AppColors.primaryDarkGreen,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

