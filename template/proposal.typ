// =============================================================================
// ENTRYPOINT RESMI: PROPOSAL PRAKTIK KERJA LAPANGAN (PKL) UBSI
// Berdasarkan Pedoman Resmi PKL UBSI (Lampiran 1/2, Lampiran 5/6, dan 3 Bab)
// =============================================================================

#import "../lib.typ": *
#import "metadata.typ": *

// 1. Lembar Cover Proposal PKL (Lampiran 1 & 2: nomor i dihitung tapi tidak dicetak)
#cover-proposal-pkl(
  judul: judul,
  penulis: penulis,
  nim: nim,
  program-studi: program-studi,
  fakultas: fakultas,
  universitas: universitas,
  kota: kota,
  tahun: tahun,
  is-kampus-utama: is-kampus-utama,
  logo-path: "public/logo-ubsi.png",
)

// 2. Bagian Awal (Frontmatter: Halaman ii dst di Bawah Tengah)
#counter(page).update(2)
#show: frontmatter-pkl

// Lembar Persetujuan Dosen PA (Lampiran 5 & 6: Halaman ii)
#include "bagian-awal/persetujuan-proposal.typ"

// Kata Pengantar Proposal PKL (Halaman iii)
#include "bagian-awal/kata-pengantar.typ"

// Daftar Isi Proposal PKL (Halaman iv)
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

// Outline Proposal PKL (3 Bab Resmi)
#include "outlines/proposal/bab1.typ"
#include "outlines/proposal/bab2.typ"
#include "outlines/proposal/bab3.typ"
