#import "../../../lib.typ": *

= Pembahasan

== Tinjauan Kasus Aplikasi Mobile Computing
Berikan penjelasan komprehensif mengenai profil aplikasi mobile yang diteliti:
+ Identitas aplikasi: Nama aplikasi, pengembang (_developer_), versi rilis, dan kategori di Google Play Store atau Apple App Store.
+ Deskripsi fungsionalitas: Layanan utama yang disediakan dan arsitektur umum aplikasi.

== Analisa Flow Chart
Gambarkan diagram alir (_flowchart_) logika jalannya program atau proses bisnis utama dari aplikasi mobile berjalan tersebut. Uraikan setiap langkah proses secara runtut mulai dari input data hingga output yang dihasilkan.

#figure(
  rect(width: 80%, height: 6cm, stroke: 1pt + black)[
    #set align(center + horizon)
    Diagram Flowchart Proses Bisnis Aplikasi Mobile
  ],
  caption: [Flowchart Proses Utama Aplikasi Mobile],
)
#sumber([Hasil Analisis Sistem Mobile, 2026])

== Analisa Diagram Hierarchy Input Process Output (HIPO)
Petakan struktur hierarki modul program aplikasi menggunakan diagram HIPO, mulai dari _Visual Table of Contents_ (VTOC), diagram ikhtisar (_Overview Diagram_), hingga diagram rincian (_Detail Diagram_).

#figure(
  rect(width: 80%, height: 5cm, stroke: 1pt + black)[
    #set align(center + horizon)
    Diagram HIPO Fungsionalitas Modul Mobile
  ],
  caption: [Diagram HIPO Fungsionalitas Modul Aplikasi],
)
#sumber([Hasil Analisis Modul Program, 2026])

== Analisa Aplikasi Mobile Computing
Lakukan analisis mendalam terhadap aspek komputasi mobile dari aplikasi:
+ *Manajemen Resource*: Analisis penggunaan memori RAM, konsumsi baterai, dan alokasi penyimpanan lokal (_local storage/cache_).
+ *Interaksi Hardware*: Penggunaan modul sensor (GPS, kamera, akselerometer, atau notifikasi push).
+ *Konektivitas dan Sinkronisasi Data*: Penanganan kondisi jaringan tidak stabil (_offline mode_) dan komunikasi data melalui REST API.

== Permasalahan
Deskripsikan masalah, kendala, _bug_, atau keterbatasan performa yang ditemukan sepanjang pengujian aplikasi:
+ Kendala latensi sinkronisasi data saat kondisi sinyal lemah.
+ Penumpukan berkas sementara (_cache_) yang menyebabkan penurunan responsivitas aplikasi.
+ Kurangnya umpan balik visual saat terjadi kegagalan koneksi jaringan.

== Pemecahan Masalah
Tawarkan rekomendasi dan solusi teknis untuk mengatasi permasalahan yang telah diuraikan:
+ Penerapan mekanisme _caching_ terstruktur menggunakan basis data lokal SQLite / Room / Hive.
+ Optimasi kompresi data JSON pada saat pertukaran data API.
+ Penambahan penanganan galat (_error handling_) yang informatif pada antarmuka pengguna.
