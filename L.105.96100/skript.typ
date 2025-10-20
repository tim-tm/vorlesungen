#import "@preview/cetz:0.4.0"
#import "@preview/cetz-venn:0.1.4"

#set text(lang: "de")
#set heading(numbering: "1.")
#set par(justify: true)

#align(
  center,
  [
    #text(17pt)[
      *Lineare Algebra für Informatik*
    ] \
    L.105.96100 \
    *Vorlesungsskript*
  ],
)

= Mathematische Grundlagen
== Mengen
=== Definition
Eine Menge ist eine (gedankliche) Zusammenfassung wohlunterschiedener Objekte, gennant Elemente der Menge.

- Ist $M$ eine Menge, so gilt für jedes Objekt $x$:
  - entweder $x in M$ ("$x$ ist Element von $M$")
  - oder $x in.not M$ ("$x$ ist nicht Element von $M$").

=== Beispiel (Beschreibung von Mengen)
#enum(
  numbering: "(1)",
  [
    Aufzählung
    #enum(
      numbering: "(a)",
      $"Menge der Früchte" = {"Apfel", "Birne", "Pflaume", ...}$,
      $NN := {1, 2, 3, ...} "natürliche Zahlen"$,
      $ZZ := {..., -2, -1, 0, 1, 2, ...} "ganze Zahlen"$,
      $emptyset={} "leere Menge"$,
    )
    Es kommt nicht auf Reihenfolge und Wiederholung an:
    $
      {1,2,3} = {3,1,3,2,3,1}
    $
  ],
  [
    Angabe einer charakteristischen Eigenschaft
    #enum(
      numbering: "(a)",
      $NN_0 = {n | n in ZZ "und" n >= 0} = {n in ZZ | n >= 0}$,
      $
        {n in NN | n "ist eine Primzahl"} &= {2, 3, cancel(4), 5, cancel(6), 7, cancel(8), cancel(9), cancel(10), 11, cancel(12), 13, ...} \
        &= {2,3,5,7,11,13,...}
      $,
    )
  ],
  [
    Beschreibung der Elemente:
    #enum(
      numbering: "(a)",
      $QQ := {frac(a, b) | a,b in ZZ "und" b != 0}$,
      ${2 n + 1 | n in ZZ} "ungerade Zahlen"$,
      $RR = "Menge der reellen Zahlen (s. Analysis)"$,
    )
  ],
)

=== Notation
Seien $M$ und $N$ Mengen. $N$ heißt Teilmenge von $M$, geschrieben $n subset.eq M$, wenn gilt:
wenn $x in N$, dann gilt $x in M$.

#figure(
  cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 12mm)
    circle((4mm, -2mm), radius: 6mm)
    content((4mm, -2mm), $N$)
    content((-5mm, 5mm), $M$)
  }),
  caption: [Teilmenge],
)

Falls $N subset.eq M$, definiere $N^c = overline(N) := {x in M | x in.not N}$.

#figure(
  cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 12mm, fill: orange.lighten(60%))
    circle((4mm, -2mm), radius: 6mm, fill: white)
    content((4mm, -2mm), $N$)
    content((-5mm, 5mm), $M$)
    content((-5mm, -5mm), $N^c$)
  }),
  caption: [Mengenkomplement],
)

Schreibe $M=N$, falls $N subset.eq M$ und $M subset.eq N$.

