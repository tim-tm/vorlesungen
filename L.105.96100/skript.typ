#import "@preview/cetz:0.4.2"
#import "@preview/cetz-venn:0.1.4"
#import "@preview/cetz-plot:0.1.3"

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

=== Definition
Sei $M$ eine Menge, und für jedes $x in M$ sei $A(x)$ eine Aussage.
#enum(
  numbering: "(i)",
  ["$forall x in M: A(x)$" bedeutet: "Für jedes $x$ in $M$ gilt $A(x)$." (Allquantor)],
  ["$exists x in M: A(x)$" bedeutet: "Es existiert mindestens ein $x$ in $M$, sodass $A(x)$ gilt." (Existenzquantor)],
)

=== Bemerkung (Verneinung von Quantoren)
#enum(
  numbering: "(a)",
  $not (forall x in M: A(x)) <=> exists x in M: not A(x)$,
  $not (exists x in M: A(x)) <=> forall x in M: not A(x)$,
)

== Abbildungen
=== Definition
Seien $X,Y$ zwei Mengen. Eine Abbildung $f: X -> Y$ ist ein Vorschrift, die jedem $x in X$ genau ein $f(x) in Y$ zuordnet:
$x |-> f(x)$. $x$ heißt Definitionsbereich und $Y$ Wertebereich von $f$.
#figure(
  cetz.canvas({
    import cetz.draw: *
    let vec2_add(vec1, vec2) = {
      assert(type(vec1) == array and type(vec2) == array)
      return (vec1.at(0) + vec2.at(0), vec1.at(1) + vec2.at(1))
    }

    // TODO: improve this rather nasty function
    let abbildung(
      origin: (0, 0),
      connections: ((0, 0), (1, 0), (2, 1), (3, 1), (4, 3)),
      name: "",
      label: [Abbildung],
    ) = {
      let _name(label) = {
        return name + "_" + label
      }

      circle(origin, radius: (0.5, 1), name: _name("x"))
      circle(vec2_add(origin, (0.1, 0.5)), name: _name("x_0"), fill: black, radius: 0.05)
      circle(vec2_add(origin, (-0.2, 0.2)), name: _name("x_1"), fill: black, radius: 0.05)
      circle(vec2_add(origin, (0.2, -0.1)), name: _name("x_2"), fill: black, radius: 0.05)
      circle(vec2_add(origin, (-0.1, -0.4)), name: _name("x_3"), fill: black, radius: 0.05)
      circle(vec2_add(origin, (0.1, -0.6)), name: _name("x_4"), fill: black, radius: 0.05)
      content(_name("x.north"), $X$, anchor: "south", padding: 0.1, name: _name("x_label"))

      let y_origin = vec2_add(origin, (2, 0))
      circle(y_origin, radius: (0.5, 1), name: _name("y"))
      circle(vec2_add(y_origin, (0.1, 0.5)), name: _name("y_0"), fill: black, radius: 0.05)
      circle(vec2_add(y_origin, (-0.2, 0.2)), name: _name("y_1"), fill: black, radius: 0.05)
      circle(vec2_add(y_origin, (0.2, -0.1)), name: _name("y_2"), fill: black, radius: 0.05)
      circle(vec2_add(y_origin, (-0.1, -0.4)), name: _name("y_3"), fill: black, radius: 0.05)
      circle(vec2_add(y_origin, (0.1, -0.6)), name: _name("y_4"), fill: black, radius: 0.05)
      content(_name("y.north"), $Y$, anchor: "south", padding: 0.1, name: _name("y_label"))

      line(_name("x_label"), _name("y_label"), mark: (end: "straight"), name: _name("xy_arrow"))
      content(_name("xy_arrow"), $f$, anchor: "south", padding: 0.1)
      for con in connections {
        line(_name("x_") + str(con.at(0)), _name("y_") + str(con.at(1)), mark: (end: "straight"))
      }
      content(_name("xy_arrow"), label, anchor: "south", padding: 1)
    }

    abbildung(name: "a")
    abbildung(origin: (5, 0), connections: ((0, 0), (0, 2), (2, 3)), name: "b", label: [keine Abbildung])
  }),
  caption: [Abbildungen],
)

Die Menge $Gamma_f = {(x,y) in X crossmark Y | y = f(x)}$ heißt Graph von $f$.
#figure(
  cetz.canvas({
    import cetz.draw: *
    import cetz-plot: *
    // TODO: fully migrate to cetz-plot, if possible
    plot.plot(size: (2, 2), axis-style: none, {
      plot.add(domain: (0, 2), calc.sin)
    })
    rect((0, 0), (2, 2))
    line((0, -0.5), (2, -0.5))
    line((-0.5, 0), (-0.5, 2))
    content((-1.3, 1), $Y$)
    content((1, -1.3), $X$)
    circle((1, calc.sin(1) * 2), radius: 0.05, fill: black)
    line((1, calc.sin(1) * 2), (1, -0.5), stroke: (dash: "dashed"))
    line((1, calc.sin(1) * 2), (-0.5, calc.sin(1) * 2), stroke: (dash: "dashed"))
    content((1, -0.7), $x$)
    content((-0.9, calc.sin(1) * 2), $f(x)$)
  }),
  caption: [Graph von Abbildung $f$],
)

