import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class EditProfilWidgets {
  // Widget Lingkaran Foto Profil Inisial NA dengan Tombol Kamera dan Link Ubah
  static Widget avatarEditor({
    VoidCallback? onUbahFoto,
  }) {
    return Center(
      child: Column(
        children: [
          // Lingkaran Foto dengan Ikon Kamera Kecil di Pojok Kanan Bawah
          Stack(
            children: [
              // Avatar Lingkaran Mint Inisial NA
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: AppColors.mintLight,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'NA',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryTeal,
                  ),
                ),
              ),

              // Overlay Tombol Kamera Touch-Friendly
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onUbahFoto,
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: AppColors.primaryTeal,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Teks Tombol Link Ubah Foto Profil
          GestureDetector(
            onTap: onUbahFoto,
            child: const Text(
              'Ubah Foto Profil',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryTeal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget Cetakan Input Teks Kustom untuk Form Edit dan Kolom Terkunci
  static Widget editInputField({
    required String label,
    required TextEditingController controller,
    bool enabled = true,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label Judul Kolom Input
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),

        // Kotak Kolom Input Teks (Bisa diedit atau terkunci)
        TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          style: TextStyle(
            fontSize: 13,
            fontWeight: enabled ? FontWeight.w500 : FontWeight.normal,
            color: enabled ? AppColors.textDark : AppColors.textGrey,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            filled: true,
            fillColor: enabled ? Colors.white : const Color(0xFFF1F5F4),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: enabled ? AppColors.cardBorder : const Color(0xFFE2E8F0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.cardBorder),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primaryTeal, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

