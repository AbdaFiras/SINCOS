import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class PerizinanWidgets {
  // Widget Toggle Pilihan Tipe Izin (Sakit vs Izin Lainnya)
  static Widget perizinanTypeSwitcher({
    required int tipeAktif,
    required ValueChanged<int> onTipeChanged,
  }) {
    return Row(
      children: [
        // Tombol Sakit
        Expanded(
          child: InkWell(
            onTap: () => onTipeChanged(0),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: tipeAktif == 0 ? AppColors.primaryTeal : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: tipeAktif == 0 ? AppColors.primaryTeal : AppColors.cardBorder,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'Sakit',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: tipeAktif == 0 ? Colors.white : AppColors.textDark,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Tombol Izin Lainnya
        Expanded(
          child: InkWell(
            onTap: () => onTipeChanged(1),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: tipeAktif == 1 ? AppColors.primaryTeal : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: tipeAktif == 1 ? AppColors.primaryTeal : AppColors.cardBorder,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'Izin Lainnya',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: tipeAktif == 1 ? Colors.white : AppColors.textDark,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget Cetakan Input Teks dengan Label dan Ikon Kalender
  static Widget perizinanInputField({
    required String label,
    required String hintText,
    IconData? suffixIcon,
    int maxLines = 1,
    TextEditingController? controller,
    VoidCallback? onTap,
    bool readOnly = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label Judul Field
        Text(
          label,
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
          readOnly: readOnly,
          onTap: onTap,
          style: const TextStyle(fontSize: 13, color: AppColors.textDark),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 13, color: AppColors.textGrey),
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: AppColors.primaryTeal, size: 20)
                : null,
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
              borderSide: const BorderSide(color: AppColors.primaryTeal, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  // Widget Kotak Area Unggah Surat Dokter dengan Garis Putus-Putus
  static Widget medicalUploadCard({VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: CustomPaint(
        painter: _DashedBorderPainter(
          color: AppColors.cardBorder,
          radius: 12,
        ),
        child: Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ikon Cloud Upload
              Icon(
                Icons.cloud_upload_outlined,
                color: AppColors.primaryTeal,
                size: 32,
              ),
              SizedBox(height: 10),

              // Teks Instruksi Unggah Dokumen
              Text(
                'Unggah Surat Dokter / Bukti Pendukung\n(Maks 5MB)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTeal,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Painter untuk Garis Tepi Putus-Putus (Dashed Border)
class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double radius;

  _DashedBorderPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    final Path path = Path()..addRRect(rrect);
    final Path dashedPath = Path();

    const double dashWidth = 6.0;
    const double dashSpace = 4.0;
    double distance = 0.0;

    for (final metric in path.computeMetrics()) {
      while (distance < metric.length) {
        final double len = (distance + dashWidth < metric.length)
            ? dashWidth
            : metric.length - distance;
        dashedPath.addPath(
          metric.extractPath(distance, distance + len),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

