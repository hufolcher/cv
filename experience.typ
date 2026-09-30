#import "header.typ": *

// A task is a plain line, or a (label, items) group shown as a nested list.
#let task-item(task) = if type(task) == dictionary [
  #text(weight: "semibold", task.label)
  #list(spacing: 7pt, ..task.items)
] else { task }

// One project: bold title, then an indented description, its tasks and its stack.
// `project` is a translation-file entry: (label, description, tasks, stack).
#let project(project, stack-label) = box(
  inset: (left: 20pt, right: 10pt, top: 7pt, bottom: 4pt),
  stack(
    dir: ttb,
    spacing: 5pt,
    text(weight: "bold", size: 11.5pt, project.label),
    box(inset: (left: 8pt, right: 10pt, top: 5pt), stack(
      dir: ttb,
      spacing: 8pt,
      project.description,
      stack(
        dir: ttb,
        spacing: 12pt,
        list(spacing: 7pt, ..project.tasks.map(task-item)),
        text(size: 9.5pt, labelled-list(stack-label, project.stack)),
      ),
    )),
  ),
)

// One employer: logo header (roles, contract, company, dates) followed by its projects.
// `company` is a translation-file entry: (roles, contract_type, label, date, projects).
#let experience(logo, logo-width, company, stack-label) = block(
  inset: (left: 14pt, right: 8pt, bottom: 15pt),
  breakable: true,
  stack(
    dir: ttb,
    spacing: 5pt,
    entry-header(
      logo,
      logo-width,
      upper(company.roles.join(" / ")),
      upper[#company.contract_type | #company.label | #company.date],
    ),
    ..company.projects.values().map(p => project(p, stack-label)),
  ),
)
