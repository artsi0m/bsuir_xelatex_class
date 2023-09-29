%%% Local Variables: 
%%% coding: utf-8
%%% mode: latex
%%% TeX-engine: xetex
%%% End: 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsuir-std}[2023/09/29 Class conforming to BSUIR standard]
\LoadClass[a4paper,14pt]{extreport}
\setlength{\textwidth}{165mm}
\setlength{\textheight}{250mm}
\pagenumbering{arabic}
\RequirePackage{polyglossia} % also loads fontspec needed for loading TMR font

\RequirePackage{iftex}
\ifXeTeX
  \providecommand{\No}{\textnumero}
  \RequirePackage{xecyr} %% To silence warning about \cyr in xelatex
  % интервал между строк
  \RequirePackage{setspace}
  \setstretch{1}
\fi

