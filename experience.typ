#import "header.typ": *

// A task is a plain line, or a (label, items) group shown as a nested list.
#let task-item(task) = if type(task) == dictionary [
  #text(weight: "semibold", task.label)
  #list(spacing: 6pt, ..task.items)
] else { task }

// One project: bold title, then an indented description, its tasks and its stack.
// `project` is a translation-file entry: (label, description, tasks, stack).
// It may continue on the next page; the title stays with the description.
#let project(project, stack-label) = block(
  inset: (left: 20pt, right: 10pt, top: 7pt, bottom: 4pt),
  breakable: true,
  {
    set block(spacing: 0pt)
    block(sticky: true, below: 10pt, text(
      weight: "bold",
      size: 11.5pt,
      project.label,
    ))
    block(inset: (left: 8pt, right: 10pt), breakable: true, {
      block(below: 8pt, project.description)
      block(below: 9pt, list(spacing: 6pt, ..project.tasks.map(task-item)))
      text(size: 9.5pt, labelled-list(stack-label, project.stack))
    })
  },
)

// One employer: logo header (roles, contract, company, dates) followed by its projects.
// `company` is a translation-file entry:
// (roles, contract_type, work_mode, label, location, date, projects).
#let experience(logo, logo-width, company, stack-label) = block(
  inset: (left: 14pt, right: 8pt, bottom: 10pt),
  breakable: true,
  stack(
    dir: ttb,
    spacing: 5pt,
    entry-header(
      logo,
      logo-width,
      upper(company.roles.join(" / ")),
      upper[#company.contract_type · #company.work_mode | #company.label, #company.location | #company.date],
    ),
    ..company.projects.values().map(p => project(p, stack-label)),
  ),
)
