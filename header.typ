#import "color.typ": *


#let category_header(image_path, label) = {
  block(inset: (left: 14pt, right: 15pt))[
    #align(horizon)[
      #grid(
        columns: (auto, 1fr, auto),
        column-gutter: 0.5cm,
        text(
          fill: background_blue2,
          weight: "semibold",
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
#let institution_header(
  image_path,
  image_width,
  roles,
  contract,
  institution,
  period,
) = {
  block(inset: (left: 9pt, right: 9pt, bottom: 4pt), breakable: true)[
    #align(horizon)[
      #grid(
        columns: (image_width, 1fr),
        column-gutter: 0.25cm,
        image(image_path, width: image_width),
        stack(
          dir: ttb,
          spacing: 5pt,
          text(
            fill: blue,
            weight: "semibold",
            size: 13pt,
          )[#upper[#roles.join(" / ")]],
          text(
            fill: blue,
            weight: "semibold",
            size: 13pt,
          )[#(upper(contract), institution, period).join(" | ")],
        ),
      )
    ]]
}

#let education_header(
  image_path,
  image_width,
  institution,
  period,
) = {
  block(inset: (left: 9pt, right: 9pt, bottom: 4pt), breakable: true)[
    #align(horizon)[
      #grid(
        columns: (image_width, 1fr),
        column-gutter: 0.25cm,
        image(image_path, width: image_width),
        stack(
          dir: ttb,
          spacing: 5pt,
          text(
            fill: blue,
            weight: "semibold",
            size: 13pt,
          )[#upper(institution)],
          text(
            fill: blue,
            weight: "semibold",
            size: 13pt,
          )[#period],
        ),
      )
    ]]
}
