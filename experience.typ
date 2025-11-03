#import "header.typ": *
#import "color.typ": *

// The `project` function displays one project in the Experience section.
//
// PARAMETERS:
//  name:        Title of the project
//  description: Short text introducing the project
//               • Can be plain string or `text()[...]`
//  steps:       Array of bullet points (each should be Typst content)
//               Example: [text(size: 9.5pt)["Feature X"], ...]
//  skills:      Array of strings representing tools / tech stack
//               Displayed as "Compétences: Flutter, Rust, SQLx"
//
//  translated:  Struc containing all translated data.
//
// Example usage:
//
//  project(
//    "Plateforme Patient",
//    text(size: 10pt)[Plateforme de suivi clinique et alertes médicales.],
//    [
//      text(size: 9.5pt)["Architecture modulable Flutter"],
//      text(size: 9.5pt)["Synchronisation offline-first"],
//      text(size: 9.5pt)["Intégration sécurisée OAuth2"],
//    ],
//    ["Flutter", "Riverpod", "Rust", "PostgreSQL"],
//  )

#let project(name, description, steps, skills, translated) = {
  set text()
  box(
    inset: (left: 20pt, right: 10pt, top: 7pt, bottom: 4pt),
  )[
    #stack(
      dir: ttb,
      spacing: 5pt,
      text(
        weight: "bold",
        size: 11.5pt,
      )[#name],
      box(inset: (left: 8pt, right: 10pt, top: 5pt))[
        #stack(
          dir: ttb,
          spacing: 8pt,
          description,
          stack(
            dir: ttb,
            spacing: 12pt,
            list(
              spacing: 7pt,
              ..steps,
            ),
            text(size: 9.5pt, weight: "bold")[
              #translated.skill_title: #skills.join(", ")],
          ),
        )],
    )]
}

// The `experience` function displays one professional
// experience section with:
//
//  image_path:    Path to company logo image
//  image_width:   Width of the logo (pt)
//  roles:         Job title or multiple roles
//  contract:      CDI / CDD / Stage / Freelance / Alternance
//  institution:   Company or organization name
//  period:        Date range (ex: 2022 — Présent)
//  projects:      Array of project dictionaries providing:
//                 • label:        Title of the project
//                 • description:  Short introduction text
//                 • tasks:        Array of bullet-point lines
//                 • stack:        Array of technologies/tools
//
// Required project dictionary structure:
//
//  (
//    label: "Project Title",
//    description: text(size: 10pt)[Short summary...],
//    tasks: [
//      text(size: 9.5pt)["Task 1"],
//      text(size: 9.5pt)["Task 2"],
//      ...
//    ],
//    stack: ["Flutter", "Dart", "Rust"],
//  )
//
// Example usage:
//
//  experience(
//    "assets/company/logo.png",
//    22pt,
//    "Ingénieur Logiciel",
//    "CDI",
//    "Entreprise Exemple",
//    "2022 — 2024",
//    [
//      (
//        label: "Plateforme Patient",
//        description: text(size: 10pt)[Plateforme de suivi clinique...],
//        tasks: [
//          text(size: 9.5pt)["Architecture Flutter modulable"],
//          text(size: 9.5pt)["Synchronisation offline-first"],
//          text(size: 9.5pt)["OAuth2 & sécurité applicative"],
//        ],
//        stack: ["Flutter", "Riverpod", "PostgreSQL"],
//      ),
//    ],
//  )

#let experience(
  image_path,
  image_width,
  roles,
  contract,
  institution,
  period,
  projects,
  translated,
) = {
  block(inset: (left: 14pt, right: 8pt, bottom: 15pt), breakable: true)[
    #stack(
      dir: ttb,
      spacing: 5pt,
      company_header(
        image_path,
        image_width,
        roles,
        contract,
        institution,
        period,
      ),
      ..projects.map(p => project(
        p.label,
        p.description,
        p.tasks,
        p.stack,
        translated,
      )),
    )
  ]
}
