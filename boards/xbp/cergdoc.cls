%%  BASIC STYLE PAGE FOR CERG
%%
%%  Developed by:
%%      Panasayya Yalla 
%%      George Mason University
%%      (style adapted from GMU thesis latex style)
%%
%%
%%
%%
%%
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cergdoc}[2018/03/20 v1.0 CERG Documentation class]
\LoadClass[letterpaper]{report}

\RequirePackage{graphicx} % needed for logo and pictures
\RequirePackage{xcolor}
\RequirePackage[hidelinks=true]{hyperref}
\RequirePackage{tcolorbox}

% Color Definitions
\definecolor{cergpurple}{HTML}{3D0473}
\definecolor{cergpink}{HTML}{802391}
\definecolor{cergblue}{RGB}{100,116,172}
\definecolor{cerglightblue}{HTML}{8C9EE5}
\definecolor{cerggold}{HTML}{F6C74F}

% Title Page

%https://tex.stackexchange.com/questions/125383/default-values-in-newcommand-renewing-maketitle
\let\@subtitle\@empty
\let\@email\@empty
\let\@affiliation\@empty
\def\@topicpic{\includegraphics[width=40mm]{cergimg/cerglogo.pdf}}

\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\email}[1]{\gdef\@email{#1}}
\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}}
\newcommand{\topicpic}[1]{\gdef\@topicpic{\includegraphics[width=\paperwidth]{cergimg/#1}}}

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}

\renewcommand\maketitle{
  \begin{alwayssingle}
    \thispagestyle{empty}
%    \vspace*{\dimexpr-\baselineskip-\topskip-\topmargin-0.9in\relax}
    \vspace*{\dimexpr-1in-\voffset-\topmargin-\baselineskip}
    \noindent\makebox[\textwidth]{\@topicpic}
    \begin{center}
%      {\par\@topicpic\par\vspace*{15mm}}
      ~
%      \rule{\textwidth}{1pt}\par % Thick horizontal line
      \vspace{0.5in}

      {\Huge\bfseries\@title\par}

      {\ifx\@subtitle\@empty\else\Large\vspace*{1ex}\par\@subtitle\par\fi}
      \vspace{0.5in}
      \noindent\makebox[\textwidth]{\color{cergpurple}\rule{\paperwidth}{3pt}}
\vfill
      {\large\bfseries\@author\par}
      {\ifx\@email\@empty\else\large\@email\par\fi}
      {\ifx\@affiliation\@empty\else\large\@affiliation\par\fi}

\vfill
       \begin{minipage}{\textwidth}
              \begin{minipage}[!t]{0.30\textwidth}
                \begin{center}
                     \vspace{1ex}
                    \includegraphics[scale=0.35]{./cergimg/CERG-logo-sm.png}
                \end{center}
            \end{minipage}
            \begin{minipage}[!t]{0.39\textwidth}
                 \hspace{3ex}
            \end{minipage}
            \begin{minipage}[!t]{0.30\textwidth}
		    \begin{center}  
			\includegraphics[scale=.50]{./cergimg/Mason-logo.png}
		\end{center}
            \end{minipage}
        \end{minipage}
        \begin{minipage}{\textwidth}
              \begin{minipage}[!t]{0.30\textwidth}
                \begin{center}
                     \vspace{1ex}
                    \href{https://cryptography.gmu.edu/}{www.cryptography.gmu.edu} 
                \end{center}
            \end{minipage}
            \begin{minipage}[!t]{0.39\textwidth}
                 \hspace{3ex}
            \end{minipage}
            \begin{minipage}[!t]{0.30\textwidth}
		    \centering
                    \href{https://www.gmu.edu/}{www.gmu.edu} 
            \end{minipage}
            \end{minipage}


    \end{center}
    \noindent\makebox[\textwidth]{\begin{tcolorbox}[width=\paperwidth,colback={cerglightblue},arc=0mm,colupper=white,colframe={cergpink},boxrule=0pt,toprule=3pt]
    \centering
    {\color{cerggold}Cryptographic Engineering Research Group}\\
    Department of Electrical and Computer Engineering \quad\quad George Mason University\\
    3100 Engineering Building, \quad 4400 University Drive, \quad   Fairfax, VA 22030-4444,  USA \\
    Voice: (703) 993-1561, \quad Fax: (703) 993-1601 
    \end{tcolorbox}}
    \vspace*{\dimexpr-1in-\footskip-\baselineskip}

  \end{alwayssingle}

}
\endinput

%%%%%CHAPTER SETTINGS
\def\startofchapters{%
    \renewcommand{\thepage}{\arabic{page}}
    \setcounter{chapter}{0}
    %\ls{2}
    % replacing this with the \doublespacing command from setspace package, as
    % the \ls macro above makes text in figure captions and footnotes double
    % spaced, which is undesirable. setspace package avoid this. (Muhammad Abdulla)
    \doublespacing
    \setcounter{page}{0}
}
%--- chapters ---


\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
        \refstepcounter{chapter}%
        \typeout{\@chapapp\space\thechapter.}%
        \addcontentsline{toc}{chapter}{\protect
        %    \numberline{\thechapter} \bf #1}  %% USE FOR BOLD TOC!!!!!!
            \numberline{\thechapter} #1}
      \else
            \addcontentsline{toc}{chapter}{#1}
      \fi
   \chaptermark{#1}
%  \addtocontents{lof} {\protect\addvspace{10\p@}}
%  \addtocontents{lot} {\protect\addvspace{10\p@}}
   \if@twocolumn
           \@topnewpage[\@makechapterhead{#2}]%
     \else \@makechapterhead{#2}%
           \@afterheading
     \fi}

\def\@schapter#1{
        \refstepcounter{chapter}
        \typeout{\@chapapp\space\thechapter.}
        \addcontentsline{toc}{chapter}{\protect
        \numberline{}\hspace*{-0.25in}#1}
   \chaptermark{#1}
%  \addtocontents{lof}{\protect\addvspace{0pt}}
%  \addtocontents{lot}{\protect\addvspace{0pt}}
   \if@twocolumn \@topnewpage[\@makeschapterhead{#1}]
        \else \@makeschapterhead{#1}
              \@afterheading\fi}


\def\l@chapter{\vskip 0.0em plus 1pt
        %\bf
        \@dottedtocline{0}{0.0em}{1.35em}
}

\def\@makechapterhead#1{
  { \parindent 0pt \raggedright
    \vspace*{0.27 in}%{0.75in}
%%%    \centerline{\Large \bf \@chapapp{} \thechapter
    \begin{center}
     {\Large \bf Chapter \thechapter
    \Large \bf
%%%   \space : #1} \par
    : #1} \par
\end{center}
    \nobreak
    \vskip 22 pt %40pt
  }

}

\def\@makeschapterhead#1{
  { \parindent 0pt \raggedright
    \vspace*{0.6 in}%{0.75in}
    \centerline{\Large \bf #1} \par
    \nobreak
    \vskip 40pt
  }
}