=== Definition
#enum(
  numbering: "(i)",
  [
    $M union N := {x | x in M "oder" x in N}$ Vereinigung
    #figure(
      cetz.canvas({
        cetz-venn.venn2(
          name: "venn",
          a-fill: orange.lighten(60%),
          b-fill: orange.lighten(60%),
          ab-fill: orange.lighten(60%),
        )

        import cetz.draw: *
        content("venn.a", $M$)
        content("venn.b", $N$)
      }),
      caption: [Vereinigung],
    )
  ],
  [
    $M inter N := {x | x in M "und" x in N}$ Durchschnitt
    #figure(
      cetz.canvas({
        cetz-venn.venn2(
          name: "venn",
          ab-fill: orange.lighten(60%),
        )

        import cetz.draw: *
        content("venn.a", $M$)
        content("venn.b", $N$)
      }),
      caption: [Durchschnitt],
    )
    $M$ und $N$ heißen disjunkt, wenn $M inter N = emptyset$.
    #figure(
      cetz.canvas({
        import cetz.draw: *
        circle((0, 0), radius: 1cm)
        circle((3cm, 0), radius: 1cm)
        content((0, 0), $M$)
        content((3cm, 0), $N$)
      }),
      caption: [Disjunkte Mengen],
    )
    Eine disjunkte Vereinigung $M union.dot N$ oder $M union.sq N$ bedeutet $M union N$ unter der Bedingung
    $M inter N = emptyset$.
  ],
  [
    $M \\ N := {x | x in M "und" x in.not N}$ Differenz
    #figure(
      cetz.canvas({
        cetz-venn.venn2(
          name: "venn",
          a-fill: orange.lighten(60%),
        )

        import cetz.draw: *
        content("venn.a", $M$)
        content("venn.b", $N$)
      }),
      caption: [Differenz],
    )
    Falls $N subset.eq M$, dann gilt $M \\ N = N$.
  ],
  [
    $
      M crossmark N := {(m,n) | m in M "und" n in N}
    $
    Dabei ist $(m,n)$ ein geordnetes Paar; es gilt $(m,n)=(m',n')$ genau dann, wenn $m=m'$ und $n=n'$.
    #figure(
      cetz.canvas({
        import cetz.draw: *
        rect((0, 0), (2, 2))
        circle((0.75, 1.5), radius: 0.05, fill: black)
        content((1.3, 1.1), $(m,n)$)
        line((0, -0.5), (2, -0.5))
        line((-0.5, 0), (-0.5, 2))
        content((-1.3, 1), $N$)
        content((1, -1.3), $M$)
        line((0.75, 1.5), (0.75, -0.5), stroke: (dash: "dashed"))
        line((0.75, 1.5), (-0.5, 1.5), stroke: (dash: "dashed"))
        content((0.75, -0.7), $m$)
        content((-0.7, 1.5), $n$)
      }),
      caption: [Kartesisches Produkt],
    )
    Beispiel:
    $
      {1,2,3} crossmark {a,b} = {(1,a), (1,b), (2,a), (2,b), (3,a), (3,b)}
    $

    Allgemeiner: Für Mengen $M_1, M_2, ..., M_n$ (mit $n in NN$) setze
    $
      M_1 crossmark M_2 crossmark ... crossmark M_n & := product_(i=1)^n M_i \
                                                    & := {(m_1, m_2, ..., m_n) | m_i in M; "für alle" i=1,2,...,n}
    $
  ],
)

== Aussagen
=== Definition
Eine Aussage ist ein Satz der entweder wahr (w) oder falsch (f) ist.

=== Beispiel
#enum(
  numbering: "(i)",
  [
    "Alle Gummibärchen sind grün" (falsche) Aussage
  ],
  [
    "Wenn es regnet, wird die Erde nass" (wahre) Aussage
  ],
  [
    "$x+5=2$" ist keine Aussage
  ],
  [
    "Es gibt ein $x in NN$ mit $x+5=2$" (falsche) Aussage
  ],
  [
    "Bitte stehen Sie auf" keine Aussage
  ],
)

#table(
  columns: 2,
  stroke: (x, y) => (
    left: if x > 0 { 0.8pt },
    top: if y > 0 { 0.8pt },
  ),
  $A$, $not A$,
  [w], [f],
  [f], [w],
)

#table(
  columns: 5,
  stroke: (x, y) => (
    left: if x > 0 { 0.8pt },
    top: if y > 0 { 0.8pt },
  ),
  [$A$ #h(1em) $B$], [$A and B$], [$A or B$], [$A => B$], [$A <=> B$],
  [w #h(1em) w], [w], [w], [w], [w],
  [w #h(1em) f], [f], [w], [f], [f],
  [f #h(1em) w], [f], [w], [w], [f],
  [f #h(1em) f], [f], [f], [w], [w],
)

=== Satz
Seien $A,B,C$ Aussagen. Dann gilt
#enum(
  numbering: "(i)",
  [$underbrace(A or not A, "Tautologie")$ ist wahr; $underbrace(A and not A, "Widerspruch")$ ist falsch],
  $not (not A) <=> A$,
  $not (A and B) <=> not A or not B$,
  $not (A or B) <=> not A and not B$,
  $A and (B or C) <=> (A and B) or (A and C)$,
  $A or (B and C) <=> (A or B) and (A or C)$,
  $A => B <=> not A or B$,
  $A => B <=> not B => not A (arrow.double.l.r.not not A => not B)$,
  $A <=> B <=> not A <=> not B$,
  $not (A => B) <=> A and not B$,
)


