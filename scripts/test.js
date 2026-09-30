const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

function resolveTypst() {
  if (process.env.TYPST_BIN && fs.existsSync(process.env.TYPST_BIN)) {
    return process.env.TYPST_BIN;
  }
  try {
    execSync('typst --version', { stdio: 'ignore' });
    return 'typst';
  } catch (e) {}

  // Check common Windows WinGet paths
  const userProfile = process.env.USERPROFILE || '';
  const wingetDir = path.join(userProfile, 'AppData/Local/Microsoft/WinGet/Packages');
  if (fs.existsSync(wingetDir)) {
    const entries = fs.readdirSync(wingetDir);
    for (const ent of entries) {
      if (ent.toLowerCase().includes('typst')) {
        const candidate = path.join(wingetDir, ent, 'typst-x86_64-pc-windows-msvc/typst.exe');
        if (fs.existsSync(candidate)) return candidate;
      }
    }
  }
  return null;
}

const typstBin = resolveTypst();
if (!typstBin) {
  console.error('Error: Typst compiler tidak ditemukan di PATH.');
  console.error('Silakan instal Typst via winget (Windows): winget install Typst.Typst');
  console.error('atau unduh biner resmi dari: https://github.com/typst/typst/releases');
  process.exit(1);
}

const repoRoot = path.resolve(__dirname, '..');
console.log(`Menggunakan Typst compiler: ${typstBin}`);
console.log(`Direktori root proyek: ${repoRoot}\n`);

const testCases = [
  {
    name: 'Proposal PKL (3 Bab)',
    entry: path.join(repoRoot, 'template/proposal.typ'),
  },
  {
    name: 'Laporan PKL - Outline 1: Inovasi Perangkat Lunak (6 Bab)',
    entry: path.join(repoRoot, 'template/main.typ'),
  },
  {
    name: 'Laporan PKL - Outline 2: Mobile Computing (4 Bab)',
    customOutline: {
      name: 'Mobile',
      dir: 'outlines/pkl-ti-mobile',
      babs: ['bab1', 'bab2', 'bab3', 'bab4'],
    },
  },
  {
    name: 'Laporan PKL - Outline 3: Jaringan Komputer (4 Bab)',
    customOutline: {
      name: 'Jaringan',
      dir: 'outlines/pkl-ti-jaringan',
      babs: ['bab1', 'bab2', 'bab3', 'bab4'],
    },
  },
  {
    name: 'Laporan PKL - Outline 4: Analisis Sistem (4 Bab)',
    customOutline: {
      name: 'Analisis Sistem',
      dir: 'outlines/pkl-ti-analisis-sistem',
      babs: ['bab1', 'bab2', 'bab3', 'bab4'],
    },
  },
];

let failed = 0;
const tmpPdf = path.join(repoRoot, 'temp_test_output.pdf');
const tmpTyp = path.join(repoRoot, 'template/temp_test_runner.typ');

for (const tc of testCases) {
  process.stdout.write(`Testing ${tc.name} ... `);
  const start = Date.now();
  let targetFile = tc.entry;

  if (tc.customOutline) {
    const mainContent = fs.readFileSync(path.join(repoRoot, 'template/main.typ'), 'utf8');
    const includeBlock = tc.customOutline.babs
      .map(b => `#include "${tc.customOutline.dir}/${b}.typ"`)
      .join('\n');
    const generated = mainContent.replace(
      /\/\/ OUTLINE PKL: PROYEK INOVASI PERANGKAT LUNAK \(6 BAB\)[\s\S]*?\/\/ 4\. Bagian Akhir/,
      `// OUTLINE PKL: ${tc.customOutline.name}\n${includeBlock}\n\n// 4. Bagian Akhir`
    );
    fs.writeFileSync(tmpTyp, generated, 'utf8');
    targetFile = tmpTyp;
  }

  try {
    execSync(`"${typstBin}" compile --root "${repoRoot}" "${targetFile}" "${tmpPdf}"`, {
      stdio: 'pipe',
    });
    const dur = Date.now() - start;
    console.log(`PASS (${dur} ms)`);
  } catch (err) {
    console.log('FAIL');
    console.error(err.stderr ? err.stderr.toString() : err.message);
    failed++;
  } finally {
    if (fs.existsSync(tmpPdf)) fs.unlinkSync(tmpPdf);
    if (fs.existsSync(tmpTyp)) fs.unlinkSync(tmpTyp);
  }
}

console.log('\n----------------------------------------');
if (failed === 0) {
  console.log(`Semua pengujian (${testCases.length}) BERHASIL.`);
  process.exit(0);
} else {
  console.error(`Ditemukan ${failed} kegagalan dari ${testCases.length} pengujian.`);
  process.exit(1);
}
