#let green = rgb("#31a269")
#let blue = rgb("#1f4e95")
#let grey = rgb(80, 80, 80)


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
  block(inset: (left: 14pt, right: 15pt, top: 10pt))[
    #align(horizon)[
      #grid(
        columns: (auto, 1fr, auto),
        // Text | Line | Icon
        column-gutter: 0.5cm,
        // --- Text label
        text(
          fill: background_blue2,
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
    ]]
}
#let institution_header(image_path, roles, contract, institution, period) = {
  block(inset: (left: 9pt, right: 9pt, bottom: 4pt), breakable: true)[
    #align(horizon)[
      #grid(
        columns: (.8cm, 1fr),
        column-gutter: 0.12cm,
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
    ]]
}

#let project(name, description, steps, skills) = {
  set text(fill: grey)
  block(
    inset: (left: 16pt, right: 10pt, top: 4pt, bottom: 4pt),
    breakable: true,
  )[
    #stack(
      dir: ttb,
      spacing: 5pt,
      text(
        fill: grey,
        weight: "semibold",
        size: 12pt,
      )[#name],

      block(inset: 4pt, breakable: true)[
        #stack(
          dir: ttb,
          spacing: 8pt,
          description,
          list(
            ..steps,
          ),
          ("Compétences", skills.join(", ")).join(": "),
        )],
    )]
}

#let experience(image_path, roles, contract, institution, period, projects) = {
  block(inset: (left: 8pt, right: 8pt), breakable: true)[
    #stack(
      dir: ttb,
      spacing: 5pt,
      institution_header(image_path, roles, contract, institution, period),
      ..projects.map(((name, description, steps, skills)) => project(
        name,
        description,
        steps,
        skills,
      )),
    )
  ]
}

#stack(
  dir: ttb,
  spacing: 0pt,
  block(
    // --- Header
    fill: background_blue3,
    inset: (left: 40pt, right: 41pt, top: 15pt, bottom: 15pt),
    breakable: true,
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
  stack(
    dir: ttb,
    spacing: 5pt,
    category_header(
      "icons/white/briefcase.png",
      "expériences professionnelles",
    ),
    experience(
      "images/institutions/safran.jpg",
      ("ingénieur système", "développement logiciel"),
      "cdi",
      "Safran Trusted 4D",
      "Mars 2023 - aujourd'hui",
      (
        (
          "Système Temps Fréquence pour Naval Group",
          "Système Temps Fréquence pour Naval Group",
          (
            "Appel d'offre remporté pour une application de défense critique, développement sur spécifications du systeme (Mécanique, électronique, FPGA & logicielle).",
            "Conception haut niveau (logique métier, mécanismes d'asservissement).",
            "Logiciel embarqué en C (OS Linux) (ordonnancement d'actions, pilotage de divers FPGAs & cartes électroniques dédiées, TCP/IP sécurisé avec SSL, base de données PostgreSQL, communication liaison série UART).",
            "Logiciel interface avec le framework Qt en python (OS Linux) (Interface métier complexe, TCP/IP sécurisé avec SSL, base de données PostgreSQL).",
            "Simulateur complet du système pour automatiser les tests de l'interface et faciliter la formation des utilisateurs en python (OS Linux): Moteur de simulation (intéractions des différents composants entre eux, modèles physiques d'horloges atomiques) piloté par une interface Qt dédiée.",
            "UI/UX de l'interface, conception des divers écrans/procédures en collaborations avec le client final.",
            "Pilotage de la partie logicielle du projet, contacts & revues client.",
          ),
          ("C", "C++", "rust"),
        ),
        (
          "Maintenance du Système Temps Fréquence historique pour Naval Group",
          "Travail autour de la maintenance du système prédécesseur de celui que j'ai été par la suite amené à developper. Apres de nombreuses années sans intervention, la compétence a été perdue et je me suis bien souvent retrouvé dans une démarche de rétro-ingénierie.",
          (
            "Logiciel en C (OS Linux) (Etat des lieux du code du calculateur, compréhension du fonctionnement, correction de défauts logiciels).",
            "Développement d'une solution de simulation de l'environnement électronique & FPGA afin de tester/valider les versions logicielles. Moteur de simulation, communication UART & interface avec le framework Qt (Principalement en python).",
          ),
          ("C", "C++"),
        ),
      ),
    ),
    category_header(
      "icons/white/briefcase.png",
      "expériences professionnelles",
    ),
    experience(
      "images/institutions/safran.jpg",
      ("ingénieur système", "développement logiciel"),
      "cdi",
      "Safran Trusted 4D",
      "Mars 2023 - aujourd'hui",
      (
        (
          "Système Temps Fréquence pour Naval Group",
          "Système Temps Fréquence pour Naval Group",
          (
            "Appel d'offre remporté pour une application de défense critique, développement sur spécifications du systeme (Mécanique, électronique, FPGA & logicielle).",
            "Conception haut niveau (logique métier, mécanismes d'asservissement).",
            "Logiciel embarqué en C (OS Linux) (ordonnancement d'actions, pilotage de divers FPGAs & cartes électroniques dédiées, TCP/IP sécurisé avec SSL, base de données PostgreSQL, communication liaison série UART).",
            "Logiciel interface avec le framework Qt en python (OS Linux) (Interface métier complexe, TCP/IP sécurisé avec SSL, base de données PostgreSQL).",
            "Simulateur complet du système pour automatiser les tests de l'interface et faciliter la formation des utilisateurs en python (OS Linux): Moteur de simulation (intéractions des différents composants entre eux, modèles physiques d'horloges atomiques) piloté par une interface Qt dédiée.",
            "UI/UX de l'interface, conception des divers écrans/procédures en collaborations avec le client final.",
            "Pilotage de la partie logicielle du projet, contacts & revues client.",
          ),
          ("C", "C++", "rust"),
        ),
        (
          "Maintenance du Système Temps Fréquence historique pour Naval Group",
          "Travail autour de la maintenance du système prédécesseur de celui que j'ai été par la suite amené à developper. Apres de nombreuses années sans intervention, la compétence a été perdue et je me suis bien souvent retrouvé dans une démarche de rétro-ingénierie.",
          (
            "Logiciel en C (OS Linux) (Etat des lieux du code du calculateur, compréhension du fonctionnement, correction de défauts logiciels).",
            "Développement d'une solution de simulation de l'environnement électronique & FPGA afin de tester/valider les versions logicielles. Moteur de simulation, communication UART & interface avec le framework Qt (Principalement en python).",
          ),
          ("C", "C++"),
        ),
      ),
    ),
  ),
),
