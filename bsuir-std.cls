%%% Local Variables: 
%%% coding: utf-8
%%% mode: latex
%%% TeX-engine: xetex
%%% End: 

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
%% \RequirePackage{atbegshi}
\newsavebox\ESKDpicturebox
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

