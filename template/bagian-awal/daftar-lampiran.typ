// =============================================================================
// DAFTAR LAMPIRAN
// =============================================================================

#pagebreak()
#align(center)[
  #text(size: 14pt, weight: "bold")[DAFTAR LAMPIRAN]
]
#v(1.5em)

#table(
  columns: (3cm, 1fr, 2cm),
  stroke: (x, y) => if y == 0 { (bottom: 1pt + black) } else { none },
  inset: 8pt,
  [*Nomor*], [*Keterangan Lampiran*], [*Halaman*],
  [Lampiran 1], [Daftar Riwayat Hidup], [-],
  [Lampiran 2], [Surat Keterangan / Sertifikat PKL], [-],
  [Lampiran 3], [Lembar Nilai PKL dari Perusahaan], [-],
  [Lampiran 4], [Lembar Kuesioner Kepuasan Mentor/Pimpinan], [-],
  [Lampiran 5], [Dokumen Masukan / Keluaran dan Source Code], [-],
)
