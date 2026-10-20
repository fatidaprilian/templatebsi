// =============================================================================
// TEMPLATE TYPST: LAPORAN & PROPOSAL PRAKTIK KERJA LAPANGAN (PKL) UBSI
// Program Studi: Teknologi Informasi, Fakultas Teknik & Informatika
// Universitas Bina Sarana Informatika
// Berdasarkan Buku Pedoman Resmi PKL UBSI (Poin 2.1 - 2.7)
// =============================================================================
// FORMAT TAMPILAN JUDUL BAB & BAGIAN (Level 1) - Gambar 2 & Lampiran 18:
// Huruf Kapital, 14pt, Tebal, Posisi di Tengah.
// Jarak BAB ke Nama Judul: 2 spasi (14pt).
// Jarak Judul Bab ke Sub-bab Pertama: 4 Spasi (48pt).
// Untuk Bagian Awal/Akhir tanpa nomor bab: 2 spasi (24pt).
// =============================================================================
#let format-heading-level-1(it) = {
  // Hidden anchor untuk cover dan lembar persetujuan agar terdaftar rapi di Daftar Isi
  if it.body in ([Lembar Judul Laporan PKL], [Lembar Judul Proposal], [Lembar Persetujuan Laporan PKL], [Lembar Persetujuan Proposal PKL]) {
    return none
  }

  pagebreak(weak: true)
  // Reset nomor urut gambar dan tabel setiap pergantian bab
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  
  align(center)[
    #text(size: 14pt, weight: "bold")[
      #if it.numbering != none [
        #counter(heading).display()
        #v(14pt) // 2 spasi antara "BAB ..." dan Judul Bab (Gambar 2)
      ]
      #upper(it.body)
    ]
  ]
  if it.numbering != none {
    v(48pt) // 4 spasi ke sub-bab berikutnya (Gambar 2)
  } else {
    v(24pt) // 2 spasi untuk bagian awal/akhir tanpa nomor bab
  }
}