Eine Abbildung $f: X -> Y$ ist ein Tripel $(X, Y, Gamma)$, wobei $X,Y$ Mengen sind und $Gamma subset.eq X crossmark Y$ eine
Teilemenge mit der folgenden Eigenschaft:
$
  forall x in X: exists ! y in Y: (x,y) in Gamma
$

=== Bemerkung
Zwei Abbildungen $f: X -> Y, x |-> f(x)$ und $g: X' -> Y', x' |-> g(x')$ sind genau dann gleich, wenn $X=X'$, $Y=Y'$ und $f(x)=g(x)$
für alle $x in X (=X')$.

=== Beispiel
#enum(
  numbering: "(i)",
  [
    $op("id")_X: X -> X, x |-> x = op("id")_X (x)$ heißt Identität von $X$.
    #figure(
      cetz.canvas({
        import cetz.draw: *
        import cetz-plot: *
        plot.plot(size: (2, 2), axis-style: "school-book", x-tick-step: none, y-tick-step: none, {
          plot.add(domain: (-2, 2), x => x)
        })
      }),
      caption: [Identitätsabbildung $op("id")_X$],
    )
  ],
  [
    $emptyset -> X$ ist eine Abbildung: Aber, falls $X != emptyset$, dann existiert keine Abbildung $X -> emptyset$.
    Der Graph zu $emptyset -> X$ ist die leere Menge: $emptyset crossmark X = emptyset quad (emptyset, X, emptyset)$.
  ],
  [
    $ZZ -> RR, n |-> n^2$ und $ZZ -> NN_0, n |-> n^2$ sind verschiedene Abbildungen.
  ],
  [
    $NN -> RR, n |-> plus.minus sqrt(n)$ ist keine Abbildung \
    $ZZ -> RR, n |-> sqrt(n)$ ist keine Abbildung
  ],
  [
    $
      f: RR -> RR, x |-> f(x) := cases(1 "falls" x in QQ, 0 "falls" x in.not QQ)
    $
    Allgemein: $N subset.eq RR$ Teilemenge,
    $
      op("char")_N: RR -> RR, x |-> cases(1 "falls" x in N, 0 "sonst")
    $
    #figure(
      cetz.canvas({
        import cetz.draw: *
        import cetz-plot: *
        plot.plot(size: (2, 2), axis-style: "school-book", x-tick-step: none, y-tick-step: 1, name: "plot", {
          plot.add(domain: (-1, 4), x => if x >= 1 and x <= 3 { 1 } else { 0 })
        })
        content("plot.north", $Gamma_(op("char")_N)$)
      }),
      caption: [Abbildungsbeispiel $op("char")_N$],
    )
  ],
)

