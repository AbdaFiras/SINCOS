import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class RegisterWidgets {
  // Kerangka untuk Label/Judul input
  static Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text, 
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textDark)
      ),
    );
  }

  // Kerangka untuk Desain Kotak Input (TextField / Dropdown)
  static InputDecoration inputDecoration({required String hint, IconData? suffixIcon, Widget? suffixWidget}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black38, fontSize: 13),
      suffixIcon: suffixWidget ?? (suffixIcon != null ? Icon(suffixIcon, 
      color: AppColors.textGrey, size: 20) : null),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), 
      borderSide: BorderSide(color: Colors.grey.shade300)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), 
      borderSide: BorderSide(color: Colors.grey.shade300)),
      focusedBorder: OutlineInputBorder(borderRadius: 
      BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.primaryTeal)),
    );
  }

  // Kerangka Banner Informasi (Warna hijau muda)
  static Widget buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryTeal.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Icon(Icons.school_outlined, color: AppColors.primaryTeal, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Gunakan data sesuai identitas dan email aktifmu.',
              style: TextStyle(color: AppColors.primaryTeal, fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}