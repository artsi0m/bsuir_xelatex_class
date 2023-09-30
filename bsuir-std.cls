%%% Local Variables: 
%%% coding: utf-8
%%% mode: latex
%%% TeX-engine: xetex
%%% End: 

%%% Эта штука выше нужна для емакса и auctex,
%%% хотя я ещё auctex не особо пользовался

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsuir-std}[2023/09/30 Class conforming to BSUIR standard]

% Почему выбран класс eskdx?
% Главным образом потом что он позволяет
% - Делать секции по ГОСТ 2.105-95
%     ( у меня были большие проблемы с секциями в ворде)
% - Писать спецификацию
% 
% Тем не менее не стоит через него делать титульник.
\LoadClass[a4paper,14pt]{eskdtext}

% СТП-2017 приложение Л
\setlength{\textwidth}{165mm}
\setlength{\textheight}{250mm}
\pagenumbering{arabic}

% Добавляем polyglossia, с ним же добавиться fontspec и можем
% использовать шрифт Times New Roman в XeLaTeX
\RequirePackage{polyglossia} 

\RequirePackage{iftex} 

% Я использую XeLaTeX потому что это позволяет использовать системный
% Times New Roman
\ifXeTeX
  \providecommand{\No}{\textnumero}
  \RequirePackage{xecyr} %% To silence warning about \cyr in xelatex
  % интервал между строк
  \RequirePackage{setspace}
  \setstretch{1}
\newsavebox\ESKDpicturebox

% Support for the eskdx class in XeLaTeX
% https://tex.stackexchange.com/a/587888
\renewcommand{\ESKD@ShipoutPicture}{%
     \ifESKD@twoside
       \ifodd\c@page
         \ESKDframeX=\ESKD@margin@si
       \else
         \ESKDframeX=\ESKD@margin@so
       \fi
     \else
       \ESKDframeX=\ESKD@margin@si
     \fi
     \ESKDframeY=\ESKD@margin@b
     \ESKDstampX=\ESKDframeX
     \advance\ESKDstampX \ESKDframeW
     \advance\ESKDstampX -185mm
     \ESKDstampY=\ESKDframeY    
     \sbox\ESKDpicturebox{%
        \unitlength=1mm
        \begin{picture}(0,0)(\ESKDltu{\ESKD@origin@x},\ESKDltu{\ESKD@origin@y})%
          \ifx\ESKD@thisstyle\@empty
            \let\ESKD@thisstyle\ESKD@curstyle
          \fi
          \loop
          \ifnum \ESKD@hash@pos{@style@draw@\ESKD@thisstyle} %
            < \ESKD@hash@count{@style@draw@\ESKD@thisstyle}
            \ESKD@hash@next@value{@style@draw@\ESKD@thisstyle}\relax
          \repeat
          \ifx\ESKD@extra@ThisHook\@empty%
            \ESKD@extra@Hook\else\ESKD@extra@ThisHook%
          \fi%
          \global\let\ESKD@thisstyle\@empty%
          \global\let\ESKD@extra@ThisHook\@empty%
        \end{picture}
        }%
       \AddToHook{shipout/foreground}{%
         \put(1in,-1in){\usebox\ESKDpicturebox}}%
     }
     
\fi

