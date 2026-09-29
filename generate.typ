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
  footer: rect(
    outset: 3pt,
    fill: gradient.linear(green, blue, angle: 0deg),
    width: 100%,
    height: 50pt,
  ),
)

// --- Configuration
#let configuration = json("configuration.json")

#let language = configuration.language
#let address = configuration.address

// --- Translation
#let translated = json(("text/", language, ".json").join())

#let logos = (
  cureety: (path: "images/institutions/cureety.png", width: 0.75cm),
  safran: (path: "images/institutions/safran.jpg", width: 0.75cm),
  orolia: (path: "images/institutions/orolia.jpg", width: 1.2cm),
)

// --- Document
#box(
  fill: background_blue3,
  inset: (top: -20pt),
)[
  #stack(
    dir: ttb,
    spacing: 0pt,
    box(
      fill: background_blue3,
      inset: (left: 40pt, right: 41pt, top: 15pt, bottom: 15pt),
    )[
      #align(left + horizon)[
        #grid(
          columns: (5cm, 1fr),
          box(
            fill: background_blue2,
            radius: 2.5cm,
            width: 4cm,
            height: 4cm,
            inset: 0.15cm,
          )[
            #box(
              clip: true,
              stroke: 3pt + gradient.linear(green, blue, angle: 0deg),
              radius: 2.5cm,
              width: 3.7cm,
              height: 3.7cm,
              image("images/me.jpeg", height: 3.7cm),
            )
          ],
          stack(
            dir: ttb,
            spacing: 12pt,
            stack(
              dir: ltr,
              spacing: 6pt,
              text(size: 32pt, fill: white, weight: "bold")[Hugo],
              text(size: 32pt, fill: white)[Folcher],
            ),
            text(size: 16pt, fill: white)[#translated.job_title],
            line(
              length: 100%,
              stroke: 2pt + gradient.linear(green, blue, angle: 0deg),
            ),
            box(inset: 3pt)[
              #text(size: 12.1pt, fill: white)[#translated.intro]
            ],
          ),
        )]
    ],
    box(
      fill: gradient.linear(green, blue, angle: 0deg),
      width: 100%,
      inset: (left: 22pt, right: 23pt, top: 8pt, bottom: 8pt),
    )[#stack(
        dir: ltr,
        spacing: 1fr,
        contact_item("icons/grey/mail.png", "hle.folcher@gmail.com"),
        contact_item("icons/grey/linkedin.png", "hugo-folcher"),
        contact_item("icons/grey/github.png", "hufolcher"),
        contact_item("icons/grey/marker.png", address),
      )
    ],
  )]

#stack(
  dir: ttb,
  spacing: 3pt,
  category_header(
    "icons/white/briefcase.png",
    translated.experiences.title,
  ),
  // Experiences and their projects render in the order of the translation file.
  ..translated
    .experiences
    .pairs()
    .filter(((key, _)) => key in logos)
    .map(((key, company)) => experience(
      logos.at(key).path,
      logos.at(key).width,
      company.roles,
      company.contract_type,
      company.label,
      company.date,
      company.projects.values(),
      translated.experiences.common,
    )),
)

#pagebreak()
#stack(
  dir: ttb,
  spacing: 4pt,
  category_header(
    "icons/white/graduation.png",
    translated.education.title,
  ),
  block(inset: (left: 14pt, right: 8pt), breakable: true)[
    #stack(
      dir: ttb,
      spacing: 15pt,
      ..translated.education.list.map(formation => stack(
        dir: ttb,
        spacing: 4pt,
        education_header(
          "images/institutions/" + formation.logo,
          0.75cm,
          formation.label,
          formation.date,
        ),
        box(inset: (left: 20pt, right: 10pt, top: 5pt))[
          #stack(
            dir: ttb,
            spacing: 7pt,
            ..formation.steps.map(step => [
              #text(weight: "bold")[#step.location],
              #list(..step.details)
            ]),
          )],
      )),
    )],
)

#stack(
  dir: ttb,
  spacing: 4pt,
  category_header(
    "icons/white/sliders.png",
    translated.skills.title,
  ),
  box(inset: (left: 25pt, right: 20pt))[
    #stack(
      dir: ttb,
      spacing: 7pt,
      text(weight: "bold")[#translated.skills.programming_languages_label],
      tags(translated.skills.languages),
      text(weight: "bold")[#translated.skills.programming_tools_label],
      tags(translated.skills.tools),
    )],
)

#stack(
  dir: ttb,
  spacing: 4pt,
  category_header(
    "icons/white/language.png",
    translated.languages.title,
  ),
  box(inset: (left: 25pt, right: 10pt))[
    #stack(
      dir: ttb,
      spacing: 7pt,
      ..translated.languages.list.map(lang => [
        #text(weight: "bold")[#upper(lang.label)] (#lang.level)
      ]),
    )
  ],
)
