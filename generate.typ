#let green = rgb("#31a269")
#let blue = rgb("#1f4e95")

#let background_blue3 = rgb("#071829")
#let background_blue2 = rgb("#113454")

#set text(font: "Source Sans Pro")

#set page(
  paper: "a4",
  margin: (x: -1pt, y: 0pt),
)

#let contact_item(image_path, label) = {
  stack(
    dir: ltr,
    spacing: 5pt,
    box(
      fill: white,
      radius: 2.5cm,
      width: 0.8cm,
      height: 0.8cm,
      inset: 0.15cm,
      image(image_path, height: 0.5cm),
    ),
    align(horizon)[
      #text(fill: white, size: 10.5pt)[#label]
    ],
  )
}

#let category_header(image_path, label) = {
  align(horizon)[
    #grid(
      columns: (auto, 1fr, auto),
      // Text | Line | Icon
      column-gutter: 0.5cm,
      // --- Text label
      text(
        fill: background_blue3,
        weight: "semibold",
        size: 15pt,
      )[#upper[#label]],
      // --- Expanding line
      line(
        length: 100%,
        stroke: 2pt + gradient.linear(green, blue, angle: 0deg),
      ),
      // --- Icon box
      box(
        fill: background_blue3,
        radius: 2.5cm,
        width: 1cm,
        height: 1cm,
        inset: 0.25cm,
        image(image_path, height: 0.5cm),
      ),
    )
  ]
}
#let institution_header(image_path, roles, contract, institution, period) = {
  align(horizon)[
    #grid(
      columns: (.8cm, 1fr),
      column-gutter: 0.2cm,

      image(image_path, height: .75cm),
      stack(
        dir: ttb,
        spacing: 5pt,
        text(
          fill: blue,
          weight: "semibold",
          size: 12pt,
        )[#upper[#roles.join(" / ")]],
        text(
          fill: blue,
          weight: "semibold",
          size: 12pt,
        )[#(upper(contract), institution, period).join(" | ")],
      ),
    )
  ]
}

#let project(name, steps) = {
  stack(
    dir: ttb,
    spacing: 5pt,
    text(
      fill: blue,
      weight: "semibold",
      size: 12pt,
    )[#name],
    list(..steps
    ),
  )
}

#let experience(image_path, roles, contract, institution, period, projects) = {
      stack(
        dir: ttb,
        spacing: 5pt,
        institution_header(image_path, roles, contract, institution, period),
        ..projects.map(((name, steps)) => project(name, steps))
    )
}

#stack(
  dir: ttb,
  spacing: 0pt,
  box(
    // --- Header
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
          text(size: 16pt, fill: white)[Ingénieur développement logiciel],
          line(
            length: 100%,
            stroke: 2pt + gradient.linear(green, blue, angle: 0deg),
          ),
          box(inset: 3pt)[
            #text(
              size: 12.1pt,
              fill: white,
            )[Passionné de sciences et de technique, ma formation et mes expériences ont fait de moi quelqu'un de rigoureux, efficace et polyvalent.],
          ],
        ),
      )]
  ],
  // --- Contact
  box(
    fill: gradient.linear(green, blue, angle: 0deg),
    width: 100%,
    inset: (left: 22pt, right: 23pt, top: 8pt, bottom: 8pt),
  )[#stack(
      dir: ltr,
      spacing: 1fr,
      contact_item("icons/grey/mail.png", "hle.folcher@gmail.com"),
      contact_item("icons/grey/linkedin.png", "hugo-folcher"),
      contact_item("icons/grey/github.png", "HugoFolcher"),
      contact_item("icons/grey/marker.png", "Boulogne-Billancourt (92100)"),
    )
  ],
  box(inset: (left: 15pt, right: 16pt, top: 5pt, bottom: 5pt))[
    #stack(dir: ttb)[
      #category_header(
        "icons/white/briefcase.png",
        "expériences professionnelles",
      )
      #experience(
        "images/institutions/safran.jpg",
        ("ingénieur système", "développement logiciel"),
        "cdi",
        "Safran Trusted 4D",
        "Mars 2023 - aujourd'hui",
        (("test_project", ("test_project1", "test_project2", "test_project3", "test_project4")), ("test_project", ("test_project1", "test_project2", "test_project3", "test_project4")))
      )
    ]],
)
