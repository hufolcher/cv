#import "header.typ": *
#import "color.typ": *

#let project(name, description, steps, skills) = {
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
              Compétences: #skills.join(", ")],
          ),
        )],
    )]
}

#let experience(
  image_path,
  image_width,
  roles,
  contract,
  institution,
  period,
  projects,
) = {
  block(inset: (left: 14pt, right: 8pt, bottom: 20pt), breakable: true)[
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
      ..projects.map(((name, description, steps, skills)) => project(
        name,
        description,
        steps,
        skills,
      )),
    )
  ]
}
