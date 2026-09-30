// Template Typst Tugas Akhir / Skripsi & PKL Universitas Bina Sarana Informatika (UBSI)
// Program Studi Teknologi Informasi

#let templatebsi(
  judul: "",
  jenis: "skripsi", // "skripsi" | "pkl"
  penulis: "",
  nim: "",
  program-studi: "Teknologi Informasi",
  fakultas: "Teknik dan Informatika",
  universitas: "Universitas Bina Sarana Informatika",
  kota: "Jakarta",
  tahun: "2026",
  body
) = {
  // Pengaturan Dokumen Standar Akademik UBSI
  set document(
    title: judul,
    author: penulis,
  )

  // Pengaturan Halaman A4 dengan Margin 4-4-3-3 (Kiri 4cm, Atas 4cm, Kanan 3cm, Bawah 3cm)
  set page(
    paper: "a4",
    margin: (
      left: 4cm,
      top: 4cm,
      right: 3cm,
      bottom: 3cm,
    ),
    footer: context {
      let page-num = counter(page).display()
      align(center)[#text(size: 10pt)[#page-num]]
    }
  )

  // Pengaturan Tipografi: Times New Roman 12pt, Spasi 1.5, Rata Kanan-Kiri
  set text(
    font: ("Times New Roman", "Nimbus Roman No9 L", "Liberation Serif"),
    size: 12pt,
    lang: "id",
  )

  set par(
    justify: true,
    leading: 1.5em,
    first-line-indent: 1cm,
  )

  // Pengaturan Format Penomoran Heading (Bab & Sub-bab)
  set heading(numbering: (..nums) => {
    let list = nums.pos()
    if list.len() == 1 {
      "BAB " + numbering("I", list.first())
    } else {
      numbering("1.1", ..list)
    }
  })

  // Tampilan Heading Level 1 (BAB) di Tengah, Huruf Kapital, Tebal
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    align(center)[
      #v(1cm)
      #text(size: 14pt, weight: "bold")[
        #if it.numbering != none {
          counter(heading).display()
          linebreak()
        }
        #upper(it.body)
      ]
      #v(1.5em)
    ]
  }

  // Tampilan Heading Level 2 (Sub-bab)
  show heading.where(level: 2): it => {
    v(1em)
    text(size: 12pt, weight: "bold")[#it]
    v(0.5em)
  }

  // Tampilan Heading Level 3 (Anak Sub-bab)
  show heading.where(level: 3): it => {
    v(0.8em)
    text(size: 12pt, weight: "bold")[#it]
    v(0.4em)
  }

  // Format Penomoran Gambar dan Tabel (contoh: Gambar 1.1)
  show figure.where(kind: image): set figure(supplement: [Gambar])
  show figure.where(kind: table): set figure(supplement: [Tabel])

  body
}

// Komponen Cover UBSI Standar
#let cover-ubsi(
  judul: "",
  jenis: "skripsi", // "skripsi" | "pkl"
  penulis: "",
  nim: "",
  program-studi: "Teknologi Informasi",
  fakultas: "Teknik dan Informatika",
  universitas: "Universitas Bina Sarana Informatika",
  kota: "Jakarta",
  tahun: "2026",
  logo-path: "gambar/logo-ubsi.png",
) = {
  let label-jenis = if jenis == "skripsi" {
    "SKRIPSI"
  } else {
    "LAPORAN PRAKTIK KERJA LAPANGAN"
  }

  let sub-teks = if jenis == "skripsi" {
    "Diajukan untuk memenuhi salah satu syarat kelulusan Program Sarjana"
  } else {
    "Diajukan sebagai salah satu syarat untuk menyelesaikan Mata Kuliah Praktik Kerja Lapangan"
  }

  let logo-size = if jenis == "skripsi" { 5cm } else { 4cm }

  page(
    header: none,
    footer: none,
    margin: (left: 4cm, top: 4cm, right: 3cm, bottom: 3cm),
  )[
    #align(center)[
      #v(0.5cm)
      #text(size: 14pt, weight: "bold")[#upper(judul)]

      #v(1.5cm)
      #if logo-path != none {
        image(logo-path, width: logo-size, height: logo-size)
      }

      #v(1.2cm)
      #text(size: 16pt, weight: "bold")[#label-jenis]

      #v(0.8cm)
      #text(size: 11pt)[#sub-teks]

      #v(1.2cm)
      #text(size: 12pt, weight: "bold")[Oleh:]\
      #v(0.2cm)
      #text(size: 13pt, weight: "bold")[#upper(penulis)]\
      #text(size: 12pt, weight: "bold")[NIM. #nim]

      #v(1fr)

      #text(size: 12pt, weight: "bold")[
        Program Studi #program-studi\
        Fakultas #fakultas\
        #universitas\
        #kota\
        #tahun
      ]
    ]
  ]
}
