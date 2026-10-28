import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class NotifikasiWidgets {
  // Widget Teks Badge Penanda Jumlah Notifikasi Baru
  static Widget notificationBadge({required String jumlah}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.mintLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        jumlah,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryDarkGreen,
        ),
      ),
    );
  }

  // Widget Header Penanda Kelompok Waktu (Contoh: HARI INI, KEMARIN)
  static Widget sectionHeader(String judulWaktu) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        judulWaktu,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: AppColors.textGrey,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  // Widget Kartu Notifikasi Satuan dengan Indikator Belum Dibaca
  static Widget notificationItemCard({
    required IconData icon,
    Color iconBgColor = AppColors.mintLight,
    Color iconColor = AppColors.primaryDarkGreen,
    required String judul,
    required String deskripsi,
    required String kategoriWaktu,
    bool isUnread = false,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ikon Kategori Notifikasi di Kiri
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),

            // Kolom Isi Notifikasi (Judul, Deskripsi, Kategori & Waktu)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Baris Judul & Titik Hijau Notifikasi Belum Dibaca
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          judul,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                      // Titik Hijau Indikator Belum Dibaca (isUnread)
                      if (isUnread) ...[
                        const SizedBox(width: 8),
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryDarkGreen,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Teks Deskripsi Notifikasi
                  Text(
                    deskripsi,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textGrey,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Keterangan Kategori dan Waktu Kirim
                  Text(
                    kategoriWaktu,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                      color: isUnread
                          ? AppColors.primaryDarkGreen
                          : AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

