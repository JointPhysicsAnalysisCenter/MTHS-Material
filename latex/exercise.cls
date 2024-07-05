% myclass.sty
% awesome class
% 2015-10-15 Will Davey will.davey@cern.ch

% --- Class structure: identification part
% ---
\ProvidesClass{exercise}[2015/10/15 version 1.00 class for tutorial exercises]
\NeedsTeXFormat{LaTeX2e}


% --- Class structure: declaration of options part
% ---
% This class extends the article class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.min" exists, then it is loaded 
\DeclareOption*{\InputIfFileExists{\CurrentOption.min}{}{%
    \PassOptionsToClass{\CurrentOption}{article}}}

% --- Class structure: execution of options part % ---
\ProcessOptions \relax
% --- Class structure: declaration of options part % ---
\LoadClass{article}


% -- Load packages
\usepackage[T1]{fontenc}
\usepackage[latin9]{inputenc}
\usepackage[a4paper]{geometry}
\geometry{verbose,tmargin=2cm,bmargin=2.5cm,lmargin=2cm,rmargin=2cm}
\usepackage{xcolor}
\usepackage{pdfcolmk}
\usepackage{calc}
\usepackage{amsmath}
\usepackage{amssymb}
% \usepackage[makeroom]{cancel}
\usepackage{units}
\usepackage[urlcolor=blue,colorlinks=true]{hyperref}
\PassOptionsToPackage{normalem}{ulem}
\usepackage{ulem}
\makeatletter
\usepackage{latex/atlasphysics}
\usepackage{latex/astrodefs}
\usepackage{euscript}
\usepackage{amsfonts}
% \usepackage{bbm}
%\usepackage{feynmf}
\usepackage{feynmp}
\usepackage{slashed}
\usepackage{xfrac}
\usepackage{graphicx}
\usepackage{listings}
\usepackage{parskip}
\usepackage{enumerate}
\usepackage{paralist}
%\usepackage{ifthen}
\usepackage{etoolbox}
%\usepackage{xifthen}
\usepackage{boxedminipage}
\usepackage{environ}
\renewcommand*{\familydefault}{\sfdefault}
\renewcommand{\theenumi}{\alph{enumi}}
\renewcommand{\labelenumi}{(\alph{enumi})}
\ifcsname ifwithsolution\endcsname\else
  \expandafter\let\csname ifwithsolution\expandafter\endcsname
  \csname iffalse\endcsname
\fi
\usepackage{latex/shortcuts}
%\usepackage{latex/babarsym}

% --- Define Paths
\newcommand{\expath}{Exercises}
\newcommand{\formpath}{Formulae}
\newcommand{\figpath}{Figures}
\newcommand{\solpath}{Solutions}

