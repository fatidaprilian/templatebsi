// =============================================================================
// LEMBAR PERSETUJUAN PROPOSAL PRAKTIK KERJA LAPANGAN (PKL)
// Bagian 3.2 Pedoman PKL UBSI
// =============================================================================
#import "../../lib.typ": *
#import "../metadata.typ": *

#page(
  header: none,
  footer: context {
    let page-num = counter(page).display("i")
    align(center)[#text(size: 10pt)[#page-num]]
  }
)[
  #align(center)[
    #text(size: 14pt, weight: "bold")[
      LEMBAR PERSETUJUAN\
      PROPOSAL PRAKTIK KERJA LAPANGAN
    ]
  ]

  #v(1.5cm)
  Proposal Praktik Kerja Lapangan (PKL) ini diajukan oleh:

  #v(0.5cm)
  #table(
    columns: (4cm, 0.5cm, 1fr),
    stroke: none,
    inset: (y: 6pt),
    [Nama Mahasiswa], [:], [#penulis],
    [NIM], [:], [#nim],
    [Jenjang Studi], [:], [Sarjana (S1)],
    [Program Studi], [:], [#program-studi],
    [Fakultas], [:], [#fakultas],
    [Perguruan Tinggi], [:], [#universitas],
    [Judul Proposal PKL], [:], [#judul],
  )

  #v(1cm)
  Proposal Praktik Kerja Lapangan ini telah disetujui untuk diajukan ke instansi / perusahaan terkait.

  #v(1.5cm)
  #align(right)[
    #block(width: 8cm)[
      #set align(left)
      #kota, #datetime.today().display("[day] [month repr:long] [year]")\
      #v(0.3cm)
      *Dosen Penasehat Akademik (Dosen PA)*\
      #v(2.5cm)
      *( #dosen-pa )*\
    ]
  ]
]