#let pkl(
  judul: "",
  jenis: "laporan", // "laporan" | "proposal"
  penulis: "",
  nim: "",
  program-studi: "Teknologi Informasi",
  fakultas: "Teknik dan Informatika",
  universitas: "Universitas Bina Sarana Informatika",
  kota: "Jakarta",
  tahun: "2026",
  body
) = {
  // Metadata Dokumen
  set document(
    title: judul,
    author: penulis,
  )

  // 1. Kertas A4 & Margin Pedoman PKL UBSI (Poin 2.1):
  // Margin Atas: 3 cm, Margin Kiri: 4 cm, Margin Bawah: 2.5 cm, Margin Kanan: 2.5 cm
  set page(
    paper: "a4",
    margin: (
      left: 4cm,
      top: 3cm,
      right: 2.5cm,
      bottom: 2.5cm,
    ),
    numbering: "1",
    header-ascent: 1cm, // Jarak tepat 2 cm dari tepi atas (Poin 2.4.2)
    footer-descent: 0.5cm, // Jarak tepat 2 cm dari tepi bawah (Poin 2.4.2)
    // Penomoran Halaman Bagian Pokok Dinamis (Poin 2.4 & Gambar 1):
    // - Halaman pertama BAB: Bawah Tengah (margin footer 0.3 cm dari tepi bawah)
    // - Halaman lanjutan dalam BAB: Kanan Atas
    header: context {
      let is-chapter-first-page = query(heading.where(level: 1)).any(h => h.location().page() == here().page())
      
      // Jika bukan halaman awal bab, nomor di pojok kanan atas (Poin 2.4.2 & Gambar 1)
      if not is-chapter-first-page {
        align(right)[#text(size: 12pt)[#counter(page).display("1")]]
      }
    },
    footer: context {
      let is-chapter-first-page = query(heading.where(level: 1)).any(h => h.location().page() == here().page())
      
      // Jika halaman awal bab, nomor di bagian bawah tengah (Poin 2.4.2 & Gambar 1)
      if is-chapter-first-page {
        align(center)[#text(size: 12pt)[#counter(page).display("1")]]
      }
    }
  )

  // 2. Tipografi: Times New Roman 12pt (Poin 2.1.4)
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "id",
  )

  // 3. Spasi Pengetikan Teks: Spasi 2 (Double Spacing), Indentasi Alinea 1.2cm, Rata Kanan-Kiri
  set par(
    justify: true,
    leading: 12pt, // Spasi 2
    first-line-indent: (amount: 1.2cm, all: true),
  )

  // 3b. Indentasi Rincian (List & Enum): Menjorok ke Dalam Sejajar Awal Alinea (1.2cm)
  set list(
    indent: 1.2cm,
    body-indent: 0.5em,
    marker: ([•], [--]),
  )
  set enum(
    indent: 1.2cm,
    body-indent: 0.5em,
  )

  // 4. Penomoran Heading Sesuai Pedoman PKL (Poin 2.3 & Gambar 2):
  // - Bab: Romawi (BAB I, BAB II)
  // - Sub-bab: Latin dengan titik penutup (2.1., 2.2.)
  // - Sub-sub-bab: Tiga digit dengan titik penutup (2.1.1., 2.1.2.)
  set heading(numbering: (..nums) => {
    let list = nums.pos()
    if list.len() == 1 {
      "BAB " + numbering("I", list.first())
    } else {
      list.map(str).join(".") + "."
    }
  })

  // 5. Format Tampilan Judul Bab (Level 1) - Gambar 2 & Lampiran 18
  show heading.where(level: 1): format-heading-level-1

  // Format Tampilan Sub-bab (Level 2) - Gambar 2:
  // 12pt, Tebal, Dimulai Margin Kiri.
  // Jarak sebelum sub-bab baru: 2 spasi (24pt). Jarak ke teks di bawahnya: 12pt.
  show heading.where(level: 2): it => {
    v(24pt) // 2 spasi sebelum sub-bab (Gambar 2)
    text(size: 12pt, weight: "bold")[#it]
    v(12pt)
  }

  // Format Tampilan Sub-sub-bab (Level 3) - Gambar 2:
  // 12pt, Tebal, Dimulai Margin Kiri.
  show heading.where(level: 3): it => {
    v(20pt)
    text(size: 12pt, weight: "bold")[#it]
    v(10pt)
  }

  // 5. Sistematika Poin Berjenjang (Poin 2.3 & Gambar 2):
  // 1. -> a. -> 1) -> a) -> (1)
  set enum(
    numbering: (..nums) => {
      let depth = nums.pos().len()
      let n = nums.pos().last()
      if depth == 1 {
        numbering("1.", n)
      } else if depth == 2 {
        numbering("a.", n)
      } else if depth == 3 {
        numbering("1)", n)
      } else if depth == 4 {
        numbering("a)", n)
      } else {
        numbering("(1)", n)
      }
    },
    indent: 1.2cm,
    body-indent: 0.5em,
  )

  // Format Rincian Poin Bullet (List): Otomatis menjorok 1.2 cm sejajar alinea baru
  set list(
    indent: 1.2cm,
    body-indent: 0.5em,
    marker: ([•], [--]),
  )

  // 6. Penomoran Gambar & Tabel Menggunakan Angka Romawi Bab (Poin 2.5 & Gambar 2, 3):
  // Format dua baris terpusat: Baris 1 "Tabel IV.4." / "Gambar II.2.", Baris 2 Nama Judul.
  set figure(numbering: (..nums) => {
    let chap-nums = counter(heading.where(level: 1)).get()
    let chap-roman = if chap-nums.len() > 0 and chap-nums.first() > 0 {
      numbering("I", chap-nums.first())
    } else {
      "I"
    }
    let fig-num = nums.pos().first()
    chap-roman + "." + str(fig-num) + "."
  })

  // Format Caption Tabel & Gambar: 2 baris terpusat di tengah dengan separator ganti baris (Gambar 2 & 3)
  set figure.caption(separator: [\ ])
  show figure.caption: it => {
    set text(size: 12pt)
    align(center)[#it]
  }

  // Format Judul Gambar: di bawah tengah gambar (Poin 2.5.1 & Gambar 3)
  show figure.where(kind: image): set figure(supplement: [Gambar])
  
  // Format Judul Tabel: di atas tengah tabel (Poin 2.5.1 & Gambar 2)
  show figure.where(kind: table): set figure(supplement: [Tabel])
  show figure.where(kind: table): set figure.caption(position: top)

  // Format Isi Tabel (Poin 2.1.3 & Gambar 2 Catatan):
  // Font size disesuaikan (10pt, minimal 8pt), spasi tunggal (1 spasi)
  show figure.where(kind: table): set text(size: 10pt)
  show table: set par(leading: 6pt, justify: false)

  body
}

// =============================================================================
// LEMBAR JUDUL / COVER PKL (PROPOSAL & LAPORAN) - Poin 2.2
// =============================================================================
#let cover-pkl(
  judul: "",
  jenis: "laporan", // "laporan" | "proposal"
  penulis: "",
  nim: "",
  jenjang: "Program Sarjana (S1)",
  program-studi: "Teknologi Informasi",
  fakultas: "Teknik dan Informatika",
  universitas: "Universitas Bina Sarana Informatika",
  kota: "Jakarta",
  tahun: "2026",
  is-kampus-utama: true,
  logo-path: "gambar/logo-ubsi.png",
) = {
  let label-jenis = if jenis == "proposal" {
    [PROPOSAL\ PRAKTIK KERJA LAPANGAN]
  } else {
    [LAPORAN\ PRAKTIK KERJA LAPANGAN]
  }

  let sub-teks = if jenis == "proposal" {
    "Diajukan untuk memenuhi salah satu syarat pelaksanaan Mata Kuliah Praktik Kerja Lapangan"
  } else {
    "Diajukan untuk memenuhi mata kuliah PKL pada Program " + jenjang
  }

  // Cover dihitung sebagai halaman i tetapi nomor tidak dicetak (Poin 2.4.1)
  page(
    header: none,
    footer: none,
    numbering: "i",
    margin: (left: 4cm, top: 3cm, right: 2.5cm, bottom: 2.5cm),
  )[
    #show heading: none
    #heading(level: 1, numbering: none, outlined: true)[Lembar Judul Laporan PKL]
    #set align(center)
    #set par(leading: 6pt) // Spasi 1.5 untuk lembar judul

    // 1. Judul: 14pt Huruf Kapital, Tebal, 1.5 Spasi
    #v(0.5cm)
    #text(size: 14pt, weight: "bold")[#upper(judul)]

    // 2. Logo Kampus Berwarna Ukuran Standar (4x4 cm)
    #v(1.2cm)
    #if logo-path != none [
      #image(logo-path, width: 4cm, height: 4cm)
    ]

    // 3. Tulisan PROPOSAL / LAPORAN: 18pt Huruf Kapital, Tebal
    #v(1cm)
    #text(size: 18pt, weight: "bold")[#label-jenis]

    // 4. Sub-teks Pengantar: 12pt
    #v(0.6cm)
    #text(size: 12pt)[#sub-teks]

    // 5. Nama Penulis & NIM: 14pt, 1.5 Spasi (Sesuai Lampiran 11)
    #v(1.2cm)
    #text(size: 14pt, weight: "bold")[
      #upper(penulis)\
      #v(6pt)
      NIM : #nim
    ]

    #v(1fr)

    // 6. Nama Prodi, Fakultas, Universitas, Kota, Tahun: 12pt, 1.5 Spasi
    #text(size: 12pt, weight: "bold")[
      Program Studi #program-studi\
      Fakultas #fakultas\
      #universitas\
      #if is-kampus-utama and kota != none and kota != "" [
        #kota\
      ]
      #tahun
    ]
  ]
}

