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
