#import "color.typ": *
#import "contact.typ": *
#import "experience.typ": *
#import "header.typ": *

// --- Page style
#set text(font: "Source Sans Pro", fill: grey, size: 10pt, hyphenate: true)
#set par(justify: true)
#set page(
  paper: "a4",
  margin: (left: 0pt, right: -1pt, top: 20pt, bottom: 20pt),
  footer: rect(outset: 3pt, fill: brand-gradient, width: 100%, height: 50pt),
)

// --- Configuration: configuration.json, overridable with `--input language=en --input address=...`
#let configuration = json("configuration.json")
#let language = sys.inputs.at("language", default: configuration.language)
#let address = sys.inputs.at("address", default: configuration.address)
#let translated = json("text/" + language + ".json")

#let logos = (
  cureety: (path: "images/institutions/cureety.png", width: 0.75cm),
  safran: (path: "images/institutions/safran.jpg", width: 0.75cm),
  orolia: (path: "images/institutions/orolia.jpg", width: 1.2cm),
)

// --- Header
#let photo = box(
  fill: navy-light,
  radius: 2.5cm,
  width: 4cm,
  height: 4cm,
  inset: 0.15cm,
  box(
    clip: true,
    stroke: 3pt + brand-gradient,
    radius: 2.5cm,
    width: 3.7cm,
    height: 3.7cm,
    image("images/me.jpeg", height: 3.7cm),
  ),
)

#let headline = stack(
  dir: ttb,
  spacing: 12pt,
  stack(
    dir: ltr,
    spacing: 6pt,
    text(size: 32pt, fill: white, weight: "bold")[Hugo],
    text(size: 32pt, fill: white)[Folcher],
  ),
  text(size: 16pt, fill: white, translated.job_title),
  line(length: 100%, stroke: 2pt + brand-gradient),
  box(inset: 3pt, text(size: 12.1pt, fill: white, translated.intro)),
)

#box(fill: navy, inset: (top: -20pt), stack(
  dir: ttb,
  box(
    fill: navy,
    inset: (left: 40pt, right: 41pt, top: 15pt, bottom: 15pt),
    align(left + horizon, grid(
      columns: (5cm, 1fr),
      photo, headline,
    )),
  ),
  box(
    fill: brand-gradient,
    width: 100%,
    inset: (left: 22pt, right: 23pt, top: 8pt, bottom: 8pt),
    stack(
      dir: ltr,
      spacing: 1fr,
      contact-item("icons/grey/mail.png", "hle.folcher@gmail.com"),
      contact-item("icons/grey/linkedin.png", "hugo-folcher"),
      contact-item("icons/grey/github.png", "hufolcher"),
      contact-item("icons/grey/marker.png", address),
    ),
  ),
))

// --- Experiences, in the order of the translation file
#section(
  "icons/white/briefcase.png",
  translated.experiences.title,
  spacing: 3pt,
  ..translated
    .experiences
    .pairs()
    .filter(((key, _)) => key in logos)
    .map(((key, company)) => experience(
      logos.at(key).path,
      logos.at(key).width,
      company,
      translated.experiences.common.skill_title,
    )),
)

#pagebreak()

// --- Education
#section(
  "icons/white/graduation.png",
  translated.education.title,
  block(inset: (left: 14pt, right: 8pt), breakable: true, stack(
    dir: ttb,
    spacing: 15pt,
    ..translated.education.list.map(school => stack(
      dir: ttb,
      spacing: 4pt,
      entry-header(
        "images/institutions/" + school.logo,
        0.75cm,
        size: 13pt,
        bottom: 4pt,
        upper(school.label),
        school.date,
      ),
      box(inset: (left: 20pt, right: 10pt, top: 5pt), stack(
        dir: ttb,
        spacing: 7pt,
        ..school.steps.map(step => [
          #text(weight: "bold")[#step.location],
          #list(..step.details)
        ]),
      )),
    )),
  )),
)

// --- Skills
#section(
  "icons/white/sliders.png",
  translated.skills.title,
  box(inset: (left: 25pt, right: 20pt), stack(
    dir: ttb,
    spacing: 7pt,
    labelled-list(
      translated.skills.programming_languages_label,
      translated.skills.languages,
    ),
    labelled-list(
      translated.skills.programming_tools_label,
      translated.skills.tools,
    ),
  )),
)

// --- Languages
#section(
  "icons/white/language.png",
  translated.languages.title,
  box(inset: (left: 25pt, right: 10pt), stack(
    dir: ttb,
    spacing: 7pt,
    ..translated.languages.list.map(lang => [
      #text(weight: "bold")[#upper(lang.label)] (#lang.level)
    ]),
  )),
)