// =============================================================================
// HELPER: BAGIAN AWAL (FRONTMATTER) - Poin 2.4.1
// Penomoran Romawi Kecil (i, ii, iii) di Bawah Tengah (2 cm dari bawah)
// =============================================================================
#let frontmatter-pkl(body) = {
  // Melanjutkan dari cover (cover adalah halaman 1 / i tapi tidak dicetak)
  counter(page).update(2)
  set page(
    paper: "a4",
    margin: (left: 4cm, top: 3cm, right: 2.5cm, bottom: 2.5cm),
    numbering: "i",
    footer-descent: 0.5cm, // Jarak tepat 2 cm dari bawah (Poin 2.4.1)
    header: none,
    footer: context {
      let page-num = counter(page).display("i")
      align(center)[#text(size: 12pt)[#page-num]]
    }
  )
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "id",
  )
  set par(
    justify: true,
    leading: 9pt, // 1.5 Spasi untuk bagian awal
    first-line-indent: (amount: 1.2cm, all: true), // Alinea baru menjorok 1.2 cm (5-7 ketukan)
  )
  set list(indent: 1.2cm, body-indent: 0.5em, marker: ([•], [--]))
  set enum(indent: 1.2cm, body-indent: 0.5em)
  show heading.where(level: 1): format-heading-level-1
  body
}

