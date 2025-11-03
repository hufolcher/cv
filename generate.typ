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
#let configuration = {
  let file = read("configuration.json", encoding: "utf8")
  if file != none {
    json.decode(file)
  } else {
    (:)
  }
}
#let language = configuration.language
#let address = configuration.address

// --- Translation
#let translated = {
  let file = read(("text/", language, ".json").join(), encoding: "utf8")
  if file != none { json.decode(file) } else { (:) }
}

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
              #text(size: 12.1pt, fill: white)[#translated.intro],
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
  stack(
    dir: ttb,
    experience(
      "images/institutions/cureety.png",
      0.75cm,
      translated.experiences.cureety.roles,
      translated.experiences.cureety.contract_type,
      translated.experiences.cureety.label,
      translated.experiences.cureety.date,
      (
<<<<<<< HEAD
        (
          "Front-end",
          [Cureety est un Saas de télésurveillance en oncologie: chaque jour les patients complètent des questionnaires dépendant de leur pathologie/traitement qui permettent de suivre l'évolution de leur état automatiquement. De leur côté, les soignants disposent d'une interface métier complexe pour gérer leurs patients.],
          (
            [Nouvelles interfaces/fonctionnalités & migration progressive de l'existant vers des interfaces unifiées en flutter (applications mobiles Android & iOS, interface web soignant, interface web patient et backoffice web).],
            [Maintenance des interfaces web existantes (React/NextJS) (interface web soignant et backoffice web).],
          ),
          ("Dart/Flutter", "JavaScript/TypeScript/React", "Jenkins", "GitLab"),
        ),
        (
          "Back-end",
          [Cureety est en phase de croissante rapide et se doit de faire évoluer ses services backend pour qu'ils suivent la demande sans interruption de service.],
          (
            [Transition progressive (endpoint par endpoint) des backends existants en rust pour améliorer les performances, la fiabilité et la maintenabilité.],
            [Migrations, optimisations des schémas/requêtes SQL de la base postgreSQL.],
            [Tests end-to-end des nouveaux services en Rust avec support de simulateurs pour les services externes.],
            [Maintenance des backends existants (LoopbackJS).],
          ),
          (
            "Rust",
            "PostgreSQL",
            "API REST",
            "JavaScript",
            "TypeScript",
            "NodeJS",
            "LoopbackJS",
            "Docker",
            "Jenkins",
            "GitLab",
          ),
        ),
=======
        translated.experiences.cureety.projects.frontend,
        translated.experiences.cureety.projects.backend,
>>>>>>> 734cc34 (Some cleanup, add traduction support)
      ),
      translated.experiences.common,
    ),
    experience(
      "images/institutions/safran.jpg",
      0.75cm,
      translated.experiences.safran.roles,
      translated.experiences.safran.contract_type,
      translated.experiences.safran.label,
      translated.experiences.safran.date,
      (
        translated.experiences.safran.projects.beluga,
        translated.experiences.safran.projects.cachalot,
      ),
      translated.experiences.common,
    ),
  ),
  experience(
    "images/institutions/orolia.jpg",
    1.2cm,
    translated.experiences.orolia.roles,
    translated.experiences.orolia.contract_type,
    translated.experiences.orolia.label,
    translated.experiences.orolia.date,
    (
      translated.experiences.orolia.projects.artcard,
      translated.experiences.orolia.projects.chaperon,
      translated.experiences.orolia.projects.navkite,
    ),
    translated.experiences.common,
  ),
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
<<<<<<< HEAD
      spacing: 16pt,
      stack(
=======
      spacing: 15pt,
      ..translated.education.list.map(formation => stack(
>>>>>>> 734cc34 (Some cleanup, add traduction support)
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
<<<<<<< HEAD
      ),
      stack(
        dir: ttb,
        spacing: 4pt,
        education_header(
          "images/institutions/montaigne.png",
          0.75cm,
          "classe préparatoire aux grandes écoles (MPSI-MP*)",
          "2015 - 2018",
        ),
        box(inset: (left: 20pt, right: 10pt, top: 5pt))[
          #stack(
            dir: ttb,
            spacing: 7pt,
            text(weight: "bold")[Lycée Montaigne - Bordeaux, 33000],
            list(
              "MPSI-MP* - Option Informatique / 2015 - 2017",
            ),
            text(
              weight: "bold",
            )[Lycée Godefroy de Bouillon - Clermont-Ferrand, 63000],
            list(
              "MP - Option Informatique / 2017 - 2018",
            ),
          )],
      ),
      stack(
        dir: ttb,
        spacing: 4pt,
        education_header(
          "images/institutions/charles_gide.jpg",
          0.75cm,
          "baccalauréat scientifique mention très bien",
          "2015",
        ),
        box(inset: (left: 20pt, right: 10pt, top: 5pt))[
          #text(weight: "bold")[Lycée Charles Gide - Uzès, 30700],
        ],
      ),
=======
      )),
>>>>>>> 734cc34 (Some cleanup, add traduction support)
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
      [#text(weight: "bold")[#translated.skills.programming_languages_label]: #translated.skills.languages.join(", ")],
      [#text(weight: "bold")[#translated.skills.programming_tools_label]: #translated.skills.tools.join(", ")],
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