% --- Import excersise from "Excersises" path
% #1 - Excersise file
% #2 - Title
% #3 - Number of points
\newcommand{\importex}[3]{
  \subsection{#2%
    \ifstrequal{}{#3}{}{\hfill [#3 points]}
  }

  \input{\expath/#1.tex}
}

\newcommand{\importform}[1]{
  \input{\formpath/#1.tex}
}


% --- Include Figure
\newcommand{\fig}[2]{\begin{center}\includegraphics[width=#1\textwidth]{\figpath/#2}\end{center}}
% --- Include Solution Figure
\newcommand{\sol}[2]{\begin{center}\includegraphics[width=#1\textwidth]{\solpath/#2}\end{center}}

\newcommand{\twofig}[4]
{
  \begin{center}
    \centering
    \begin{minipage}[c]{#1\textwidth}
      \includegraphics[width=\linewidth]{\figpath/#2}
    \end{minipage}
    \hfill
    \begin{minipage}[c]{#3\textwidth}
      \includegraphics[width=\linewidth]{\figpath/#4}
    \end{minipage}
  \end{center}
}


% --- Morning / Afternoon macros
\newcommand{\morning}{
  \begin{center}
    \bf \Large Lecture material\\[2ex]
  \end{center}
}

\newcommand{\afternoon}{
  \begin{center}
    \bf \Large Exercices\\[2ex]
  \end{center}
}


\newcommand{\material}[2]{
  \begin{minipage}{0.5\textwidth}
    \textbf{Discussed topics}:
    \begin{itemize}
      #1
    \end{itemize}
  \end{minipage}
  \begin{minipage}{0.5\textwidth}
    \textbf{References}:
    \begin{itemize}
      #2
    \end{itemize}
  \end{minipage}
  \vspace{1cm}
}




% --- Document Variables 

% institute (eg. Universit\"at Bonn) 
\global\let\@institute\@empty
\newcommand{\setinstitute}[1]{\def\@institute{#1}}
\let\institute\setinstitute
\newcommand{\show@institute}{\@institute}

% subject code (eg. physics716)
\global\let\@subjectcode\@empty
\newcommand{\setsubjectcode}[1]{\def\@subjectcode{#1}}
\let\subjectcode\setsubjectcode
\newcommand{\show@subjectcode}{\@subjectcode}

% subject name (eg. Particle Physics)
\global\let\@subjectname\@empty
\newcommand{\setsubjectname}[1]{\def\@subjectname{#1}}
\let\subjectname\setsubjectname
\newcommand{\show@subjectname}{\@subjectname}

% semester (eg. Summer Semester 2015) 
\global\let\@semester\@empty
\newcommand{\setsemester}[1]{\def\@semester{#1}}
\let\semester\setsemester
\newcommand{\show@semester}{\@semester}

% sheet number 
\global\let\@sheetnumber\@empty
\newcommand{\setsheetnumber}[1]{
  \def\@sheetnumber{#1}
  \setcounter{section}{#1}
}
\let\sheetnumber\setsheetnumber
\newcommand{\show@sheetnumber}{\@sheetnumber}

% lecturers (eg. Prof.~Jochen Dingfelder)
\global\let\@lecturers\@empty
\newcommand{\setlecturers}[1]{\def\@lecturers{#1}}
\let\lecturers\setlecturers
\newcommand{\show@lecturers}{\@lecturers}

% tutors (eg. Dr.~Will Davey)
\global\let\@tutors\@empty
\newcommand{\settutors}[1]{\def\@tutors{#1}}
\let\tutors\settutors
\newcommand{\show@tutors}{\@tutors}


% exercise date 
\global\let\@exdate\@empty
\newcommand{\setexdate}[1]{\def\@exdate{#1}}
\let\exdate\setexdate
\newcommand{\show@exdate}{\@exdate}

% due date (Aug 21, or "in the next tute")
\global\let\@duedate\@empty
\newcommand{\setduedate}[1]{\def\@duedate{#1}}
\let\duedate\setduedate
\newcommand{\show@duedate}{\@duedate}


% contact 
\global\let\@contact\@empty
\newcommand{\setcontact}[1]{\def\@contact{#1}}
\let\contact\setcontact
\newcommand{\show@contact}{\@contact}



% --- header
\newcommand{\makeheader}{%
  \begin{center}
    \rule{\textwidth}{2pt}
    \@institute
    \hfill\@subjectcode
    \\[1mm]
    \begin{minipage}[c]{0.15\textwidth} % Adjust the width as needed
      \includegraphics[width=\linewidth]{Figures/QRCode.png}
    \end{minipage}%
    \begin{minipage}[c]{0.68\textwidth} % Adjust the width as needed
      \centering
      % title 
      \vspace{1ex}
      {\bf\Large \@subjectname{} -- Exercise sheet \@sheetnumber}

      % lecturers
      \vspace{1mm}
      {\large Morning: \@lecturers}\par
      \vspace{1mm}
      {Afternoon: \@tutors}

      % contact
      % \ifthenelse{\equal{\empty}{\@contact}}{}{{\small Contact: \@contact}}

    \end{minipage}
    \begin{minipage}[c]{0.15\textwidth} % Adjust the width as needed
      \includegraphics[width=\linewidth]{Figures/QRCode.png}
    \end{minipage}%
    \\[2mm]
    % dates
    \@exdate %\hfill
    % To be submitted \@duedate.

    \vspace{-2ex}
    \rule{\textwidth}{2pt}
  \end{center}
  \vspace{2ex}
}


% --- auto include header in document (TODO if I get around to it)



% --- solution environment
%% Standard latex
%\newenvironment{solution}
%  {
%    \begin{boxedminipage}[t]{0.9\columnwidth}
%    {\bf Solution: }
%  }
%  { 
%    \end{boxedminipage}
%  }

\NewEnviron{solution}
{%
  \ifwithsolution%
    \begin{boxedminipage}[t]{0.9\columnwidth}
      {\bf Solution: }\BODY
    \end{boxedminipage}%
  \fi%
}


\makeatother









