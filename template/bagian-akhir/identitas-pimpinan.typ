// =============================================================================
// FORMAT IDENTITAS PIMPINAN UNIT (Sesuai Lampiran 28 Pedoman PKL UBSI)
// =============================================================================
#import "../../lib.typ": *
#import "../metadata.typ": *

#pagebreak()
#align(center)[
  #text(size: 14pt, weight: "bold")[IDENTITAS PIMPINAN UNIT]
]
#v(1.5cm)

#set par(leading: 8pt)

#table(
  columns: (0.8cm, 5.5cm, 0.3cm, 1fr),
  stroke: none,
  inset: (y: 6pt),
  [1.], [Nama Perusahaan/Institusi], [:], [#nama-instansi],
  [2.], [Alamat], [:], [#alamat-instansi],
  [3.], [Nomor Telepon / Fax], [:], [#kontak-instansi],
  [4.], [Nama Pimpinan Unit], [:], [Nama Pimpinan Unit Kerja, S.Kom],
)

#v(2.5cm)
#align(right)[
  #block(width: 7cm)[
    #set align(center)
    #kota, #tanggal-selesai-pkl\
    \
    #v(1cm)
    Tanda tangan\
    \
    #v(1.5cm)
    #line(length: 6cm, stroke: 0.5pt + black)\
    #v(-4pt)
    *Nama Jelas dan Tanda Tangan Pimpinan*
  ]
]

#v(1fr)
#text(size: 8.5pt, style: "italic")[
  *Catatan:*\
  - Format Identitas Pimpinan Unit ini digunakan untuk mengetahui pimpinan unit di perusahaan/Instansi tempat mahasiswa PKL\
  - Format ini digunakan jika perusahaan/instansi tidak memiliki format tersendiri
]
