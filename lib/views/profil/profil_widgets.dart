import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class ProfilWidgets {
  // Widget Kotak Profil Utama (Avatar NA, Nama, NIM/Status, Badge, & Tombol Edit)
  static Widget profilHeaderCard({
    required VoidCallback onEditTap,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        children: [
          // Baris Informasi Profil Atas (Avatar, Nama, Status)
          Row(
            children: [
              // Avatar Lingkaran Mint Inisial NA
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: AppColors.mintLight,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'NA',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDarkGreen,
                  ),
                ),
              ),
              const SizedBox(width: 14),

              // Kolom Nama, Detail ID, dan Badge Akun
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nabila Ayu Putri',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'INT-2026-084 · Mahasiswa magang',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.textGrey,
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Badge Akun Terverifikasi
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.mintLight,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'Akun terverifikasi',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDarkGreen,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),
          const Divider(height: 1, color: AppColors.cardBorder),
          const SizedBox(height: 12),

          // Baris Bawah Teks Himbauan dan Tombol Edit
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pastikan data pribadimu selalu terkini.',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.textGrey,
                ),
              ),
              InkWell(
                onTap: onEditTap,
                borderRadius: BorderRadius.circular(6),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        size: 15,
                        color: AppColors.primaryDarkGreen,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDarkGreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget Kotak Informasi Data Akademis Mahasiswa
  static Widget dataMahasiswaCard({
    required String email,
    required String nim,
    required String universitas,
    required String programStudi,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Email Mahasiswa
          const Text(
            'Email mahasiswa',
            style: TextStyle(
              fontSize: 11,
              color: AppColors.textGrey,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            email,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 12),
          const Divider(height: 1, color: AppColors.cardBorder),
          const SizedBox(height: 12),

          // Baris NIM
          _buildInfoRow('NIM', nim),
          const SizedBox(height: 10),

          // Baris Universitas
          _buildInfoRow('Universitas', universitas),
          const SizedBox(height: 10),

          // Baris Program Studi
          _buildInfoRow('Program studi', programStudi),
        ],
      ),
    );
  }

  // Widget Kotak Informasi Penempatan Magang PLN
  static Widget penempatanMagangCard({
    required String lokasi,
    required String divisi,
    required String periode,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris Judul Lokasi Magang dan Chip Status Aktif
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lokasi,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
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
                  'Aktif',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.activeGreen,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Baris Divisi
          _buildInfoRow('Divisi', divisi),
          const SizedBox(height: 10),

          // Baris Periode
          _buildInfoRow('Periode', periode),
        ],
      ),
    );
  }

  // Widget Kustom Baris Menu Pengaturan dan Bantuan
  static Widget menuListTile({
    required IconData icon,
    required String judul,
    String? subjudul,
    required VoidCallback onTap,
    bool tampilkanGarisBawah = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                // Ikon Menu di Kiri
                Icon(
                  icon,
                  color: AppColors.primaryDarkGreen,
                  size: 22,
                ),
                const SizedBox(width: 14),

                // Kolom Judul dan Subjudul Menu
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        judul,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      if (subjudul != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          subjudul,
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // Ikon Panah Kanan (Chevron)
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.textGrey,
                  size: 20,
                ),
              ],
            ),
          ),
          if (tampilkanGarisBawah)
            const Divider(height: 1, indent: 16, endIndent: 16, color: AppColors.cardBorder),
        ],
      ),
    );
  }

  // Fungsi Pembantu untuk Baris Data (Label Kiri, Nilai Kanan)
  static Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textGrey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}

