#import "color.typ": *
#import "contact.typ": *
#import "experience.typ": *
#import "header.typ": *

#set text(font: "Source Sans Pro", fill: grey, size: 10pt, hyphenate: true)
#set par(justify: true)

#set page(
  paper: "a4",
  margin: (left: 0pt, right: -1pt, top: 20pt, bottom: 20pt),
  footer: rect(
    outset: 3pt,
    fill: gradient.linear(green, blue, angle: 0deg),
    width: 100%,
    height: 50pt,
  ),
)

#box(
  fill: background_blue3,
  inset: (top: -20pt),
)[
  #stack(
    dir: ttb,
    spacing: 0pt,
    box(
      // --- Header
      fill: background_blue3,
      inset: (left: 40pt, right: 41pt, top: 15pt, bottom: 15pt),
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
        contact_item("icons/grey/github.png", "hufolcher"),
        contact_item("icons/grey/marker.png", "Boulogne-Billancourt (92100)"),
      )
    ],
  )]

#stack(
  dir: ttb,
  spacing: 3pt,
  category_header(
    "icons/white/briefcase.png",
    "expériences professionnelles",
  ),
  stack(
    dir: ttb,
    experience(
      "images/institutions/cureety.png",
      0.75cm,
      ("ingénieur logiciel fullstack",),
      "cdi",
      "Cureety",
      "Avril 2025 - aujourd'hui",
      (
        (
          "Front-end",
          "Cureety est un Saas de télésurveillance en oncologie: chaque jour les patients complètent des questionnaires dépendant de leur pathologie/traitement qui permettent de suivre l'évolution de leur état automatiquement. De leur côté, les soignants disposent d'une interface métier complexe pour gérer leurs patients.",
          (
            "Nouvelles interfaces/fonctionnalités & migration progressive de l'existant vers des interfaces unifiées en flutter (applications mobiles Android & iOS, interface web soignant, interface web patient et backoffice web).",
            "Maintenance des interfaces web existantes (React/NextJS) (interface web soignant et backoffice web).",
          ),
          ("Dart/Flutter", "JavaScript/TypeScript/React", "Jenkins", "GitLab"),
        ),
        (
          "Back-end",
          "Cureety est en phase de croissante rapide et se doit de faire évoluer ses services backend pour qu'ils suivent la demande sans interruption de service.",
          (
            "Transition progressive (endpoint par endpoint) des backends existants en rust pour améliorer les performances, la fiabilité et la maintenabilité.",
            "Migrations, optimisations des schémas/requêtes SQL de la base postgreSQL.",
            "Tests end-to-end des nouveaux services en Rust avec support de simulateurs pour les services externes.",
            "Maintenance des backends existantes (LoopbackJS).",
          ),
          (
            "Rust",
            "PostgreSQL",
            "API REST",
            "JavaScript",
            "TypeScript",
            "NodeJS",
            "LoopbackJS",
            "Docker",
            "Jenkins",
            "GitLab",
          ),
        ),
      ),
    ),
    experience(
      "images/institutions/safran.jpg",
      0.75cm,
      ("ingénieur système", "développement logiciel"),
      "cdi",
      "Safran Electronics & Defense",
      "Mars 2023 - Avril 2025",
      (
        (
          "Système Temps Fréquence pour Naval Group",
          "Une \"Horloge\" capable de maintenir un temps de grande précision en autonomie qui distribue des signaux de temps dans de nombreux format électriques et numériques dans un environnement très contraint embarquant électronique spécifique, FPGA et logiciel.",
          (
            "Conception haut niveau (logiques métier, mécanismes d'asservissement).",
            "Logiciel embarqué en C (OS Linux) (ordonnancement d'actions, pilotage de divers FPGAs & cartes électroniques dédiées, TCP/IP sécurisé avec SSL, base de données PostgreSQL, communication liaison série UART).",
            "Logiciel interface avec le framework Qt en python (OS Linux) (Interface métier complexe, TCP/IP sécurisé avec SSL, base de données PostgreSQL).",
            "Simulateur complet du système pour automatiser les tests de l'interface et faciliter la formation des utilisateurs en python (OS Linux): Moteur de simulation (intéractions des différents composants entre eux, modèles physiques d'horloges atomiques) piloté par une interface Qt dédiée.",
            "UI/UX de l'interface, conception des divers écrans/procédures en collaboration avec le client final.",
            "Pilotage de la partie logicielle du projet, contacts & revues client.",
            "Génération automatique de documentations/rapports techniques via typst.",
          ),
          ("C", "Python", "PyQt/PySide", "PostgreSQL", "Docker", "GitLab"),
        ),
        (
          "Maintenance du Système Temps Fréquence historique pour Naval Group",
          "Travail autour de la maintenance du système prédécesseur de celui que j'ai été par la suite amené à developper. Apres de nombreuses années sans intervention, la compétence a été perdue et je me suis bien souvent retrouvé dans une démarche de rétro-ingénierie.",
          (
            "Logiciel en C (OS Linux) (Etat des lieux du code du calculateur, compréhension du fonctionnement, correction de défauts logiciels).",
            "Développement d'une solution de simulation de l'environnement électronique & FPGA afin de tester/valider les versions logicielles. Moteur de simulation, communication UART & interface avec le framework Qt (Principalement en python).",
          ),
          ("C", "Python", "PyQt/PySide", "VirtualBox", "GitLab"),
        ),
      ),
    ),
    experience(
      "images/institutions/orolia.jpg",
      1.2cm,
      ("ingénieur développement logiciel",),
      "cdi",
      "Orolia 2S (devenu Safran Trusted 4D)",
      "Jan 2022 - Mars 2023",
      (
        (
          "Carte de temps à référence atomique (ARTCARD)",
          "Co-développée en open source avec Meta, il s'agit d'une carte embarquant un FPGA, un récepteur GNSS (Ublox) & une micro-horloge atomique (MRO50) à destination des datacenters.",
          (
            "Logiciel d'asservissement de l'horloge sur une source GNSS (Langage C), développement & support (Accessible ici: https://github.com/Orolia2s/oscillatord).",
            "Banc de programmation électronique (flash d'un FTDI, du FPGA et d'une EEPROM), de tests & IHM associée pour que cela puisse être fait par un opérateur en usine (EMS AsteelFlash).",
            "Participation au développement du driver linux spécifique & développement sur un fork interne fermé afin d'expérimenter diverses intégrations pour des prototypes, désormais intégré dans le kernel linux (Accessible ici: https://github.com/Time-Appliances-Project/Time-Card).",
          ),
          ("C", "Python", "PyQt/PySide"),
        ),
        (
          "Logiciel de simulation GNSS pour application critique (Skydel)",
          "Dans le cadre du développement d'un prototype de leurrage de drones par émission de signaux de navigation GNSS modifiés.",
          (
            "Ajout de fonctionnalités à un logiciel de simulation civil pour rendre son usage possible dans une application de défense critique (Développement C++17, framework Qt, chiffrement cryptographique).",
            "Backend en C++ qui permet de monitorer/piloter tout le sytème (i.e les API des logiciels utilisés dont le simulateur de signaux GNSS, informations matérielles ect ...) exposé en API consommé par les frontaux développé par le client final.",
            "Démonstrations client (intégration de la solution à d'autres systèmes, mise en oeuvre, contact client).",
          ),
          ("C++17", "C++20", "Qt", "GitLab"),
        ),
        (
          "Caisson de Navigation Resiliente (NavKite)",
          "D'abord un prototype alliant la précision d'une centrale inertielle à la détection de signaux GNSS malveillant d'un récepteur intelligent puis rapidement un produit au catalogue Safran Electronics & Defense. A la pointe de l'innovation en navigation militaire résiliente",
          (
            "Développement, déploiement & intégration au sein d'un système existant d'un logiciel backend en Python qui récupère des données d'une centrale inertielle, la protège des signaux malveillants, la pilote et expose ses fonctionnalités à une interface web (React).",
            "Prototypage rapide, POC en quelques semaines/mois.",
            "Démonstrations clients sur le terrain",
            "Industrialisation de la partie logicielle (packaging & OS linux custom avec buildroot)",
          ),
          ("Python", "Gunicorn", "Socketio", "React", "Docker", "Buildroot"),
        ),
      ),
    ),
  ),
)
#pagebreak()
#stack(
  dir: ttb,
  category_header(
    "icons/white/graduation.png",
    "formation",
  ),
  block(inset: (left: 14pt, right: 8pt), breakable: true)[
    #stack(
      dir: ttb,
      spacing: 15pt,
      stack(
        dir: ttb,
        spacing: 5pt,
        education_header(
          "images/institutions/minesstetienne.png",
          0.75cm,
          "école nationale supérieure des mines de saint-étienne",
          "2018 - 2021",
        ),
        box(inset: (left: 20pt, right: 10pt, top: 5pt))[
          #stack(
            dir: ttb,
            spacing: 7pt,
            text(
              weight: "semibold",
            )[Campus George Charpak Provence - Gardanne, 13120],
            list(
              "Cursus ISMIN (Ingénieur en Microélectronique et Informatique)",
              "Spécialisation en Microship Design",
              "Enjeu technologique: Information Technologies & Supply Chain",
            ),
          )],
      ),
      stack(
        dir: ttb,
        spacing: 5pt,
        education_header(
          "images/institutions/montaigne.png",
          0.75cm,
          "classe préparatoire aux grandes écoles (MPSI-MP*)",
          "2015 - 2018",
        ),
        box(inset: (left: 20pt, right: 10pt, top: 5pt))[
          #stack(
            dir: ttb,
            spacing: 7pt,
            text(weight: "semibold")[Lycée Montaigne - Bordeaux, 33000],
            list(
              "MPSI-MP* - Option Informatique / 2015 - 2017",
            ),
            text(
              weight: "semibold",
            )[Lycée Godefroy de Bouillon - Clermont-Ferrand, 63000],
            list(
              "MP - Option Informatique / 2017 - 2018",
            ),
          )],
      ),
      stack(
        dir: ttb,
        spacing: 5pt,
        education_header(
          "images/institutions/charles_gide.jpg",
          0.75cm,
          "baccalauréat scientifique mention très bien",
          "2015",
        ),
        box(inset: (left: 20pt, right: 10pt, top: 5pt))[
          #stack(
            dir: ttb,
            spacing: 7pt,
            text(weight: "semibold")[Lycée Charles Gide - Uzès, 30700],
          )],
      ),
    )],
)
#stack(
  dir: ttb,
  spacing: 2pt,
  category_header(
    "icons/white/sliders.png",
    "compétences",
  ),
  box(inset: (left: 22pt, right: 10pt, top: 5pt))[
    #stack(
      dir: ttb,
      spacing: 7pt,
      (
        text(weight: "semibold")[Langages],
        (
          "Python",
          "C",
          "Rust",
          "C++",
          "SQL",
          "Dart",
          "Javascript",
          "Typescript",
          "Bash",
        ).join(", "),
      ).join(": "),
    )],
  box(inset: (left: 22pt, right: 20pt, top: 5pt))[
    #stack(
      dir: ttb,
      spacing: 7pt,
      (
        text(weight: "semibold")[Framework/outils],
        (
          "Systèmes UNIX",
          "Commandes POSIX",
          "Git",
          "GitLab",
          "Github",
          "Bitbucket",
          "Wireshark",
          "VirtualBox",
          "Nix packet manager",
          "Qt (C++)",
          "PySide/PyQt",
          "PostgreSQL",
          "ActixWeb(Rust)",
          "Buildroot",
          "Flutter",
          "React",
          "Docker",
          "SQLALchemy (Python)",
          "Typst",
          "Valgrind",
          "GDB",
          "Yocto",
          "OpenGL",
        ).join(", "),
      ).join(": "),
    )],
)
#stack(
  dir: ttb,
  spacing: 2pt,
  category_header(
    "icons/white/language.png",
    "langues",
  ),
  box(inset: (left: 22pt, right: 10pt, top: 5pt))[
    #stack(
      dir: ttb,
      spacing: 7pt,
      (
        text(weight: "semibold")[#upper("français")],
        "(Langue Maternelle)",
      ).join(" "),
      (text(weight: "semibold")[#upper("anglais")], "(Professionnel)").join(
        " ",
      ),
      (text(weight: "semibold")[#upper("espagnol")], "(Scolaire)").join(" "),
    )],
)
