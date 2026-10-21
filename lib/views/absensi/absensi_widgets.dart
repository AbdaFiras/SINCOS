import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class AbsensiWidgets {
  /// Header & info tanggal/jam kerja
  static Widget buildAbsensiHeader({
    required BuildContext context,
    VoidCallback? onHistoryTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // App Bar: Tombol Back, Judul, Subtitle, & History
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Absensi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    Text(
                      'Catat kehadiran harianmu',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: onHistoryTap,
              icon: const Icon(Icons.history, color: AppColors.textDark),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Info Tanggal & Badge Status Belum Absen
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selasa, 20 Oktober 2026',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Jam kerja 08.00 – 16.00 WIB',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.accentAmber,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Belum absen',
                style: TextStyle(
                  color: AppColors.accentAmberText,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Mockup visual peta jangkauan kantor & ListTile status GPS
  static Widget buildMapMockupView() {
    return Column(
      children: [
        Container(
          height: 190,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF0EB),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Ilustrasi Jalan Peta
                Positioned(
                  top: 70,
                  left: -20,
                  right: -20,
                  child: Container(height: 22, color: Colors.white),
                ),
                Positioned(
                  top: -20,
                  bottom: -20,
                  left: 95,
                  child: Container(width: 22, color: Colors.white),
                ),
                Positioned(
                  top: -20,
                  bottom: -20,
                  right: 90,
                  child: Container(width: 22, color: Colors.white),
                ),

                // Blok Bangunan Peta
                Positioned(
                  top: 16,
                  left: 18,
                  child: _buildMapBlock(65, 36),
                ),
                Positioned(
                  top: 16,
                  right: 18,
                  child: _buildMapBlock(60, 42),
                ),
                Positioned(
                  bottom: 16,
                  left: 18,
                  child: _buildMapBlock(60, 44),
                ),
                Positioned(
                  bottom: 16,
                  right: 18,
                  child: _buildMapBlock(65, 34),
                ),

                // Lingkaran Radius 50m
                Container(
                  width: 145,
                  height: 145,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mintLight.withValues(alpha: 0.5),
                    border: Border.all(
                      color: AppColors.primaryDarkGreen,
                      width: 1.2,
                    ),
                  ),
                ),

                // Pill Radius 50m
                Positioned(
                  top: 36,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Radius 50 m',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDarkGreen,
                      ),
                    ),
                  ),
                ),

                // Ikon Kantor di Tengah
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x10000000),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.corporate_fare,
                    color: AppColors.primaryDarkGreen,
                    size: 22,
                  ),
                ),

                // Titik Posisi Pengguna di Dalam Radius
                Positioned(
                  bottom: 50,
                  right: 125,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: AppColors.primaryDarkGreen.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryDarkGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                // Tag Lokasi Kantor (Kiri Bawah)
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: AppColors.primaryDarkGreen,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Kantor PLN UID Jateng & DIY',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Tombol My Location (Kanan Bawah)
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.my_location,
                      size: 18,
                      color: AppColors.primaryDarkGreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // ListTile Status Jangkauan GPS Kantor
        ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          leading: const Icon(
            Icons.check_circle_outline,
            color: AppColors.primaryDarkGreen,
            size: 22,
          ),
          title: const Text(
            'Dalam jangkauan · 18 m dari kantor',
            style: TextStyle(
              color: AppColors.primaryDarkGreen,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          trailing: const Text(
            'GPS ±5 m',
            style: TextStyle(
              color: AppColors.textLightGrey,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }

  static Widget _buildMapBlock(double w, double h) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: const Color(0xFFD6DFD7),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  /// 4 Tombol Status Kehadiran menggunakan perulangan .map (LOC Ringkas)
  static Widget buildStatusKehadiranGrid({
    required int selectedIndex,
    required ValueChanged<int> onSelect,
  }) {
    const statusData = [
      {'label': 'Hadir', 'icon': Icons.check_circle_outline},
      {'label': 'Izin', 'icon': Icons.assignment_ind_outlined},
      {'label': 'Sakit', 'icon': Icons.favorite_outline},
      {'label': 'Alpha', 'icon': Icons.cancel_outlined},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Status kehadiran',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: statusData.asMap().entries.map((entry) {
            final int index = entry.key;
            final item = entry.value;
            final bool isSelected = index == selectedIndex;

            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: index < 3 ? 10.0 : 0.0),
                child: InkWell(
                  onTap: () => onSelect(index),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.mintLight : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primaryDarkGreen
                            : AppColors.cardBorder,
                        width: isSelected ? 1.5 : 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          item['icon'] as IconData,
                          color: isSelected
                              ? AppColors.primaryDarkGreen
                              : AppColors.textGrey,
                          size: 22,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['label'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected
                                ? AppColors.primaryDarkGreen
                                : AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        const Text(
          'Izin / Sakit memerlukan bukti. Alpha dicatat oleh sistem.',
          style: TextStyle(
            fontSize: 11,
            color: AppColors.textGrey,
          ),
        ),
      ],
    );
  }

  /// Tombol Absen Masuk Sekarang
  static Widget buildAbsenButton({VoidCallback? onPressed}) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryDarkGreen,
              elevation: 0,
              shape: RoundedRectangle12Border(),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.fingerprint, color: Colors.white, size: 22),
                SizedBox(width: 8),
                Text(
                  'Absen masuk sekarang',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Lokasi terverifikasi · Keterlambatan dicatat otomatis.',
          style: TextStyle(
            fontSize: 11,
            color: AppColors.textGrey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Card Catatan Hari Ini menggunakan ListTile (Hemat LOC & Rapi)
  static Widget buildCatatanHariIniCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Catatan hari ini',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Row(
              children: [
                // Masuk
                const Icon(
                  Icons.login,
                  color: AppColors.primaryDarkGreen,
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Masuk',
                      style: TextStyle(fontSize: 11, color: AppColors.textGrey),
                    ),
                    Text(
                      '-- : --',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                // Pulang
                const Icon(
                  Icons.logout,
                  color: AppColors.textGrey,
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pulang',
                      style: TextStyle(fontSize: 11, color: AppColors.textGrey),
                    ),
                    Text(
                      '-- : --',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.surfaceGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Menunggu',
                style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Helper border radius agar kode lebih ringkas
class RoundedRectangle12Border extends RoundedRectangleBorder {
  RoundedRectangle12Border() : super(borderRadius: BorderRadius.circular(12));
}