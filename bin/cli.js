#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const readline = require('readline');

function createPromptReader() {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    terminal: process.stdin.isTTY,
  });

  const lines = [];
  let waitingResolver = null;

  rl.on('line', line => {
    if (waitingResolver) {
      const res = waitingResolver;
      waitingResolver = null;
      res(line);
    } else {
      lines.push(line);
    }
  });

  rl.on('close', () => {
    if (waitingResolver) {
      const res = waitingResolver;
      waitingResolver = null;
      res('');
    }
  });

  return {
    ask(q) {
      process.stdout.write(q);
      if (lines.length > 0) return Promise.resolve(lines.shift().trim());
      return new Promise(res => {
        waitingResolver = ans => res(ans.trim());
      });
    },
    close() {
      rl.close();
    },
  };
}

function copyFileSync(src, dest) {
  const parent = path.dirname(dest);
  if (!fs.existsSync(parent)) fs.mkdirSync(parent, { recursive: true });
  fs.copyFileSync(src, dest);
}

function copyDirSync(src, dest) {
  if (!fs.existsSync(dest)) fs.mkdirSync(dest, { recursive: true });
  for (const ent of fs.readdirSync(src, { withFileTypes: true })) {
    const s = path.join(src, ent.name);
    const d = path.join(dest, ent.name);
    if (ent.isDirectory()) copyDirSync(s, d);
    else fs.copyFileSync(s, d);
  }
}

