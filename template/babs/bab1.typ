= Pendahuluan

== Latar Belakang Masalah
Perkembangan teknologi informasi saat ini telah mengubah paradigma operasional di berbagai sektor industri dan akademis. Kebutuhan akan efisiensi, keandalan, dan skalabilitas sistem jaringan menjadi faktor penentu keberhasilan implementasi teknologi di lingkungan kerja modern.

Praktik Kerja Lapangan (PKL) pada Program Studi Teknologi Informasi Universitas Bina Sarana Informatika dirancang untuk menguji kompetensi mahasiswa dalam menganalisis permasalahan riil di instansi atau perusahaan serta merancang solusi teknologi yang tepat guna.

== Identifikasi Masalah
Berdasarkan latar belakang yang telah diuraikan, beberapa permasalahan utama yang diidentifikasi meliputi:
+ Pengelolaan infrastruktur jaringan yang masih dilakukan secara manual sehingga meningkatkan latensi penanganan insiden.
+ Kurangnya dokumentasi arsitektural yang terstruktur dan terstandarisasi antara lain:
  a. Dokumentasi topologi fisik perangkat.
  b. Dokumentasi pengalamatan IP yaitu:
    1) Skema subnetting jaringan lokal.
    2) Konfigurasi VLAN adalah:
      a) VLAN manajemen perangkat.
      b) VLAN distribusi pengguna : (1) Ruang Lab, (2) Ruang Administrasi.
+ Kebutuhan sistem pemantauan otomatis yang dapat diakses secara terpusat.

== Ruang Lingkup
Untuk menjaga fokus laporan agar tetap terarah, batasan yang ditetapkan adalah:
+ Kegiatan PKL difokuskan pada perancangan arsitektur pemantauan jaringan di laboratorium.
+ Protokol yang digunakan dibatasi pada Simple Network Management Protocol (SNMP) versi 2c.
+ Antarmuka sistem dikembangkan berbasis web responsif.

== Contoh Kutipan dan Tabel
Sesuai pedoman pengutipan PKL UBSI, berikut contoh kutipan langsung kurang dari lima baris: “Sistem Informasi merupakan suatu sistem dalam organisasi yang merupakan kombinasi dari orang-orang, fasilitas, teknologi, media, prosedur dan pengendalian untuk mendapatkan jalur komunikasi penting” @kurose2021.

Berikut ini adalah contoh tabel dengan nomor mengacu pada nomor Bab dalam angka Romawi:

#figure(
  table(
    columns: (1.5fr, 3fr, 2fr),
    inset: 8pt,
    align: (center + horizon, left + horizon, center + horizon),
    [*Perangkat*], [*Fungsi*], [*Status*],
    [Router Utama], [Gateway dan NAT internet], [Aktif],
    [Switch Core], [Distribusi VLAN antar lab], [Aktif],
    [Access Point], [Koneksi nirkabel mahasiswa], [Aktif],
  ),
  caption: [Daftar Perangkat Jaringan Laboratorium],
)
#sumber([Hasil Observasi Laboratorium, 2026])

== Contoh Gambar
Berikut adalah contoh penyematan gambar dengan penomoran Bab Romawi dan peletakan sumber:

#align(center)[
  #rect(width: 80%, height: 4cm, stroke: 1pt + luma(100))[
    #set align(center + horizon)
    Topologi Jaringan Laboratorium Komputer
  ]
]
#sumber([Dokumentasi Internal PKL, 2026])

#figure(
  none,
  caption: [Topologi Jaringan Laboratorium Komputer],
)
