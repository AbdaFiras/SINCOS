import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class LoginWidgets {
  // Kerangka Header (Bagian Hijau Teal)
  static Widget buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.bolt, color: Colors.yellowAccent, size: 24),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SINCOS', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                  Text('INTERNSHIP WORKSPACE', style: TextStyle(color: Colors.white70, fontSize: 10, letterSpacing: 0.5)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text('PORTAL PESERTA MAGANG', style: TextStyle(color: Colors.yellowAccent, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
          const SizedBox(height: 12),
          const Text('Energi baru,\nlangkah baru.', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, height: 1.2)),
          const SizedBox(height: 12),
          Text('Satu ruang untuk tumbuh, berkarya, dan\nmengelola perjalanan magangmu.', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14, height: 1.4)),
        ],
      ),
    );
  }

  // Kerangka Label Form
  static Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textDark)),
    );
  }

  // Kerangka Desain Kotak Input
  static InputDecoration inputDecoration({required String hint, IconData? suffixIcon, Widget? suffixWidget}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black38, fontSize: 13),
      suffixIcon: suffixWidget ?? (suffixIcon != null ? Icon(suffixIcon, color: AppColors.textGrey, size: 20) : null),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade300)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.primaryTeal)),
    );
  }
}