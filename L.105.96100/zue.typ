#import "@preview/lilaq:0.5.0" as lq

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
    *Zentralübungen*
  ],
)

#set heading(numbering: (..nums) => "Zentralübung " + numbering("1", ..nums) + ":")

= Mengen und Aussagen
Falls $N subset.eq M$, dann gilt $M \\ N = N^c$.

Beispiel:
$
  M=RR^2=RR crossmark RR={(x,y) | x,y in RR} \
  M supset.eq N := {(x,y) | frac(1, 2) x - 1 <= y and 2 - x >= y}
$

#figure(
  {
    let x = lq.linspace(-1, 3)
    let x2 = lq.linspace(-1, 2)
    let f1 = x => 0.5 * x - 1
    let f2 = x => 2 - x
    let f1_x2 = x2 => 0.5 * x2 - 1
    let f2_x2 = x2 => 2 - x2
    lq.diagram(
      xaxis: (position: 0, filter: (value, distance) => false),
      yaxis: (position: 0, filter: (value, distance) => false),
      lq.plot(x, f1, mark: none, stroke: black),
      lq.plot(x, f2, mark: none, stroke: black),
      lq.fill-between(
        x,
        f2,
        y2: x => 3,
        fill: tiling(size: (3mm, 3mm), line(start: (0%, 0%), end: (100%, 100%), stroke: (
          paint: fuchsia.lighten(60%),
          thickness: 0.5pt,
        ))),
      ),
      lq.fill-between(
        x,
        f1,
        y2: x => -2,
        fill: tiling(size: (3mm, 3mm), line(start: (0%, 0%), end: (100%, 100%), stroke: (
          paint: fuchsia.lighten(60%),
          thickness: 0.5pt,
        ))),
      ),
      lq.fill-between(
        x2,
        f1_x2,
        y2: f2_x2,
        fill: tiling(size: (3mm, 3mm), line(start: (0%, 0%), end: (100%, 100%), stroke: (
          paint: blue.lighten(60%),
          thickness: 0.5pt,
        ))),
      ),
      lq.place(3.5, 0.5, $frac(1, 2) x - 1$),
      lq.place(3.5, -1, $2 - x$),
      lq.place(2, 2, $N^c$),
      lq.place(-0.5, 0.5, $N$),
    )
  },
  caption: [Mengenkomplement],
)

Durch $not (A and B) <=> not A or not B$ gilt:
$
  N^c = {(x,y) | frac(1, 2) x - 1 > y or 2 - x < y}
$
