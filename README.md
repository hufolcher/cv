Generate a modern, styled CV using Typst, with automatic icon recoloring, clean layout logic, and GitHub Actions integration.

🛠️ Workflow (Manual)

This CV uses the Source Sans Pro font for clean, professional typography.

You need to have Source Sans Pro installed on your system to compile the CV correctly.

The easiest way to install it is using Fontist:

bash
Copier
Modifier
gem install fontist
fontist install source-sans-pro
This will download and install the font system-wide, so Typst can access it when generating your PDF.

Without the font installed, your CV might fallback to default fonts and lose its intended style.

If you prefer manual installation, you can download Source Sans Pro from Adobe Fonts or Google Fonts and install it on your OS.

🎨 Recolor icons (white & grey variants)
Make sure Pillow is installed:

bash
Copier
Modifier
uv pip install pillow
Then run:

bash
Copier
Modifier
python recolor.py
or just use the wrapper:

bash
Copier
Modifier
./recolor.sh
This generates icon variants for use in different themes (light/dark sections).

🧪 Format your CV source (Typst)
Clean and reindent your .typ files with:

bash
Copier
Modifier
typstyle -i generate.typ
You write modular, structured Typst—like a pro.

📦 Compile to PDF
Finally, generate your CV:

bash
Copier
Modifier
typst compile generate.typ cv.pdf
🚀 CI/CD with GitHub Actions
A GitHub Actions workflow builds and publishes the final PDF on every trigger (workflow_dispatch).
It uses:

Icon recoloring

Font embedding (via Fontist, optional)

Typst compilation

Artifact upload with semantic naming like:

Copier
Modifier
cv_hugo_fontana_jul_25.pdf
💡 Why this setup?
This repo shows how to:

Automate asset preprocessing

Organize Typst code modularly

Build CVs programmatically (icons, sections, loops)

Generate professional outputs with CI

Yes—even a CV can be done like a senior developer.

🧰 Requirements
Typst CLI

uv (for Python envs)

Pillow (pip install pillow)

Optional: Fontist if you need fonts

📁 Project Structure
pgsql
Copier
Modifier
.
├── base/               # base icons
├── grey/               # recolored icons (grey)
├── white/              # recolored icons (white)
├── recolor.py          # PIL script
├── recolor.sh          # uv wrapper
├── cv.typ              # main CV file
├── template.typ        # layout logic
└── .github/workflows/
    └── build.yml       # CI build + artifact