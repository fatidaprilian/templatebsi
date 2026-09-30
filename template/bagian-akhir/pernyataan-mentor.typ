// =============================================================================
// SURAT PERNYATAAN MENTOR PKL (Sesuai Lampiran 29 Pedoman PKL UBSI)
// =============================================================================
#import "../../lib.typ": *
#import "../metadata.typ": *

#pagebreak()
#align(center)[
  #text(size: 14pt, weight: "bold")[SURAT PERNYATAAN MENTOR PKL]
]
#v(1.2cm)

#set par(leading: 8pt)

Yang bertanda tangan di bawah ini :\
#v(0.2cm)
#pad(left: 0.5cm)[
  #table(
    columns: (3cm, 0.3cm, 1fr),
    stroke: none,
    inset: (y: 4pt),
    [Nama], [:], [Nama Mentor Perusahaan, S.Kom],
    [NIP / NIK], [:], [198501012010011001],
    [Jabatan], [:], [Senior Network / Systems Engineer],
  )
]

#v(0.3cm)
Dengan ini menyatakan kesediaan untuk:

+ Menjadi mentor Praktik Kerja Lapangan dengan data mahasiswa sebagai berikut:
  #v(0.2cm)
  #pad(left: 0.5cm)[
    #table(
      columns: (3cm, 0.3cm, 1fr),
      stroke: none,
      inset: (y: 3pt),
      [Nama], [:], [#penulis],
      [NIM], [:], [#nim],
      [Program Studi], [:], [#program-studi],
    )
  ]
+ Membimbing dan mengarahkan mahasiswa selama melaksanakan Praktik Kerja Lapangan.
+ Memberikan Penilaian terhadap mahasiswa di akhir pelaksanaan Praktik Kerja Lapangan.

#v(0.5cm)
Demikian surat pernyataan ini dibuat dengan sesungguhnya untuk dapat digunakan sebagaimana mestinya.

#v(1.5cm)
#align(right)[
  #block(width: 7cm)[
    #set align(center)
    #kota, #tanggal-mulai-pkl\
    Yang Membuat pernyataan,\
    \
    #v(1cm)
    #text(size: 9pt, style: "italic")[<< Tanda tangan dan Stempel >>]\
    \
    #v(1.5cm)
    *(Nama Mentor Perusahaan)*\
    NIP. 198501012010011001
  ]
]

#v(1fr)
#text(size: 8.5pt, style: "italic")[
  *Catatan:*\
  - Format Surat Pernyataan Mentor PKL ini digunakan untuk mengetahui mentor/pembimbing di perusahaan/instansi selama mahasiswa melaksanakan PKL.\
  - Format ini digunakan jika perusahaan/instansi tidak memiliki format tersendiri
]
