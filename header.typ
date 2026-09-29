#import "color.typ": *

// Technologies as monospace tags. DejaVu Sans Mono ships inside typst, so CI needs no extra font.
#let tags(items) = {
  set text(font: "DejaVu Sans Mono", size: 7.5pt, fill: blue)
  set par(justify: false, leading: 7pt)
  items
    .map(item => box(
      fill: blue.lighten(92%),
      stroke: 0.5pt + blue.lighten(65%),
      radius: 3pt,
      inset: (x: 4pt, y: 2.5pt),
      item,
    ))
    .join(" ")
}

// Section title with a gradient rule and a round icon, followed by its items.
#let section(icon, title, spacing: 4pt, ..items) = stack(
  dir: ttb,
  spacing: spacing,
  block(inset: (left: 14pt, right: 15pt), align(horizon, grid(
    columns: (auto, 1fr, auto),
    column-gutter: 0.5cm,
    text(fill: navy-light, weight: "bold", size: 15pt, upper(title)),
    line(length: 100%, stroke: 2pt + brand-gradient),
    box(
      fill: navy,
      radius: 2.5cm,
      width: 1cm,
      height: 1cm,
      inset: 0.25cm,
      image(icon, height: 0.5cm),
    ),
  ))),
  ..items.pos(),
)

// Logo beside bold blue title lines, shared by experiences and education.
#let entry-header(logo, logo-width, size: 12.5pt, bottom: 0pt, ..lines) = block(
  inset: (left: 9pt, right: 9pt, bottom: bottom),
  breakable: true,
  align(horizon, text(fill: blue, weight: "bold", size: size, grid(
    columns: (logo-width, 1fr),
    column-gutter: 0.25cm,
    image(logo, width: logo-width),
    stack(dir: ttb, spacing: 5pt, ..lines.pos()),
  ))),
)