// =============================================================================
// HELPER: KUTIPAN PANJANG (>= 5 BARIS) - Poin 2.6.7 & Gambar 4
// 1 Spasi, Menjorok Sesuai Ketukan Paragraf, Tanpa Tanda Kutip
// =============================================================================
#let kutipan-panjang(body, sumber: none) = {
  v(12pt)
  pad(left: 1.2cm)[
    #set par(leading: 6pt, first-line-indent: 0cm, justify: true) // Spasi 1
    #text(size: 12pt)[
      #body
      #if sumber != none [ (#sumber)]
    ]
  ]
  v(12pt)
}

// =============================================================================
// HELPER: SUMBER GAMBAR / TABEL - Gambar 2 & 3
// =============================================================================
#let sumber(teks) = {
  align(left)[#text(size: 10pt)[Sumber: #teks]]
}

// =============================================================================
// HELPER: SITASI NARATIF (Nama Penulis (Tahun))
// Contoh: Menurut #sitasi-naratif(<pressman2014>), rekayasa perangkat lunak adalah ...
// =============================================================================
#let sitasi-naratif(key) = cite(key, form: "prose")

// =============================================================================
// LEMBAR COVER PROPOSAL PKL (Lampiran 1 & Lampiran 2)
// Mendukung Kampus Utama (ada kota) dan Luar Kampus Utama / PSDKU (tanpa kota)
// =============================================================================
#let cover-proposal-pkl(
  judul: "",
  penulis: "",
  nim: "",
  program-studi: "Teknologi Informasi",
  fakultas: "Teknik dan Informatika",
  universitas: "Universitas Bina Sarana Informatika",
  kota: "Jakarta",
  tahun: "2026",
  is-kampus-utama: true,
  logo-path: "../public/logo-ubsi.png",
) = {
  page(
    header: none,
    footer: none,
    numbering: "i",
    margin: (left: 4cm, top: 3cm, right: 2.5cm, bottom: 2.5cm),
  )[
    #show heading: none
    #heading(level: 1, numbering: none, outlined: true)[Lembar Judul Proposal]
    #set align(center)
    #set par(leading: 6pt) // Spasi 1.5

    // 1. Judul Proposal (14pt Huruf Kapital, Tebal)
    #v(1cm)
    #text(size: 14pt, weight: "bold")[#upper(judul)]

    // 2. Logo Universitas Bina Sarana Informatika Berwarna (4x4 cm - Gambar 1)
    #v(3cm)
    #if logo-path != none [
      #image(logo-path, width: 4cm, height: 4cm)
    ]

    #v(3cm)
    // 3. Nama Mahasiswa & NIM
    #text(size: 14pt, weight: "bold")[#upper(penulis)]\
    #v(4pt)
    #text(size: 14pt, weight: "bold")[NIM : #nim]

    #v(1fr)

    // 4. Institusi Bawah (Lampiran 1: dengan Kota; Lampiran 2: tanpa Kota)
    #text(size: 12pt, weight: "bold")[
      Program Studi #program-studi\
      Fakultas #fakultas\
      #universitas\
      #if is-kampus-utama and kota != none and kota != "" [
        #kota\
      ]
      #tahun
    ]
  ]
}

