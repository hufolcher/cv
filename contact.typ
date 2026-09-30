// Name and contact details, shared by the CV and cover letters.
#let identity = (
  first-name: "Hugo",
  last-name: "Folcher",
  mail: "hle.folcher@gmail.com",
  linkedin: "hugo-folcher",
  github: "hufolcher",
)

// One contact entry of the header band: round icon, then its label.
#let contact-item(icon, label) = stack(
  dir: ltr,
  spacing: 5pt,
  box(
    fill: white,
    radius: 2.5cm,
    width: 0.8cm,
    height: 0.8cm,
    inset: 0.15cm,
    image(icon, height: 0.5cm),
  ),
  align(horizon, text(fill: white, size: 10.5pt, label)),
)
