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
  table.header(
    table.cell(align: center)[*Bentuk Simbol*],
    table.cell(align: center)[*Nama Simbol*],
    table.cell(align: center)[*Keterangan / Fungsi*],
  ),
  [#align(center)[#ellipse(width: 2cm, height: 1cm)[#align(center + horizon)[_Use Case_]]]],
  [Use Case],
  [Menggambarkan fungsionalitas atau layanan yang disediakan oleh sistem bagi aktor.],

  [#align(center)[#circle(radius: 0.25cm)\ #line(start: (0%, 0%), end: (0%, 0.4cm))\ #line(start: (-0.3cm, 0.15cm), end: (0.3cm, 0.15cm))\ #line(start: (0%, 0.4cm), end: (-0.25cm, 0.8cm))\ #line(start: (0%, 0.4cm), end: (0.25cm, 0.8cm))]],
  [Actor / Aktor],
  [Menggambarkan peran entitas luar (pengguna, peran, atau sistem eksternal) yang berinteraksi dengan sistem.],

  [#align(center)[#line(length: 2cm, stroke: 1pt + black)]],
  [Asosiasi / _Association_],
  [Menghubungkan interaksi dan komunikasi antara aktor dengan _use case_.],

  [#align(center)[#line(length: 2cm, stroke: (paint: black, dash: "dashed"))]],
  [Dependensi / _Dependency_],
  [Menunjukkan ketergantungan antarelemen model di mana perubahan satu elemen mempengaruhi elemen lainnya.],

  [#align(center)[#rect(width: 2.2cm, height: 1.2cm)[#align(center + horizon)[Nama Kelas\ + atribut\ + operasi()]]]],
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
  table.header(
    table.cell(align: center)[*Bentuk Simbol*],
    table.cell(align: center)[*Nama Simbol*],
  ),
  [#align(center)[#rect(width: 1.2cm, height: 1.5cm, stroke: 1pt + black)[#align(center + horizon)[Server]]]], [Server],
  [#align(center)[#rect(width: 1.4cm, height: 1.6cm, stroke: 1pt + black)[#align(center + horizon)[Mainframe]]]], [Mainframe],
  [#align(center)[#circle(radius: 0.6cm)[#align(center + horizon)[Router]]]], [Router],
  [#align(center)[#rect(width: 1.5cm, height: 1cm, stroke: 1pt + black)[#align(center + horizon)[Hub]]]], [Hub],
  [#align(center)[#rect(width: 1.8cm, height: 0.8cm, stroke: 1pt + black)[#align(center + horizon)[Switch]]]], [Switch],
  [#align(center)[#rect(width: 1.6cm, height: 0.7cm, stroke: 1pt + black)[#align(center + horizon)[Bridge]]]], [Bridge],
  [#align(center)[#rect(width: 1.6cm, height: 0.7cm, stroke: 1pt + black)[#align(center + horizon)[Modem]]]], [Modem],
  [#align(center)[#line(length: 1.8cm, stroke: 1.5pt + black)]], [Communication Link],
  [#align(center)[#circle(radius: 0.6cm)[#align(center + horizon)[AP]]]], [Wireless Access Point],
  [#align(center)[#rect(width: 1.4cm, height: 1.6cm, stroke: 1pt + black)[#align(center + horizon)[Firewall]]]], [Firewall],
  [#align(center)[#rect(width: 1.5cm, height: 1.1cm, stroke: 1pt + black)[#align(center + horizon)[Printer]]]], [Printer],
  [#align(center)[#rect(width: 2cm, height: 0.5cm, stroke: 1pt + black)[#align(center + horizon)[Ethernet]]]], [Ethernet],
  [#align(center)[#rect(width: 1.2cm, height: 1cm, stroke: 1pt + black)[#align(center + horizon)[IP Phone]]]], [Telephone],
  [#align(center)[#rect(width: 1.4cm, height: 1.2cm, stroke: 1pt + black)[#align(center + horizon)[PC]]]], [Personal Computer],
  [#align(center)[#rect(width: 1.5cm, height: 1cm, stroke: 1pt + black)[#align(center + horizon)[Laptop]]]], [Laptop],
  [#align(center)[#rect(width: 1.6cm, height: 0.8cm, stroke: 1pt + black)[#align(center + horizon)[Scanner]]]], [Scanner],
  [#align(center)[#circle(radius: 0.4cm)[#align(center + horizon)[User]]]], [User],
)

#v(0.6cm)
*c. Simbol Proses / Flowchart Dokumen* (Lampiran 20)

#v(0.3cm)
#table(
  columns: (0.8cm, 2.5cm, 3cm, 1fr),
  stroke: 0.5pt + black,
  inset: 4.5pt,
  table.header(
    table.cell(align: center)[*NO*],
    table.cell(align: center)[*BENTUK SIMBOL*],
    table.cell(align: center)[*NAMA SIMBOL*],
    table.cell(align: center)[*FUNGSI SIMBOL*],
  ),
  [1], [#align(center)[#rect(width: 1.8cm, height: 0.8cm, radius: 0.4cm)[#align(center + horizon)[_Start/End_]]]], [Terminal/Terminator], [Menyatakan permulaan (Start/Mulai) atau Akhir (End/Selesai) suatu kegiatan atau proses alur dokumen baik manual maupun terkomputerisasi.],
  [2], [#align(center)[#rect(width: 1.8cm, height: 0.9cm)[#align(center + horizon)[Proses]]]], [Proses], [Menyatakan tindakan proses yang dilakukan oleh bagian yang berwenang atas dokumen tersebut baik secara manual maupun terkomputerisasi.],
  [3], [#align(center)[#polygon((0%, 100%), (25%, 0%), (100%, 0%), (75%, 100%))]], [Input/output Data], [Menyatakan proses input/output data atau dokumen tanpa tergantung dari jenis peralatannya.],
  [4], [#align(center)[#polygon((50%, 0%), (100%, 50%), (50%, 100%), (0%, 50%))]], [Keputusan/Decision], [Menunjukkan suatu kondisi tertentu dari dokumen yang akan diproses dengan menghasilkan dua keputusan: Ya (lanjut) atau Tidak (dikembalikan).],
  [5], [#align(center)[#polygon((25%, 0%), (75%, 0%), (100%, 50%), (75%, 100%), (25%, 100%), (0%, 50%))]], [Preparation], [Menyatakan tempat untuk mempersiapkan penyimpanan yang akan digunakan sebagai tempat pengolahan di dalam storage.],
  [6], [#align(center)[#rect(width: 1.8cm, height: 0.9cm)[#align(center + horizon)[Dokumen]]]], [Dokumen], [Menyatakan input berasal dari dokumen dalam bentuk kertas atau output dicetak ke kertas.],
  [7], [#align(center)[#rect(width: 1.8cm, height: 0.9cm)[#align(center + horizon)[Multi Dok]]]], [Multi Dokumen], [Menyatakan input berasal dari beberapa dokumen dalam bentuk kertas atau output dicetak ke kertas.],
  [8], [#align(center)[#rect(width: 1.8cm, height: 0.9cm)[#align(center + horizon)[Card]]]], [Card], [Menyatakan bahwa input berasal dari kartu/lembar kerja atau output ditulis ke kartu/lembar kerja.],
  [9], [#align(center)[#polygon((0%, 30%), (100%, 0%), (100%, 100%), (0%, 100%))]], [Manual Input], [Menyatakan input dokumen yang dimasukkan secara manual dari keyboard/lembar kerja ke dalam komputer.],
  [10], [#align(center)[#polygon((0%, 0%), (100%, 0%), (80%, 100%), (20%, 100%))]], [Manual Operation], [Menyatakan pengolahan data atau dokumen yang tidak dilakukan melalui komputer.],
)

#if tampilkan-catatan-pedoman [
  #v(1fr)
  #text(size: 8.5pt, style: "italic")[
    *Catatan (Hapus catatan ini setelah selesai diisi / sebelum dicetak):*\
    _Isi Daftar Simbol disesuaikan dengan simbol-simbol yang digunakan dalam penulisan TA/Skripsi masing-masing dan diketik dengan jarak satu spasi._
  ]
]
