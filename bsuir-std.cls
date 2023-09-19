%!TEX program = xelatex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsuir-std}[2023/09/18 Class conforming to BSUIR standard]
\LoadClass[a4paper,14pt]{eskdtext}
\setlength{\textwidth}{165mm}
\setlength{\textheight}{250mm}
\pagenumbering{arabic}
\RequirePackage{polyglossia} % also loads fontspec needed for loading TMR font

\RequirePackage{iftex}
\ifXeTeX
\providecommand{\No}{\textnumero}
\RequirePackage{xecyr} %% To silence warning about \cyr in xelatex
\fi
