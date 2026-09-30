// =============================================================================
// FORM URAIAN KEGIATAN PRAKTIK KERJA LAPANGAN (Sesuai Lampiran 30)
// =============================================================================
#import "../../lib.typ": *
#import "../metadata.typ": *

#pagebreak()
#align(center)[
  #text(size: 13pt, weight: "bold")[URAIAN KEGIATAN PRAKTIK KERJA LAPANGAN]\
  #v(0.2cm)
  #text(size: 11pt, weight: "bold")[#nama-instansi]\
  #text(size: 10pt)[(#divisi-instansi)]\
  #v(0.2cm)
  #text(size: 10pt, weight: "bold")[PERIODE Bulan: Agustus s/d Oktober 2026]
]

#v(0.5cm)
#grid(
  columns: (1fr, 1fr),
  [MINGGU KE: 1 (Satu)],
  [#align(right)[BULAN KE: 1 (Agustus)]],
)

#v(0.3cm)
#table(
  columns: (1cm, 3.5cm, 2.5cm, 1fr, 2.5cm),
  stroke: 0.5pt + black,
  inset: 6pt,
  table.header(
    [*NO*], [*HARI / TANGGAL*], [*WAKTU*], [*JENIS KEGIATAN*], [*TANDA TANGAN*],
  ),
  [1], [Senin, 3 Ags 2026], [08.00 - 17.00], [Pengenalan SOP dan infrastruktur jaringan lab], [],
  [2], [Selasa, 4 Ags 2026], [08.00 - 17.00], [Pemetaan topologi fisik dan penomoran kabel switch], [],
  [3], [Rabu, 5 Ags 2026], [08.00 - 17.00], [Pengecekan segmen IP Address dan gateway router], [],
  [4], [Kamis, 6 Ags 2026], [08.00 - 17.00], [Analisis monitoring trafik menggunakan Wireshark], [],
  [5], [Jumat, 7 Ags 2026], [08.00 - 17.00], [Evaluasi mingguan bersama mentor lapangan], [],
)

#v(0.5cm)
#text(size: 8.5pt)[
  *Keterangan :*\
  Mahasiswa diwajibkan untuk mengisi uraian kegiatan harian selama melaksanakan PKL.\
  - No : Nomor urut kegiatan yang dilakukan\
  - Hari/Tanggal : Hari dan Tanggal pelaksanaan kegiatan\
  - Waktu : Waktu melakukan kegiatan PKL per harinya\
  - Jenis Kegiatan : Kegiatan-kegiatan yang dilakukan\
  - Tanda Tangan : Tanda tangan dari Pimpinan Unit / Mentor PKL.
]
