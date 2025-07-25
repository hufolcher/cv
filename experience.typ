#import "header.typ": *
#import "color.typ": *

#let project(name, description, steps, skills) = {
  set text()
  box(
    inset: (left: 20pt, right: 10pt, top: 8pt, bottom: 4pt),
  )[
    #stack(
      dir: ttb,
      spacing: 5pt,
      text(
        weight: "semibold",
        size: 12pt,
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
              ..steps,
            ),
            text(size: 9.5pt, weight: "semibold")[#(
                "Compétences",
                text(size: 10pt, weight: "bold")[#skills.join(", ")],
              ).join(": ")],
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
      institution_header(
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
