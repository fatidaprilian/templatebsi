// =============================================================================
// DAFTAR RIWAYAT HIDUP MAHASISWA PKL
// =============================================================================
#pagebreak()
#align(center)[
  #text(size: 14pt, weight: "bold")[DAFTAR RIWAYAT HIDUP]
]
#v(1.5em)

#text(weight: "bold")[I. DATA PRIBADI]
#v(0.3cm)
#grid(
  columns: (1fr, 3.5cm),
  gutter: 1cm,
  [
    #table(
      columns: (3.5cm, 0.3cm, 1fr),
      stroke: none,
      inset: (y: 4pt),
      [Nama Lengkap], [:], [#penulis],
      [NIM], [:], [#nim],
      [Tempat, Tgl Lahir], [:], [Jakarta, 1 Januari 2003],
      [Jenis Kelamin], [:], [Laki-laki / Perempuan],
      [Agama], [:], [Islam],
      [Alamat Rumah], [:], [Jl. Raya Kampus UBSI No. 12, Jakarta],
      [No. Telepon / HP], [:], [0812-3456-7890],
      [Email Mahasiswa], [:], [#nim@student.ubsi.ac.id],
    )
  ],
  [
    #align(center + horizon)[
      #rect(width: 3cm, height: 4cm, stroke: 1pt + black)[
        #set align(center + horizon)
        #text(size: 10pt)[Pas Foto\ 3 x 4]
      ]
    ]
  ]
)

#v(1cm)
#text(weight: "bold")[II. RIWAYAT PENDIDIKAN FORMAL]
#v(0.3cm)
#table(
  columns: (3.5cm, 1fr, 3cm),
  stroke: (x, y) => if y == 0 { (bottom: 1pt + black) } else { none },
  inset: 6pt,
  [*Tahun Lulus*], [*Nama Sekolah / Institusi*], [*Keterangan*],
  [2015], [SD Negeri 01 Pagi Jakarta], [Sekolah Dasar],
  [2018], [SMP Negeri 01 Jakarta], [SMP],
  [2021], [SMA Negeri 01 Jakarta], [SMA / SMK],
  [#tahun], [#universitas], [Sarjana (S1)],
)

#v(1cm)
#text(weight: "bold")[III. RIWAYAT PENGALAMAN KERJA / ORGANISASI]
#v(0.3cm)
#table(
  columns: (3.5cm, 1fr, 3.5cm),
  stroke: (x, y) => if y == 0 { (bottom: 1pt + black) } else { none },
  inset: 6pt,
  [*Tahun*], [*Instansi / Perusahaan*], [*Jabatan / Peran*],
  [2023 - 2024], [Himpunan Mahasiswa Teknologi Informasi], [Staff Divisi Litbang],
  [2024 - 2025], [Laboratorium Komputer UBSI], [Asisten Laboratorium],
)

#v(1.5cm)
#align(right)[
  #block(width: 6cm)[
    #set align(left)
    #kota, #tahun\
    \
    #v(1.5cm)
    *#penulis*\
    NIM. #nim
  ]
]