async function main() {
  console.log('====================================================');
  console.log('Template Typst PKL & Proposal UBSI Scaffolder CLI');
  console.log('Program Studi: Teknologi Informasi (S1)');
  console.log('====================================================\n');

  const pr = createPromptReader();

  let targetDirName = '';
  let isProposal = false;
  let selectedOutline = null;

  try {
    const defaultName = process.argv[2] || 'laporan-pkl-ubsi';
    const folderInput = await pr.ask(`Nama folder proyek [${defaultName}]: `);
    targetDirName = folderInput || defaultName;

    console.log('\nPilih Jenis Dokumen:');
    console.log('  1. Proposal PKL (3 Bab)');
    console.log('  2. Laporan Akhir PKL (4 Pilihan Outline)');
    const jenisChoice = await pr.ask('Pilihan Anda [1-2] (default: 2): ');
    isProposal = jenisChoice === '1';

    if (!isProposal) {
      console.log('\nPilih Outline Laporan PKL Teknologi Informasi:');
      console.log('  1. Proyek Inovasi Perangkat Lunak (6 Bab)');
      console.log('  2. Analisa Program Berbasis Mobile (4 Bab)');
      console.log('  3. Jaringan Komputer (4 Bab)');
      console.log('  4. Analisis Sistem (4 Bab)');
      const outlineChoice = await pr.ask('Pilihan Outline [1-4] (default: 1): ');

      const outlines = {
        '1': {
          name: 'Proyek Inovasi Perangkat Lunak',
          dir: 'pkl-ti-inovasi',
          babs: ['bab1', 'bab2', 'bab3', 'bab4', 'bab5', 'bab6'],
        },
        '2': {
          name: 'Analisa Program Berbasis Mobile',
          dir: 'pkl-ti-mobile',
          babs: ['bab1', 'bab2', 'bab3', 'bab4'],
        },
        '3': {
          name: 'Jaringan Komputer',
          dir: 'pkl-ti-jaringan',
          babs: ['bab1', 'bab2', 'bab3', 'bab4'],
        },
        '4': {
          name: 'Analisis Sistem',
          dir: 'pkl-ti-analisis-sistem',
          babs: ['bab1', 'bab2', 'bab3', 'bab4'],
        },
      };
      selectedOutline = outlines[outlineChoice] || outlines['1'];
    }
  } finally {
    pr.close();
  }

  const targetDir = path.resolve(process.cwd(), targetDirName);
  if (fs.existsSync(targetDir) && fs.readdirSync(targetDir).length > 0) {
    console.error(`\nError: Direktori '${targetDirName}' sudah ada dan tidak kosong.`);
    process.exit(1);
  }

  console.log(`\nMenyiapkan proyek di: ${targetDir} ...`);

  const pkgRoot = path.resolve(__dirname, '..');

  // 1. Copy core files
  copyFileSync(path.join(pkgRoot, 'lib.typ'), path.join(targetDir, 'lib.typ'));
  copyFileSync(path.join(pkgRoot, 'template/metadata.typ'), path.join(targetDir, 'metadata.typ'));
  copyFileSync(path.join(pkgRoot, 'template/pustaka.bib'), path.join(targetDir, 'pustaka.bib'));
  copyFileSync(
    path.join(pkgRoot, 'template/gambar/logo-ubsi.png'),
    path.join(targetDir, 'gambar/logo-ubsi.png')
  );

  // 2. Adjust and copy sections
  if (isProposal) {
    // Proposal structure
    copyDirSync(path.join(pkgRoot, 'template/bagian-awal'), path.join(targetDir, 'bagian-awal'));

    // Fix imports in bagian-awal
    const awalPath = path.join(targetDir, 'bagian-awal');
    for (const f of fs.readdirSync(awalPath)) {
      if (f.endsWith('.typ')) {
        const filePath = path.join(awalPath, f);
        let c = fs.readFileSync(filePath, 'utf8');
        c = c.replace(/\.\.\/\.\.\/lib\.typ/g, '../lib.typ');
        c = c.replace(/\.\.\/metadata\.typ/g, '../metadata.typ');
        fs.writeFileSync(filePath, c, 'utf8');
      }
    }

    // Bab proposal
    const babSrc = path.join(pkgRoot, 'template/outlines/proposal');
    fs.mkdirSync(path.join(targetDir, 'bab'), { recursive: true });
    ['bab1.typ', 'bab2.typ', 'bab3.typ'].forEach(b => {
      let content = fs.readFileSync(path.join(babSrc, b), 'utf8');
      content = content.replace(/\.\.\/\.\.\/metadata\.typ/g, '../metadata.typ');
      content = content.replace(/\.\.\/\.\.\/lib\.typ/g, '../lib.typ');
      fs.writeFileSync(path.join(targetDir, 'bab', b), content, 'utf8');
    });

    // Generate main.typ for proposal
    let propContent = fs.readFileSync(path.join(pkgRoot, 'template/proposal.typ'), 'utf8');
    propContent = propContent.replace(/#import "\.\.\/lib\.typ": \*/g, '#import "lib.typ": *');
    propContent = propContent.replace(/logo-path: "public\/logo-ubsi\.png"/g, 'logo-path: "gambar/logo-ubsi.png"');
    propContent = propContent.replace(/outlines\/proposal\//g, 'bab/');
    fs.writeFileSync(path.join(targetDir, 'main.typ'), propContent, 'utf8');
  } else {
    // Laporan PKL structure
    copyDirSync(path.join(pkgRoot, 'template/bagian-awal'), path.join(targetDir, 'bagian-awal'));
    copyDirSync(path.join(pkgRoot, 'template/bagian-akhir'), path.join(targetDir, 'bagian-akhir'));

    // Fix imports in bagian-awal and bagian-akhir
    ['bagian-awal', 'bagian-akhir'].forEach(folder => {
      const dirPath = path.join(targetDir, folder);
      for (const f of fs.readdirSync(dirPath)) {
        if (f.endsWith('.typ')) {
          const filePath = path.join(dirPath, f);
          let c = fs.readFileSync(filePath, 'utf8');
          c = c.replace(/\.\.\/\.\.\/lib\.typ/g, '../lib.typ');
          c = c.replace(/\.\.\/metadata\.typ/g, '../metadata.typ');
          fs.writeFileSync(filePath, c, 'utf8');
        }
      }
    });

    // Copy selected Bab files into bab/
    fs.mkdirSync(path.join(targetDir, 'bab'), { recursive: true });
    const outlineSrc = path.join(pkgRoot, 'template/outlines', selectedOutline.dir);
    for (const b of selectedOutline.babs) {
      const srcFile = path.join(outlineSrc, `${b}.typ`);
      let c = fs.readFileSync(srcFile, 'utf8');
      c = c.replace(/\.\.\/\.\.\/\.\.\/lib\.typ/g, '../lib.typ');
      c = c.replace(/\.\.\/\.\.\/\.\.\/metadata\.typ/g, '../metadata.typ');
      fs.writeFileSync(path.join(targetDir, 'bab', `${b}.typ`), c, 'utf8');
    }

    // Generate clean main.typ
    let mainContent = fs.readFileSync(path.join(pkgRoot, 'template/main.typ'), 'utf8');
    mainContent = mainContent.replace(/#import "\.\.\/lib\.typ": \*/g, '#import "lib.typ": *');
    mainContent = mainContent.replace(/logo-path: "public\/logo-ubsi\.png"/g, 'logo-path: "gambar/logo-ubsi.png"');

    const babIncludes = selectedOutline.babs.map(b => `#include "bab/${b}.typ"`).join('\n');
    mainContent = mainContent.replace(
      /\/\/ OUTLINE PKL: PROYEK INOVASI PERANGKAT LUNAK \(6 BAB\)[\s\S]*?\/\/ 4\. Bagian Akhir/,
      `// OUTLINE PKL: ${selectedOutline.name.toUpperCase()}\n${babIncludes}\n\n// 4. Bagian Akhir`
    );

    fs.writeFileSync(path.join(targetDir, 'main.typ'), mainContent, 'utf8');
  }

  // Generate lightweight README inside scaffolded project
  const subReadme = `# ${isProposal ? 'Proposal PKL UBSI' : `Laporan PKL UBSI - ${selectedOutline.name}`}
Program Studi: Teknologi Informasi (S1)

## Struktur Folder Proyek
- \`main.typ\` : Berkas dokumen utama untuk dikompilasi / dilihat pratinjaunya.
- \`metadata.typ\` : Tempat mengisi Nama, NIM, Judul, Dosen PA, dan tempat PKL.
- \`bab/\` : Berisi draf bab penulisan dokumen Anda.
- \`gambar/\` : Simpan foto, scan dokumen, dan diagram di sini.
- \`pustaka.bib\` : Referensi daftar pustaka (APA Style Versi 6).

## Cara Menulis
1. Buka folder ini di **VS Code** dengan ekstensi **Tinymist Typst** atau unggah ke **[typst.app](https://typst.app)**.
2. Edit identitas pada \`metadata.typ\`.
3. Tulis naskah laporan Anda pada berkas di dalam folder \`bab/\`.
`;
  fs.writeFileSync(path.join(targetDir, 'README.md'), subReadme, 'utf8');

  console.log('\n[BERHASIL] Proyek siap digunakan di: ' + targetDir);
  console.log('\nLangkah selanjutnya:');
  console.log(`  1. Masuk ke folder: cd ${targetDirName}`);
  console.log('  2. Buka metadata.typ untuk melengkapi data identitas.');
  console.log('  3. Mulai menulis naskah di dalam folder bab/.');
  console.log('  4. Pratinjau langsung di VS Code (Tinymist) atau unggah folder ini ke https://typst.app');
}

main().catch(err => {
  console.error('\nTerjadi kesalahan:', err);
  process.exit(1);
});
