#import "header.typ": *

// A task is a plain line, or a (label, items, team?) group shown as a nested list.
#let task-item(task) = if type(task) == dictionary [
  #text(weight: "semibold", task.label)#if "team" in task [ — #task.team]
  #list(spacing: list-spacing, ..task.items)
] else { task }

// One project: bold title, then an indented description, its tasks and its stack.
// `project` is a translation-file entry: (label, description, tasks, stack).
// It may continue on the next page; the title stays with the description.
#let project(project, stack-label) = block(
  inset: (left: project-indent, top: 8pt),
  breakable: true,
  {
    set block(spacing: 0pt)
    block(sticky: true, below: 10pt, text(
      weight: "bold",
      size: 11.5pt,
      project.label,
    ))
    block(inset: (left: text-indent), breakable: true, {
      block(below: 8pt, project.description)
      block(below: 9pt, list(
        spacing: list-spacing,
        ..project.tasks.map(task-item),
      ))
      text(size: 9.5pt, labelled-list(stack-label, project.stack))
    })
  },
)

// One employer: logo header (roles, contract, company, dates) followed by its projects.
// `company` is a translation-file entry:
// (roles, contract_type, work_mode, label, location, date, projects).
#let experience(logo, logo-width, company, stack-label) = block(
  inset: (bottom: 8pt),
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
