// =============================================================================
// LEMBAR PERSETUJUAN LAPORAN PKL (Sesuai Lampiran 15 Pedoman PKL UBSI)
// Program Studi di Kampus Utama
// =============================================================================
#import "../../lib.typ": *
#import "../metadata.typ": *

#let jenjang-label = if jenjang.contains("S1") or jenjang.contains("Sarjana") { "S1" } else { "D3" }

#page(
  header: none,
  footer: context {
    let page-num = counter(page).display("i")
    align(center)[#text(size: 12pt)[#page-num]]
  }
)[
  #heading(level: 1, numbering: none, outlined: true)[Lembar Persetujuan Laporan PKL]

  #align(center)[
    #text(size: 14pt, weight: "bold")[
      PERSETUJUAN\
      LAPORAN PRAKTIK KERJA LAPANGAN
    ]
  ]

  #v(1.2cm)
  Laporan Praktik Kerja Lapangan ini disusun oleh :

  #v(0.4cm)
  #table(
    columns: (3.5cm, 0.4cm, 1fr),
    stroke: none,
    inset: (y: 5pt),
    [Nama], [:], [#penulis],
    [NIM], [:], [#nim],
    [Jenjang], [:], [#jenjang],
    [Fakultas], [:], [#fakultas],
    [Program Studi], [:], [#program-studi],
  )

  #v(0.6cm)
  telah *disetujui* untuk dinilai pada periode Semester #semester Tahun Akademik #tahun-akademik di Program Studi #program-studi (#jenjang-label) Fakultas #fakultas Universitas Bina Sarana Informatika.

  #v(1.8cm)
  #align(center)[
    #let tgl = if tanggal-persetujuan != none { tanggal-persetujuan } else { kota + ", " + datetime.today().display("[day] [month repr:long] [year]") }
    #tgl\
    #v(0.3cm)
    #text(weight: "bold")[
      DOSEN PENASEHAT AKADEMIK\
      Kelas #kelas
    ]\
    #v(2.5cm)
    ttd\
    #v(0.3cm)
    *( #dosen-pa )*
  ]
]
