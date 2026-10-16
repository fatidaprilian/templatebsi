// =============================================================================
// DAFTAR SIMBOL (Sesuai Lampiran 19 & 20 Pedoman PKL UBSI)
// Diketik dengan jarak satu spasi, disesuaikan dengan kebutuhan outline
// =============================================================================
#import "../metadata.typ": *

#heading(level: 1, numbering: none, outlined: true)[Daftar Simbol]

#set par(leading: 6pt) // 1 Spasi sesuai Catatan Lampiran 19 & 20

*a. Simbol _UML_*

_Simbol UML yang dipakai dalam penulisan TA./Skripsi disesuaikan dengan referensi (buku) yang digunakan._

#v(0.3cm)
#table(
  columns: (3cm, 3.5cm, 1fr),
  stroke: 0.5pt + black,
  inset: 5pt,
  align: (center + horizon, left + horizon, left + horizon),
  table.header(
    table.cell(align: center)[*Bentuk Simbol*],
    table.cell(align: center)[*Nama Simbol*],
    table.cell(align: center)[*Keterangan / Fungsi*],
  ),
  [#ellipse(width: 2.2cm, height: 1cm)[#align(center + horizon)[#text(size: 9pt)[_Use Case_]]]],
  [Use Case],
  [Menggambarkan fungsionalitas atau layanan yang disediakan oleh sistem bagi aktor.],

  [#image(bytes("<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 40 60' width='24' height='36' stroke='black' stroke-width='2' fill='none'><circle cx='20' cy='12' r='8'/><line x1='20' y1='20' x2='20' y2='40'/><line x1='6' y1='28' x2='34' y2='28'/><line x1='20' y1='40' x2='8' y2='58'/><line x1='20' y1='40' x2='32' y2='58'/></svg>"), format: "svg")],
  [Actor / Aktor],
  [Menggambarkan peran entitas luar (pengguna, peran, atau sistem eksternal) yang berinteraksi dengan sistem.],

  [#line(length: 2cm, stroke: 1pt + black)],
  [Asosiasi / _Association_],
  [Menghubungkan interaksi dan komunikasi antara aktor dengan _use case_.],

  [#line(length: 2cm, stroke: (paint: black, dash: "dashed"))],
  [Dependensi / _Dependency_],
  [Menunjukkan ketergantungan antarelemen model di mana perubahan satu elemen mempengaruhi elemen lainnya.],

  [#rect(width: 2.2cm, inset: 3pt, stroke: 0.8pt + black)[
    #set text(size: 8pt)
    #set align(center)
    *Nama Kelas*\
    #v(1pt)
    #line(length: 100%, stroke: 0.5pt)
    #v(1pt)
    + atribut\
    #v(1pt)
    #line(length: 100%, stroke: 0.5pt)
    #v(1pt)
    + operasi()
  ]],
  [Class / Kelas],
  [Struktur dasar dalam pemrograman berorientasi objek yang mendefinisikan atribut dan operasi/metode.],
)

#v(0.6cm)
*b. Simbol Jaringan Komputer* (Lampiran 19)

#v(0.3cm)
#table(
  columns: (3.5cm, 1fr),
  stroke: 0.5pt + black,
  inset: 5pt,
  align: (center + horizon, left + horizon),
  table.header(
    table.cell(align: center)[*Bentuk Simbol*],
    table.cell(align: center)[*Nama Simbol*],
  ),
  [#rect(width: 1.2cm, height: 1.5cm, stroke: 1pt + black)[#align(center + horizon)[Server]]], [Server],
  [#rect(width: 1.4cm, height: 1.6cm, stroke: 1pt + black)[#align(center + horizon)[Mainframe]]], [Mainframe],
  [#circle(radius: 0.6cm)[#align(center + horizon)[Router]]], [Router],
  [#rect(width: 1.5cm, height: 1cm, stroke: 1pt + black)[#align(center + horizon)[Hub]]], [Hub],
  [#rect(width: 1.8cm, height: 0.8cm, stroke: 1pt + black)[#align(center + horizon)[Switch]]], [Switch],
  [#rect(width: 1.6cm, height: 0.7cm, stroke: 1pt + black)[#align(center + horizon)[Bridge]]], [Bridge],
  [#rect(width: 1.6cm, height: 0.7cm, stroke: 1pt + black)[#align(center + horizon)[Modem]]], [Modem],
  [#line(length: 1.8cm, stroke: 1.5pt + black)], [Communication Link],
  [#circle(radius: 0.6cm)[#align(center + horizon)[AP]]], [Wireless Access Point],
  [#rect(width: 1.4cm, height: 1.6cm, stroke: 1pt + black)[#align(center + horizon)[Firewall]]], [Firewall],
  [#rect(width: 1.5cm, height: 1.1cm, stroke: 1pt + black)[#align(center + horizon)[Printer]]], [Printer],
  [#rect(width: 2cm, height: 0.5cm, stroke: 1pt + black)[#align(center + horizon)[Ethernet]]], [Ethernet],
  [#rect(width: 1.2cm, height: 1cm, stroke: 1pt + black)[#align(center + horizon)[IP Phone]]], [Telephone],
  [#rect(width: 1.4cm, height: 1.2cm, stroke: 1pt + black)[#align(center + horizon)[PC]]], [Personal Computer],
  [#rect(width: 1.5cm, height: 1cm, stroke: 1pt + black)[#align(center + horizon)[Laptop]]], [Laptop],
  [#rect(width: 1.6cm, height: 0.8cm, stroke: 1pt + black)[#align(center + horizon)[Scanner]]], [Scanner],
  [#circle(radius: 0.4cm)[#align(center + horizon)[User]]], [User],
)

#v(0.6cm)
*c. Simbol Proses / Flowchart Dokumen* (Lampiran 20)

#v(0.3cm)
#table(
  columns: (0.8cm, 2.5cm, 3cm, 1fr),
  stroke: 0.5pt + black,
  inset: 4.5pt,
  align: (center + horizon, center + horizon, left + horizon, left + horizon),
  table.header(
    table.cell(align: center)[*NO*],
    table.cell(align: center)[*BENTUK SIMBOL*],
    table.cell(align: center)[*NAMA SIMBOL*],
    table.cell(align: center)[*FUNGSI SIMBOL*],
  ),
  [1], [#rect(width: 1.8cm, height: 0.8cm, radius: 0.4cm, stroke: 0.8pt + black)[#align(center + horizon)[#text(size: 8pt)[_Start/End_]]]], [Terminal/Terminator], [Menyatakan permulaan (Start/Mulai) atau Akhir (End/Selesai) suatu kegiatan atau proses alur dokumen baik manual maupun terkomputerisasi.],
  [2], [#rect(width: 1.8cm, height: 0.8cm, stroke: 0.8pt + black)[#align(center + horizon)[#text(size: 8pt)[Proses]]]], [Proses], [Menyatakan tindakan proses yang dilakukan oleh bagian yang berwenang atas dokumen tersebut baik secara manual maupun terkomputerisasi.],
  [3], [#box(width: 1.8cm, height: 0.8cm)[#polygon(fill: none, stroke: 0.8pt + black, (0%, 100%), (25%, 0%), (100%, 0%), (75%, 100%))]], [Input/output Data], [Menyatakan proses input/output data atau dokumen tanpa tergantung dari jenis peralatannya.],
  [4], [#box(width: 1.6cm, height: 0.9cm)[#polygon(fill: none, stroke: 0.8pt + black, (50%, 0%), (100%, 50%), (50%, 100%), (0%, 50%))]], [Keputusan/Decision], [Menunjukkan suatu kondisi tertentu dari dokumen yang akan diproses dengan menghasilkan dua keputusan: Ya (lanjut) atau Tidak (dikembalikan).],
  [5], [#box(width: 1.8cm, height: 0.8cm)[#polygon(fill: none, stroke: 0.8pt + black, (20%, 0%), (80%, 0%), (100%, 50%), (80%, 100%), (20%, 100%), (0%, 50%))]], [Preparation], [Menyatakan tempat untuk mempersiapkan penyimpanan yang akan digunakan sebagai tempat pengolahan di dalam storage.],
  [6], [#image(bytes("<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 50 30' width='40' height='24' stroke='black' stroke-width='1.5' fill='none'><path d='M 2 2 L 48 2 L 48 22 C 36 28 30 16 18 24 C 10 28 4 22 2 24 Z'/></svg>"), format: "svg")], [Dokumen], [Menyatakan input berasal dari dokumen dalam bentuk kertas atau output dicetak ke kertas.],
  [7], [#image(bytes("<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 54 34' width='44' height='26' stroke='black' stroke-width='1.5' fill='none'><path d='M 10 2 L 52 2 L 52 18 C 42 24 38 14 26 20 C 18 24 12 18 10 20 Z'/><path d='M 6 6 L 48 6 L 48 22 C 38 28 34 18 22 24 C 14 28 8 22 6 24 Z'/><path d='M 2 10 L 44 10 L 44 26 C 34 32 30 22 18 28 C 10 32 4 26 2 28 Z'/></svg>"), format: "svg")], [Multi Dokumen], [Menyatakan input berasal dari beberapa dokumen dalam bentuk kertas atau output dicetak ke kertas.],
  [8], [#box(width: 1.8cm, height: 0.8cm)[#polygon(fill: none, stroke: 0.8pt + black, (0%, 25%), (25%, 0%), (100%, 0%), (100%, 100%), (0%, 100%))]], [Card], [Menyatakan bahwa input berasal dari kartu/lembar kerja atau output ditulis ke kartu/lembar kerja.],
  [9], [#box(width: 1.8cm, height: 0.8cm)[#polygon(fill: none, stroke: 0.8pt + black, (0%, 35%), (100%, 0%), (100%, 100%), (0%, 100%))]], [Manual Input], [Menyatakan input dokumen yang dimasukkan secara manual dari keyboard/lembar kerja ke dalam komputer.],
  [10], [#box(width: 1.8cm, height: 0.8cm)[#polygon(fill: none, stroke: 0.8pt + black, (0%, 0%), (100%, 0%), (80%, 100%), (20%, 100%))]], [Manual Operation], [Menyatakan pengolahan data atau dokumen yang tidak dilakukan melalui komputer.],
)

#if tampilkan-catatan-pedoman [
  #v(1fr)
  #text(size: 8.5pt, style: "italic")[
    *Catatan (Hapus catatan ini setelah selesai diisi / sebelum dicetak):*\
    _Isi Daftar Simbol disesuaikan dengan simbol-simbol yang digunakan dalam penulisan TA/Skripsi masing-masing dan diketik dengan jarak satu spasi._
  ]
]