=== Definition
Sei $f: X -> Y$ eine Abbildung, $A subset.eq X$ und $B subset.eq Y$ Teilmengen.
#enum(
  numbering: "(a)",
  [
    $
      f(A) := & {y in Y | exists a in A: f(a) = y} \
            = & {f(a) | a in A} subset.eq Y
    $
    #figure(
      cetz.canvas({
        import cetz.draw: *
        import cetz-plot: *
        plot.plot(
          size: (2, 2),
          axis-style: "scientific",
          x-tick-step: none,
          y-tick-step: none,
          x-label: none,
          y-label: none,
          name: "plot",
          {
            // axis setup
            plot.add-anchor("bl", (0, -1.5))
            plot.add-anchor("br", (2 * calc.pi, -1.5))
            plot.add-anchor("lt", (-0.5 * calc.pi, 1))
            plot.add-anchor("lb", (-0.5 * calc.pi, -1))

            plot.add(domain: (0, 2 * calc.pi), calc.sin, style: (stroke: blue.lighten(20%)))
            plot.add(domain: (calc.pi * 0.75, calc.pi * 1.25), calc.sin, style: (
              stroke: (paint: teal, thickness: 1.5pt),
            ))
            plot.add-anchor("A1", (calc.pi * 0.75, calc.sin(calc.pi * 0.75)))
            plot.add-anchor("A1_x", (calc.pi * 0.75, -1.5))
            plot.add-anchor("A1_y", (-0.5 * calc.pi, calc.sin(calc.pi * 0.75)))
            plot.add-anchor("A2", (calc.pi * 1.25, calc.sin(calc.pi * 1.25)))
            plot.add-anchor("A2_x", (calc.pi * 1.25, -1.5))
            plot.add-anchor("A2_y", (-0.5 * calc.pi, calc.sin(calc.pi * 1.25)))
          },
        )
        // axis
        line("plot.bl", "plot.br")
        line("plot.lt", "plot.lb")

        line("plot.A1", "plot.A1_x", stroke: (dash: "dashed"))
        line("plot.A2", "plot.A2_x", stroke: (dash: "dashed"))
        line("plot.A1_x", "plot.A2_x", stroke: (thickness: 1.5pt), name: "line_x")
        content("line_x.mid", $A$, anchor: "north", padding: 4pt)

        line("plot.A1", "plot.A1_y", stroke: (dash: "dashed"))
        line("plot.A2", "plot.A2_y", stroke: (dash: "dashed"))
        line("plot.A1_y", "plot.A2_y", stroke: (thickness: 1.5pt), name: "line_y")
        content("line_y.mid", $f(A)$, anchor: "east", padding: 4pt)

        content("plot.br", $X$, anchor: "north", padding: 4pt)
        content("plot.lt", $Y$, anchor: "east", padding: 4pt)
      }),
      caption: [Das Bild einer Abbildung],
    )
  ],
  [
    $
      f^(-1)(B) := {x in X | f(x) in B}
    $
    #figure(
      cetz.canvas({
        import cetz.draw: *
        import cetz-plot: *

        let x_axis_x = -0.5 * calc.pi * 2
        let y_axis_y = -1.5
        let b1_y = calc.sin(0.15 * calc.pi)
        let b2_y = calc.sin(0.3 * calc.pi)

        plot.plot(
          size: (2, 2),
          axis-style: "scientific",
          x-tick-step: none,
          y-tick-step: none,
          x-label: none,
          y-label: none,
          name: "plot",
          {
            // axis setup
            plot.add-anchor("bl", (0, y_axis_y))
            plot.add-anchor("br", (4 * calc.pi, y_axis_y))
            plot.add-anchor("lt", (x_axis_x, 1))
            plot.add-anchor("lb", (x_axis_x, -1))

            plot.add(domain: (0, 4 * calc.pi), calc.sin, style: (stroke: blue.lighten(20%)))

            for n in range(1, 3) {
              // solutions of sin(x) = 0.15 * pi
              // see: https://www.wolframalpha.com/input?i=sin%28x%29%3D0.15*pi
              let b1_x = 6.28319 * (n - 1) + 0.490695
              // solutions of sin(x) = 0.3 * pi
              // see: https://www.wolframalpha.com/input?i=sin%28x%29%3D0.3*pi
              let b2_x = 6.28319 * (n - 1) + 1.22997
              plot.add-anchor("B1_" + str(n), (b1_x, b1_y))
              plot.add-anchor("B1_x_" + str(n), (b1_x, y_axis_y))
              plot.add-anchor("B1_y_" + str(n), (x_axis_x, b1_y))
              plot.add-anchor("B2_" + str(n), (b2_x, b2_y))
              plot.add-anchor("B2_x_" + str(n), (b2_x, y_axis_y))
              plot.add-anchor("B2_y_" + str(n), (x_axis_x, b2_y))

              plot.add(domain: (b1_x, b2_x), calc.sin, style: (
                stroke: (paint: teal, thickness: 1.5pt),
              ))
            }
          },
        )

        // axis
        line("plot.bl", "plot.br", name: "line_x")
        line("plot.lt", "plot.lb", name: "line_y")

        for n in range(1, 3) {
          line("plot.B1_" + str(n), "plot.B1_x_" + str(n), stroke: (dash: "dashed"))
          line("plot.B2_" + str(n), "plot.B2_x_" + str(n), stroke: (dash: "dashed"))
          line("plot.B1_x_" + str(n), "plot.B2_x_" + str(n), stroke: (thickness: 1.5pt))

          line("plot.B1_" + str(n), "plot.B1_y_" + str(n), stroke: (dash: "dashed"))
          line("plot.B2_" + str(n), "plot.B2_y_" + str(n), stroke: (dash: "dashed"))
          line("plot.B1_y_" + str(n), "plot.B2_y_" + str(n), stroke: (thickness: 1.5pt))
        }
        content("line_x.mid", $f^(-1)(B)$, anchor: "north", padding: 4pt)
        content("line_y.mid", $B$, anchor: "east", padding: 4pt)

        content("plot.br", $X$, anchor: "north", padding: 4pt)
        content("plot.lt", $Y$, anchor: "east", padding: 4pt)
      }),
      caption: [Das Urbild einer Abbildung],
    )
  ],
  [
    - $f|_A: A -> Y, a |-> f(x)$ heißt Einschränkung von $f$ auf/nach $A$.
    - $Y supset.eq f(A)$ heißt Bild von $A$ unter $f$.
    - $X supset.eq f^(-1)(B)$ heißt Urbild von $B$ unter $f$.
    *Beispiel:*
    $
      f: RR -> RR, x |-> sin(x)
    $
    #figure(
      cetz.canvas({
        import cetz.draw: *
        import cetz-plot: *
        plot.plot(
          size: (4, 2),
          axis-style: "school-book",
          x-tick-step: none,
          y-tick-step: none,
          y-min: -1,
          y-max: 1,
          y-ticks: (-1, 1),
          x-label: none,
          y-label: none,
          plot.add(domain: (-2 * calc.pi, 2 * calc.pi), calc.sin),
        )
      }),
      caption: [Beispiel für Bild und Urbild],
    )
    $
            f(RR) & = [-1;1] := {x in RR | -1 <= x <= 1} \
      f^(-1)({0}) & = {0, plus.minus pi, plus.minus 2 pi, ..., plus.minus k pi, ...}, quad k in ZZ
    $
  ],
)

