// =============================================================================
// ENTRYPOINT RESMI: LAPORAN PRAKTIK KERJA LAPANGAN (PKL) UBSI
// Program Studi: Teknologi Informasi (S1)
// Outline: Proyek Inovasi Perangkat Lunak (6 Bab)
// =============================================================================

#import "../lib.typ": pkl, cover-pkl, frontmatter-pkl
#import "metadata.typ": *

// 1. Lembar Judul Laporan (Cover: nomor i dihitung tapi tidak dicetak)
#cover-pkl(
  judul: judul,
  jenis: "laporan",
  penulis: penulis,
  nim: nim,
  program-studi: program-studi,
  fakultas: fakultas,
  universitas: universitas,
  kota: kota,
  tahun: tahun,
  logo-path: "../public/logo-ubsi.png",
)

// 2. Bagian Awal (Frontmatter: Romawi Kecil Bawah Tengah)
#show: frontmatter-pkl

// Lembar Pengesahan PKL
#include "bagian-awal/pengesahan-pkl.typ"

// Kata Pengantar
#include "bagian-awal/kata-pengantar.typ"

// Daftar Isi
#pagebreak()
#outline(
  title: [DAFTAR ISI],
  indent: auto,
  depth: 3,
)

// Daftar Simbol
#include "bagian-awal/daftar-simbol.typ"

// Daftar Gambar
#pagebreak()
#outline(
  title: [DAFTAR GAMBAR],
  target: figure.where(kind: image),
)

// Daftar Tabel
#pagebreak()
#outline(
  title: [DAFTAR TABEL],
  target: figure.where(kind: table),
)

// Daftar Lampiran
#include "bagian-awal/daftar-lampiran.typ"

// 3. Bagian Pokok (Mainmatter: Angka Latin 1, 2, 3...)
#counter(page).update(1)

#show: pkl.with(
  judul: judul,
  jenis: "laporan",
  penulis: penulis,
  nim: nim,
  program-studi: program-studi,
  fakultas: fakultas,
  universitas: universitas,
  kota: kota,
  tahun: tahun,
)

// OUTLINE PKL: PROYEK INOVASI PERANGKAT LUNAK (6 BAB)
#include "outlines/pkl-ti-inovasi/bab1.typ"
#include "outlines/pkl-ti-inovasi/bab2.typ"
#include "outlines/pkl-ti-inovasi/bab3.typ"
#include "outlines/pkl-ti-inovasi/bab4.typ"
#include "outlines/pkl-ti-inovasi/bab5.typ"
#include "outlines/pkl-ti-inovasi/bab6.typ"

// 4. Bagian Akhir (Backmatter)
#pagebreak()
#bibliography(
  "pustaka.bib",
  title: [DAFTAR PUSTAKA],
  style: "apa",
)

// Daftar Riwayat Hidup
#include "bagian-akhir/daftar-riwayat-hidup.typ"

// Surat Keterangan / Sertifikat PKL
#include "bagian-akhir/surat-keterangan-pkl.typ"

// Lembar Nilai PKL
#include "bagian-akhir/lembar-nilai-pkl.typ"

// Lembar Kuesioner
#include "bagian-akhir/lembar-kuesioner.typ"

// Lampiran-Lampiran
#include "bagian-akhir/lampiran-pkl.typ"
