// Template Utama Tugas Akhir / Skripsi / PKL UBSI
// Program Studi Teknologi Informasi

#import "../lib.typ": templatebsi, cover-ubsi
#import "metadata.typ": *

// 1. Render Cover Dokumen
#cover-ubsi(
  judul: judul,
  jenis: jenis,
  penulis: penulis,
  nim: nim,
  program-studi: program-studi,
  fakultas: fakultas,
  universitas: universitas,
  kota: kota,
  tahun: tahun,
  logo-path: "gambar/logo-ubsi.png",
)

// 2. Terapkan Layout Master Template BSI
#show: templatebsi.with(
  judul: judul,
  jenis: jenis,
  penulis: penulis,
  nim: nim,
  program-studi: program-studi,
  fakultas: fakultas,
  universitas: universitas,
  kota: kota,
  tahun: tahun,
)

// 3. Halaman Awal (Daftar Isi)
#outline(
  title: [DAFTAR ISI],
  indent: auto,
  depth: 3,
)

// 4. Isi Dokumen (Bab)
#include "babs/bab1.typ"

// 5. Daftar Pustaka
#pagebreak()
#bibliography(
  "pustaka.bib",
  title: [DAFTAR PUSTAKA],
  style: "ieee",
)
