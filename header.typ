#import "color.typ": *

// A bold label followed by a comma-separated list, for tech stacks and skills.
#let labelled-list(
  label,
  items,
) = [#text(weight: "bold", label): #items.join(", ")]

// Layout grid: every section sits between the same side gutters.
#let gutter = 18pt
// Indents inside a section: logos and skill lines, projects, then project text.
#let logo-indent = 8pt
#let project-indent = 20pt
#let text-indent = 8pt
// Bullet spacing shared by every list.
#let list-spacing = 6pt

// Bold uppercase labels with their detail in parentheses, one after the other.
#let inline-entries(entries, separator: h(1.5em)) = {
  entries
    .map(((name, detail)) => [#text(weight: "bold", upper(name)) (#detail)])
    .join(separator)
}

// Section title with a gradient rule and a round icon, followed by its items.
#let section(icon, title, spacing: 6pt, ..items) = block(
  inset: (left: gutter, right: gutter + 1pt),
  above: 16pt,
  breakable: true,
  stack(
    dir: ttb,
    spacing: spacing,
    align(horizon, grid(
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
    )),
    ..items.pos(),
  ),
)

// Logo beside bold blue title lines, shared by experiences and education.
#let entry-header(logo, logo-width, size: 12.5pt, bottom: 0pt, ..lines) = block(
  inset: (left: logo-indent, bottom: bottom),
  breakable: true,
  align(horizon, text(fill: blue, weight: "bold", size: size, grid(
    columns: (logo-width, 1fr),
    column-gutter: 0.25cm,
    image(logo, width: logo-width),
    stack(dir: ttb, spacing: 5pt, ..lines.pos()),
  ))),
)
