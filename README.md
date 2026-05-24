# Tongji-Beamer

A clean Beamer theme styled for **Tongji University**.

![preview](cover-preview.png)

## Quick start

```bash
make           # build main.pdf
make clean     # remove aux files
```

Requires TeX Live 2022+ with `xelatex`, `latexmk`, `ctex`, `eso-pic`,
`fontawesome5`, plus the **Noto Sans/Serif CJK SC** fonts.

## Two visual modes

Toggle via the switch near the top of `main.tex`:

```latex
\newif\iftjbgmode
% \tjbgmodetrue    % comment out  -> minimal mode (default)
\tjbgmodetrue      % uncomment    -> background mode
```

- **Minimal** — white background with a soft right-edge badge watermark.
- **Background** — a desaturated campus landmark photo per section
  (蝴蝶桥 → 仰望星空 → 航拍同济 → 春雨中的校园).

## Customisation

| What                      | Where                                                                               |
| ------------------------- | ----------------------------------------------------------------------------------- |
| Author / institute / date | `\author{}` / `\institute[short]{full}` / `\date{}` block in `main.tex`             |
| Primary color             | `tjBluePrimary` etc. in `tjvi.sty`                                                  |
| Cover background image    | `tjvi/pics/03-cover.jpg`                                                            |
| Section landmark photos   | `tjvi/pics/0{1..4}-bg.jpg`                                                          |
| Watermark badge           | `tjvi/tongji-vi-badge.pdf`                                                          |
| Theme options             | `\usetheme[max,blue,light]{tjbeamer}` — `max/maxplus/min`, `blue/red`, `light/dark` |

## Splitting into multiple files

For longer talks, organise frames under `sections/`:

```latex
\begin{document}
  \input{sections/cover.tex}
  \input{sections/01-intro.tex}
  \input{sections/02-method.tex}
  \input{sections/03-results.tex}
  \input{sections/thanks.tex}
\end{document}
```

## Credits

- Forked from [SJTUBeamer](https://github.com/sjtug/SJTUBeamer) (CC-BY-NC-SA 4.0).
- Tongji badge & wordmark from [TJ-CSCCG/tongji-visual](https://github.com/TJ-CSCCG/tongji-visual).
- Watermark composition idea from [Kian-Chen/TongjiBeamer](https://github.com/Kian-Chen/TongjiBeamer).
- Fonts: Noto Sans/Serif CJK SC, LXGW WenKai (all open source).

## License

Inherited from SJTUBeamer: CC-BY-SA 4.0. Tongji visual assets remain property
of Tongji University; this template is for non-commercial academic use.
