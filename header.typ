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
    )[#item])
    .join(" ")
}

#let category_header(image_path, label) = {
  block(inset: (left: 14pt, right: 15pt))[
    #align(horizon)[
      #grid(
        columns: (auto, 1fr, auto),
        column-gutter: 0.5cm,
        text(
          fill: background_blue2,
          weight: "bold",
          size: 15pt,
        )[#upper[#label]],
        line(
          length: 100%,
          stroke: 2pt + gradient.linear(green, blue, angle: 0deg),
        ),
        box(
          fill: background_blue3,
          radius: 2.5cm,
          width: 1cm,
          height: 1cm,
          inset: 0.25cm,
          image(image_path, height: 0.5cm),
        ),
      )
    ]]
}
#let company_header(
  image_path,
  image_width,
  roles,
  contract,
  institution,
  period,
) = {
  block(inset: (left: 9pt, right: 9pt), breakable: true)[
    #align(horizon)[
      #text(
        fill: blue,
        weight: "bold",
        size: 12.5pt,
      )[
        #grid(
          columns: (image_width, 1fr),
          column-gutter: 0.25cm,
          image(image_path, width: image_width),
          stack(
            dir: ttb,
            spacing: 5pt,
            upper[#roles.join(" / ")],
            upper[#contract | #institution | #period],
          ),
        )
      ]]]
}

#let education_header(
  image_path,
  image_width,
  institution,
  period,
) = {
  block(inset: (left: 9pt, right: 9pt, bottom: 4pt), breakable: true)[
    #align(horizon)[
      #text(
        fill: blue,
        weight: "bold",
        size: 13pt,
      )[
        #grid(
          columns: (image_width, 1fr),
          column-gutter: 0.25cm,
          image(image_path, width: image_width),
          stack(
            dir: ttb,
            spacing: 5pt,
            upper(institution),
            period,
          ),
        )
      ]]]
}