// =============================================================================
// LEMBAR PERSETUJUAN PROPOSAL PKL (Lampiran 5 & Lampiran 6)
// =============================================================================
#let persetujuan-proposal-pkl(
  judul: "",
  penulis: "",
  nim: "",
  jenjang: "Sarjana (S1)",
  program-studi: "Teknologi Informasi",
  fakultas: "Teknik dan Informatika",
  universitas: "Universitas Bina Sarana Informatika",
  kota: "Jakarta",
  tahun: "2026",
  semester: "Gasal",
  tahun-akademik: "2026",
  kelas: "",
  dosen-pa: "",
  tanggal-persetujuan: none,
  is-kampus-utama: true,
) = {
  page(
    header: none,
    footer: context {
      let page-num = counter(page).display("i")
      align(center)[#text(size: 12pt)[#page-num]]
    },
    margin: (left: 4cm, top: 3cm, right: 2.5cm, bottom: 2.5cm),
  )[
    #set par(leading: 8pt) // Spasi pengetikan persetujuan

    #heading(level: 1, numbering: none, outlined: true)[Lembar Persetujuan Proposal PKL]
    #let jenjang-label = if jenjang.contains("S1") or jenjang.contains("Sarjana") { "S1" } else { "D3" }

    #align(center)[
      #text(size: 14pt, weight: "bold")[
        PERSETUJUAN\
        PROPOSAL PRAKTIK KERJA LAPANGAN
      ]
    ]

    #v(1cm)
    Proposal Praktik Kerja Lapangan ini disusun oleh :

    #v(0.3cm)
    #table(
      columns: (3.5cm, 0.4cm, 1fr),
      stroke: none,
      inset: (y: 4pt),
      [Nama], [:], [#penulis],
      [NIM], [:], [#nim],
      [Jenjang], [:], [#jenjang],
      [Fakultas], [:], [#fakultas],
      [Program Studi], [:], [#program-studi],
    )

    #v(0.5cm)
    telah *disetujui* untuk permohonan PKL pada periode Semester #semester Tahun Akademik #tahun-akademik di Program Studi #program-studi (#jenjang-label) Fakultas #fakultas #universitas.

    #v(1cm)
    #align(center)[
      #let tgl = if tanggal-persetujuan != none { tanggal-persetujuan } else { kota + ", " + datetime.today().display("[day] [month repr:long] [year]") }
      #tgl\
      #v(0.3cm)
      #text(weight: "bold")[
        DOSEN PENASEHAT AKADEMIK\
        Kelas #kelas
      ]\
      #v(2cm)
      ttd\
      #v(0.5cm)
      *( #dosen-pa )*
    ]

    #v(1fr)

    // Catatan Kaki Wajib Sesuai Lampiran 5 & 6
    #block(
      stroke: none,
      inset: 0pt,
    )[
      #set text(size: 9pt, style: "italic")
      #set par(leading: 4pt)
      *Catatan (Hapus catatan ini setelah selesai diisi / sebelum dicetak):*\
      - Nama Kelas diisi dengan kelas pada semester V (Program D3) dan Semester VII (Program S1)\
      - Nama Dosen PA diisi nama lengkap dan gelar dosen Penasehat Akademik\
      - Tanda Tangan dosen Penasehat Akademik *wajib* asli
    ]
  ]
}

// =============================================================================
// HELPER: DAFTAR ISI (Lampiran 18)
// Jarak 1 spasi, kolom Halaman di kanan atas, catatan kaki di bawah
// =============================================================================
#let daftar-isi(tampilkan-catatan: false) = {
  heading(level: 1, numbering: none, outlined: true)[Daftar Isi]
  align(right)[#text(size: 11pt, weight: "regular")[Halaman]]
  v(0.3em)
  {
    set par(leading: 6pt) // 1 Spasi sesuai Catatan Lampiran 18
    outline(
      title: none,
      indent: auto,
      depth: 3,
    )
  }
  if tampilkan-catatan {
    v(1fr)
    text(size: 8.5pt, style: "italic")[
      *Catatan (Hapus catatan ini sebelum dijilid / dicetak):*\
      Daftar Isi, Tabel, Gambar, dan Daftar Lampiran diketik dengan jarak 1 (satu) spasi
    ]
  }
}

// =============================================================================
// HELPER: DAFTAR GAMBAR (Lampiran 21) & DAFTAR TABEL (Lampiran 22)
// Jarak 1 spasi, kolom Halaman di kanan atas, catatan kaki di bawah
// =============================================================================
#let daftar-gambar(tampilkan-catatan: false) = {
  heading(level: 1, numbering: none, outlined: true)[Daftar Gambar]
  align(right)[#text(size: 11pt, weight: "regular")[Halaman]]
  v(0.3em)
  {
    set par(leading: 6pt) // 1 Spasi sesuai Catatan 1 Lampiran 21
    let fig-counter = counter("daftar-gambar-counter")
    fig-counter.update(0)
    show outline.entry: it => {
      if it.element != none and it.element.func() == figure and it.element.kind == image {
        fig-counter.step()
        context [
          #fig-counter.display("1.") #it.element.supplement #it.element.counter.display(it.element.numbering) #it.element.caption.body #box(width: 1fr, it.fill) #it.element.location().page()\
        ]
      } else {
        it
      }
    }
    outline(
      title: none,
      target: figure.where(kind: image),
    )
  }
  if tampilkan-catatan {
    v(1fr)
    text(size: 8.5pt, style: "italic")[
      *Catatan (Hapus catatan ini sebelum dijilid / dicetak):*\
      1. Daftar gambar, tabel, lampiran diketik dengan jarak satu spasi.
    ]
  }
}

#let daftar-tabel(tampilkan-catatan: false) = {
  heading(level: 1, numbering: none, outlined: true)[Daftar Tabel]
  align(right)[#text(size: 11pt, weight: "regular")[Halaman]]
  v(0.3em)
  {
    set par(leading: 6pt) // 1 Spasi sesuai Catatan 1 Lampiran 22
    let tbl-counter = counter("daftar-tabel-counter")
    tbl-counter.update(0)
    show outline.entry: it => {
      if it.element != none and it.element.func() == figure and it.element.kind == table {
        tbl-counter.step()
        context [
          #tbl-counter.display("1.") #it.element.supplement #it.element.counter.display(it.element.numbering) #it.element.caption.body #box(width: 1fr, it.fill) #it.element.location().page()\
        ]
      } else {
        it
      }
    }
    outline(
      title: none,
      target: figure.where(kind: table),
    )
  }
  if tampilkan-catatan {
    v(1fr)
    text(size: 8.5pt, style: "italic")[
      *Catatan (Hapus catatan ini sebelum dijilid / dicetak):*\
      1. Daftar gambar, tabel, lampiran diketik dengan jarak satu spasi.
    ]
  }
}


// =============================================================================
// HELPER: BAGIAN AKHIR (BACKMATTER) - Poin 2.4.3
// Nomor halaman ditulis di bagian BAWAH TENGAH dengan angka latin (2 cm dari bawah)
// =============================================================================
#let backmatter-pkl(body) = {
  set page(
    paper: "a4",
    margin: (left: 4cm, top: 3cm, right: 2.5cm, bottom: 2.5cm),
    numbering: "1",
    footer-descent: 0.5cm, // Jarak tepat 2 cm dari bawah (Poin 2.4.3)
    header: none,
    footer: context {
      let page-num = counter(page).display("1")
      align(center)[#text(size: 12pt)[#page-num]]
    }
  )
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "id",
  )
  set heading(numbering: none)
  show heading.where(level: 1): format-heading-level-1
  // Aturan 2.7 Poin 7 & Gambar 2: Setiap pustaka 1 spasi (rata kiri-kanan), antar pustaka 2 spasi (24pt)
  show bibliography: set par(leading: 6pt, spacing: 24pt, justify: true)
  body
}
