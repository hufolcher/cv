## CI build
Should output compiled file once workflow has ended his execution, you can download here: https://github.com/hufolcher/cv/blob/publish/cv_hugo_folcher_jul_25.pdf

## Manual
Before starting you need to have a typst binary installed (https://github.com/typst/typst).
### Font
This CV uses the Source Sans Pro font for clean typography.
You need to have Source Sans Pro installed on your system to compile the CV correctly.

The recommanded way to install it is using Fontist:
```
gem install fontist
fontist install source-sans-pro
```
This will download and install the font system-wide, so Typst can access it when generating your PDF.
Without the font installed, your CV might fallback to default fonts and lose its intended style.
If you prefer manual installation, you can download Source Sans Pro from Adobe Fonts or Google Fonts and install it on your OS.

Please see https://github.com/fontist/fontist

###  Recolor icons (only needed when you add new ones)
Make sure Pillow is installed:
```
pip install pillow
```
then:
```
python recolor.py
```
or just use the dedicated script (uv setup):
```
cd icons
./recolor.sh
```
This generates icon variants for use in different themes (light/dark sections).

### Format your CV source (Typst)
Clean and reindent your .typ files with:

```
typstyle -i generate.typ
```
More at https://github.com/typstyle-rs/typstyle

### Compile to PDF
Finally, generate the resume:

```
typst compile generate.typ my_resume.pdf
```
