#import "../../lib.typ": *
#import "../metadata.typ": *

// =============================================================================
// KATA PENGANTAR (Sesuai Lampiran 17 Pedoman PKL UBSI)
// =============================================================================

#heading(level: 1, numbering: none, outlined: true)[Kata Pengantar]

#let jenis-teks = if jenis == "proposal" { "Proposal" } else { "Laporan" }
#let syarat-teks = if jenis == "proposal" { "pelaksanaan" } else { "kelulusan" }

Dengan mengucapkan puji syukur kehadirat Allah SWT atas terselesaikannya #jenis-teks Praktik Kerja Lapangan (PKL) dengan judul : "*#upper(judul)*", yang merupakan salah satu syarat #syarat-teks mata kuliah Praktik Kerja Lapangan program studi #program-studi Fakultas #fakultas Universitas Bina Sarana Informatika.

Selama melaksanakan Praktik Kerja Lapangan dan dalam menyelesaikan laporan ini, penulis telah banyak menerima bimbingan, pengarahan, petunjuk dan saran, serta fasilitas yang membantu hingga akhir dari penulisan laporan ini. Untuk itu penulis menyampaikan ucapan terima kasih yang sebesar-besarnya kepada yang terhormat:

+ Rektor Universitas Bina Sarana Informatika
+ Dekan Fakultas #fakultas Universitas Bina Sarana Informatika
+ Ketua Program Studi #program-studi Fakultas #fakultas Universitas Bina Sarana Informatika.
+ #dosen-pa selaku Dosen Penasehat Akademik yang telah memberikan petunjuk dan pengarahan dalam penyelesaian laporan ini.
+ #nama-pembimbing-instansi, Selaku #jabatan-pembimbing-instansi #nama-instansi.

Akhirnya penulis berharap semoga laporan ini bermanfaat bagi semua pihak yang membantu, meskipun dalam laporan ini masih banyak kekurangannya. Oleh karena itu kritik dan saran yang membangun tetap penulis harapkan.

#v(1.5cm)
#align(right)[
  #block(width: 6cm)[
    #set align(center)
    #let tgl = if tanggal-persetujuan != none { tanggal-persetujuan } else { kota + ", " + datetime.today().display("[day] [month repr:long] [year]") }
    #tgl\
    #v(0.6cm)
    Penulis\
    #v(1.8cm)
    #penulis
  ]
]
