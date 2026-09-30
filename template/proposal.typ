// =============================================================================
// ENTRYPOINT RESMI: PROPOSAL PRAKTIK KERJA LAPANGAN (PKL) UBSI
// Sesuai Bagian 3.1 & 3.2 Pedoman PKL UBSI (3 Bab)
// =============================================================================

#import "../lib.typ": pkl, cover-pkl, frontmatter-pkl
#import "metadata.typ": *

// 1. Lembar Judul Proposal (Cover: nomor i dihitung tapi tidak dicetak)
#cover-pkl(
  judul: judul,
  jenis: "proposal",
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

// Lembar Persetujuan Dosen PA
#include "bagian-awal/persetujuan-proposal.typ"

// Kata Pengantar
#include "bagian-awal/kata-pengantar.typ"

// Daftar Isi
#pagebreak()
#outline(
  title: [DAFTAR ISI],
  indent: auto,
  depth: 3,
)

// 3. Bagian Pokok (Mainmatter: Angka Latin 1, 2, 3...)
#counter(page).update(1)

#show: pkl.with(
  judul: judul,
  jenis: "proposal",
  penulis: penulis,
  nim: nim,
  program-studi: program-studi,
  fakultas: fakultas,
  universitas: universitas,
  kota: kota,
  tahun: tahun,
)

// Outline Proposal PKL (3 Bab)
#include "outlines/proposal/bab1.typ"
#include "outlines/proposal/bab2.typ"
#include "outlines/proposal/bab3.typ"
