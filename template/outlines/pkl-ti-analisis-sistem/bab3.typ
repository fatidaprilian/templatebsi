#import "../../../lib.typ": *

= Pembahasan

== Tinjauan Institusi/Perusahaan
=== Sejarah Institusi/Perusahaan
Uraikan sejarah singkat berdirinya instansi atau perusahaan, profil umum bidang usaha atau pelayanan masyarakat, serta visi dan misi organisasi.

=== Struktur Organisasi dan Fungsi
Tampilkan bagan struktur organisasi tempat pelaksanaan PKL dan uraikan tugas pokok serta fungsi dari masing-masing unit kerja.

== Skema Jaringan
Gambarkan dan jelaskan skema infrastruktur jaringan atau topologi fisik/logis yang digunakan untuk menghubungkan komputer-komputer operasional pada sistem berjalan di instansi tersebut.

#figure(
  rect(width: 80%, height: 5cm, stroke: 1pt + black)[
    #set align(center + horizon)
    Bagan Skema Jaringan Komputer Sistem Berjalan
  ],
  caption: [Skema Jaringan Komputer Sistem Berjalan],
)
#sumber([Hasil Observasi Instansi, 2026])

== Analisa Kemampuan Jaringan Berjalan
Lakukan evaluasi menyeluruh terhadap kinerja sistem dan konektivitas yang sedang berjalan saat ini, meliputi kelebihan, keterbatasan akses, serta kendala pertukaran data antar divisi.

=== Spesifikasi Bentuk Dokumen Sistem Berjalan
Detailkan berkas-berkas administratif yang mengalir pada sistem berjalan:
+ *Dokumen Masukan (Input)*:
  - Nama Dokumen: Formulir Permohonan Layanan.
  - Sumber: Pengguna / Pemohon.
  - Fungsi: Sebagai bukti pengajuan data permohonan.
  - Media: Kertas / Formulir Web.
  - Frekuensi: Setiap kali ada pengajuan baru.
+ *Dokumen Keluaran (Output)*:
  - Nama Dokumen: Bukti Tanda Terima dan Laporan Rekapitulasi.
  - Sumber: Sistem Informasi.
  - Fungsi: Sebagai konfirmasi penerimaan dan pertanggungjawaban.
  - Media: Cetakan Kertas / Berkas PDF.

=== Spesifikasi File
Deskripsikan struktur basis data atau berkas penyimpanan data elektronik yang digunakan dalam sistem berjalan:

#figure(
  table(
    columns: (2fr, 2fr, 1.5fr, 1.5fr, 2fr),
    inset: 7pt,
    align: (left + horizon, left + horizon, center + horizon, center + horizon, left + horizon),
    [*Nama Field*], [*Tipe Data*], [*Panjang*], [*Kunci*], [*Keterangan*],
    [id_transaksi], [VARCHAR], [15], [Primary], [Nomor unik transaksi],
    [tgl_transaksi], [DATE], [-], [-], [Tanggal proses],
    [kode_petugas], [VARCHAR], [10], [Foreign], [Relasi ke tabel user],
    [total_biaya], [DECIMAL], [12,2], [-], [Nominal transaksi],
    [status], [VARCHAR], [20], [-], [Status proses],
  ),
  caption: [Struktur Tabel Transaksi Sistem Berjalan],
)
#sumber([Dokumentasi Database Sistem, 2026])

=== Struktur Kode
Uraikan struktur pengkodean data yang digunakan pada sistem berjalan (misalnya Kode Transaksi: `TRX-202607-0001`) beserta arti dari setiap segmen digit kode tersebut.

=== Spesifikasi Program
Detailkan spesifikasi modul perangkat lunak yang digunakan:
+ Nama Program: Sistem Informasi Manajemen Operasional.
+ Bahasa Pemrograman: PHP / JavaScript dengan basis data PostgreSQL.
+ Lingkungan Eksekusi: Web Server Apache / Nginx.
