// =============================================================================
// MAIN ENTRYPOINT: LAPORAN / PROPOSAL PKL UBSI
// Program Studi: Teknologi Informasi
// =============================================================================

#import "../lib.typ": pkl, cover-pkl, frontmatter-pkl
#import "metadata.typ": *

// 1. Render Cover Dokumen (Halaman i, nomor halaman tidak dicetak)
#cover-pkl(
  judul: judul,
  jenis: jenis,
  penulis: penulis,
  nim: nim,
  program-studi: program-studi,
  fakultas: fakultas,
  universitas: universitas,
  kota: kota,
  tahun: tahun,
  logo-path: "../public/logo-ubsi.png",
)

// 2. Bagian Awal (Frontmatter: Angka Romawi Kecil di Bawah Tengah)
#show: frontmatter-pkl

#outline(
  title: [DAFTAR ISI],
  indent: auto,
  depth: 3,
)

// 3. Bagian Pokok (Mainmatter: Angka Latin, Halaman Awal Bab di Bawah Tengah, Lanjutan di Kanan Atas)
#counter(page).update(1)

#show: pkl.with(
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

// Include Bab-bab
#include "babs/bab1.typ"

// 4. Bagian Akhir: Daftar Pustaka (Wajib APA Style Versi 6)
#pagebreak()
#bibliography(
  "pustaka.bib",
  title: [DAFTAR PUSTAKA],
  style: "apa",
)