=== Definition
Sei $f: X -> Y$ eine Abbildung
#enum(
  numbering: "(i)",
  [
    $f$ heißt injektiv, falls: Für alle $x, x' in X$ mit $x != x'$ gilt $f(x) != f(x')$.
    #enum(
      numbering: (..nums) => $<=>$,
      [
        Für alle $x,x' in X$ gilt: $f(x)=f(x') => x=x'$
      ],
      [
        Für alle $y in Y$ hat $f^(-1)({y})$ höchstens ein Element ($abs(f^(-1)({y})) <= 1$)
      ],
    )
    Alternative schreibweise: $f: X arrow.hook Y$
  ],
  [
    $f$ heißt surjektiv, falls $f(X) subset.eq Y$
    #enum(
      numbering: (..nums) => $<=>$,
      [
        Für alle $y in Y$ hat $f^(-1)({y})$ mindestens ein Element ($abs(f^(-1)({y})) >= 1$)
      ],
    )
    Alternative schreibweise: $f: X arrow.twohead Y$
  ],
  [
    $f$ heißt bijektiv, falls $f$ injektiv und surjektiv ist
    #enum(
      numbering: (..nums) => $<=>$,
      [
        Für alle $y in Y$ hat $f^(-1)({y})$ genau ein Element ($abs(f^(-1)({y})) = 1$)
      ],
    )
    // twohead-hook-arrow workaround insipired by: https://tex.stackexchange.com/questions/296151/double-head-and-hook-arrow
    Alternative schreibweise: $f: X arrow.hook #h(-3.3mm) arrow Y, f: X -> #place(bottom, dx: -4.8mm, dy: -0.5mm, scale(80%, $tilde.equiv$)) Y$
  ],
)

*Beispiel:*
#enum(
  numbering: "(i)",
  [
    $
      sin: RR -> RR
    $
    ist weder injektiv noch surjektiv
  ],
  [
    $
      sin: RR -> [-1; 1]
    $
    ist surjektiv, aber nicht injektiv
  ],
  [
    $
      sin: [frac(-pi, 2), frac(pi, 2)] -> [-1;1]
    $
    ist bijektiv (s. Analysis)
  ],
)

=== Definition
Seien $f: X -> Y$ und $g: Y -> Z$ Abbildungen.
Dann heißt: $g compose f: X -> Z, x |-> (g compose f)(x) := g(f(x))$ die Komposition (Verknüpfung) von $f$ und $g$.

=== Bemerkung
$compose$ ist assoziativ. Ist $h: Z -> A$ eine weitere Abbildung, so gilt $h compose (g compose f) = (h compose g) compose f$.
// TODO: plot
Denn für alle $x in X$ gilt:
$
  (h compose (g compose f))(x) & = h((g compose f)(x)) \
                               & = h(g(f(x))) \
                               & = (h compose g)(f(x)) \
                               & = ((h compose g) compose f)(x)
$

=== Beispiel
#enum(
  numbering: "(i)",
  [
    Ist $f: X -> Y$ eine Abbildung, so gilt $f compose op("id")_X = f = op("id")_Y compose f: X -> Y$
  ],
  [
    $
      f: RR -> RR, x |-> sin(x)-1 & quad g: RR -> RR, x |-> x^2 \
                 (f compose g)(x) & = sin(x^2)-1 \
                 (g compose f)(x) & = (sin(x)-1)^2
    $
    Im Allgemeinen gilt: $f compose g != g compose f$
  ],
)

=== Satz
Für eine Abbildung $f: X -> Y$ sind äquivalent:
#enum(
  numbering: "(a)",
  [
    $f$ ist bijektiv
  ],
  [
    Es existiert eine Abbildung $g: Y -> X$ derart, dass $g compose f = op("id")_X: X -> X$ und
    $f compose g = op("id")_Y: Y -> Y$
  ],
)
