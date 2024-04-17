%-------------------------------------------------------------------------------
% Template class for ATLAS notes
%
% See ChangeLog or SVN log for history of changes.
% Responsible: Ian Brock (ian.brock@cern.ch)
%-------------------------------------------------------------------------------
% $Id: atlasnote.cls 301586 2014-08-18 17:36:36Z brock $
% $HeadURL: svn+ssh://svn.cern.ch/reps/atlasgroups/pubcom/latex/atlasnote/trunk/atlasnote.cls $
%-------------------------------------------------------------------------------
\def\ATPackageVersion{00-99-00}

% --- Class structure: identification part
\ProvidesClass{latex/atlasdoc}[2014/09/01 v.00-99-00 ATLAS document]
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: declaration of options part
% ATLAS draft cover page off by default
\let\if@DraftCover\iffalse
\DeclareOption{coverpage}{\let\if@DraftCover\iftrue}
% Preprint cover page off by default
% If preprint cover is made, regular title should be turned off
\let\if@PreprintCover\iffalse
\DeclareOption{preprint}{\let\if@PreprintCover\iftrue \let\if@MakeTitle\iffalse}
% Title page on by default
\let\if@MakeTitle\iftrue
\DeclareOption{nomaketitle}{\let\if@MakeTitle\iffalse}
% Paper size A4 by default
\let\if@APaper\iftrue
\let\if@LPaper\iffalse
\DeclareOption{a4paper}{\let\if@APaper\iftrue \let\if@LPaper\iffalse}
\DeclareOption{letterpaper}{\let\if@APaper\iffalse \let\if@LPaper\iftrue}
% Type of document
\let\if@CONFNote\iffalse
\let\if@PUBNote\iffalse
\DeclareOption{CONF}{\let\if@CONFNote\iftrue \let\if@PUBNote\iffalse}
\DeclareOption{PUB}{\let\if@CONFNote\iffalse \let\if@PUBNote\iftrue}
% Use KOMA-script instead of standard LaTeX
\let\if@Koma\iffalse
\DeclareOption{koma}{\let\if@Koma\iftrue}
% Document language
%\let\if@UKenglish\iftrue
%\let\if@USenglish\iffalse
%\DeclareOption{UKenglish}{\let\if@UKenglish\iftrue  \let\if@USenglish\iffalse}
%\DeclareOption{USenglish}{\let\if@UKenglish\iffalse \let\if@USenglish\iftrue}
% Include tikz package off by default - not necessary any more? ICB 2014-08-26
%\let\if@usetikz\iffalse
%\DeclareOption{usetikz}{\let\if@usetikz\iftrue}

% This class extends the article class
% Read all the atlasnote options, pass them to article
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% --- Class structure: execution of options part
\ProcessOptions \relax

% --- Class structure: initial code part
% Defaults for title page
\newdimen\AN@skipbeforetitle
\AN@skipbeforetitle=60\p@
\newcommand{\skipbeforetitle}[1]{\AN@skipbeforetitle=#1}

\def\@title{title: use \textbackslash title to set it}
%\def\@atlastitle{atlastitle: use \textbackslash atlastitle to set it}
\def\@author{The ATLAS Collaboration}
\def\@date{\today}

% Author(s)
%\def\@makefnmark{\hbox{$^{\@thefnmark)}$}}
%\def\author#1{%% Treat the list of authors
%\setcounter{footnote}{0}\def\@currentlabel{}%
%\begingroup\def\thefootnote{\arabic{footnote}}
%\global\@topnum\z@ \large\begin{center}{\lineskip.5em
%\begin{tabular}[t]{c}#1\end{tabular}\par}
%\end{center}\par\vskip1.5em\@thanks\endgroup}
%\newenvironment{Authlist}{\begin{center}}{\end{center}}

% Document title
%\newcommand{\AtlasTitle}[1]%
%{
%  \def\@title{#1}
%  \def\@atlastitle{#1}
%}

% Draft version 
\def\@draftversion{}
\newcommand{\draftversion}[1]%
{
  \def\@draftversion{#1}
}
\newcommand{\AtlasVersion}[1]%
{
  \def\@draftversion{#1}
}

% Draft heading code
\newcommand{\draftheading}%
{
  % 
  % compute the time in hours and minutes
  % make new variables \timehh and \timemm
  % 
  \newcount\timehh\newcount\timemm
  \timehh=\time 
  \divide\timehh by 60 \timemm=\time
  \count255=\timehh\multiply\count255 by -60 \advance\timemm by \count255
  % put in header
  \markboth%
  % --- Left mark
  {\hspace*{\fill}{\protect\small\bf \fbox{DRAFT}}
    \hspace*{\fill}
    \protect\makebox[0pt][r]{\protect\small\sl\today\ -- 
      \ifnum\timehh<10 0\fi\number\timehh\,:\,\ifnum\timemm<10 0\fi\number\timemm}
  }%--- right mark
  {\protect\makebox[0pt][l]{\protect\small\sl\today\ -- 
      \ifnum\timehh<10 0\fi\number\timehh\,:\,\ifnum\timemm<10 0\fi\number\timemm}
    \hspace*{\fill}
    {\fbox{\textbf{DRAFT}}}
    \hspace*{\fill}}
  %
  \pagestyle{myheadings}
}

% ATLAS reference code - empty by default
\def\@refcode{}
\newcommand{\AtlasRefCode}[1]{\def\@refcode{#1}}

% ATLAS note number
\def\@atlasnote{}
\newcommand{\AtlasNote}[1]{\def\@atlasnote{#1}}

% Submission details
\def\@subprepend{To be submitted to }
\newcommand{\subprepend}[1]{\def\@subprepend{#1}}
\def\@journal{}
\newcommand{\AtlasJournal}[1]{\def\@journal{#1}}
\newcommand{\journal}[1]{\def\@journal{#1}}

% Abstract text
\def\AtlasAbstractText{}
\newcommand{\AtlasAbstract}[1]{%
	\def\AtlasAbstractText{#1}
}
\newcommand{\abstracttext}[1]{%
	\def\AtlasAbstractText{#1}
}

% Shortcut to add submission text
\newcommand{\submitted}%
{
  \ifx\@journal\@empty\mbox{}%
  \else
  \vskip 0.8in plus 2in%
  \begin{center}%
    \@subprepend\space {\it \@journal}%
    \vskip 1.5em%
  \end{center}%
  \vskip 0.5in
  \fi
}


% --- Class structure: invoke main class
\if@Koma%
	\if@APaper%
		\LoadClass[titlepage,a4paper,11pt]{scrartcl}
	\else
		\LoadClass[titlepage,letterpaper,11pt]{scrartcl}
	\fi
\else
\if@APaper%
	\LoadClass[titlepage,a4paper,11pt]{article}
%	\if@USenglish%
%	  \LoadClass[titlepage,a4paper,11pt]{article}
%	\else%
%	  \LoadClass[titlepage,a4paper,11pt]{article}
%	\fi
\else
	\LoadClass[titlepage,letterpaper,11pt]{article}
%	\if@USenglish%
%	  \LoadClass[titlepage,letterpaper,11pt,USenglish]{article}
%	\else%
%	  \LoadClass[titlepage,letterpaper,11pt,UKenglish]{article}
%	\fi
\fi
\fi

\RequirePackage{geometry}

% Redefine the page size - use fraction of paper, so it works for A4 and letter
\geometry{
  centering,scale=0.75,%
  marginparsep=0.2cm,% 
  marginparwidth=1.8cm%
}

% Turn on bold math when using \bfseries
\def\bfseries{\fontseries\bfdefault\selectfont\boldmath}

% --- Class structure: main code part
% ATLAS draft cover page
\if@DraftCover%
	\if@CONFNote
    \RequirePackage[CONF,atlasdoc]{latex/atlascover}
  \else
		\if@PUBNote
    	\RequirePackage[PUB,atlasdoc]{latex/atlascover}
    \else
    	\RequirePackage[atlasdoc]{latex/atlascover}
    \fi
  \fi
\fi
% CERN preprint cover page
\if@PreprintCover %
	\RequirePackage[atlasdoc]{latex/atlascover}
\fi

% Remove the numbers from all the headings (\section, \subsection, etc.)
%\setcounter{secnumdepth}{-1}

% Required packages
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage{babel}
\RequirePackage[varg]{txfonts}
%\RequirePackage{mathptmx}
% Add ability to include line numbers
\RequirePackage{lineno}
% If you have an old lineno or do not have it, you can get it from the latex/other directory
% \RequirePackage{latex/other/lineno}


% Environment for analysis contributers
\newenvironment{atlascontribute}[1][3.5cm]
  {\section*{List of contributions to analysis}
   \begin{list}{}%
    {\setlength{\leftmargin}{#1}
     \setlength{\labelwidth}{#1}
     \addtolength{\leftmargin}{0.2cm}
     \setlength{\labelsep}{0.2cm}
     \setlength{\itemsep}{0.0cm}
     \renewcommand{\makelabel}[1]{##1 \hfill}}
  }
  {\end{list}
}

% Title page design
\newcommand{\maketitlepage}{%
  \null
  \thispagestyle{empty}
  \pagestyle{plain}
  \pagenumbering{arabic}
  \ifx\@draftversion\@empty\mbox{}%
  \else \flushright Draft version \@draftversion \\ 
  \fi
  \begin{center}
    \vspace*{-6mm}
    \includegraphics[width=3cm]{AT_atlaslogo} 
    \hfill 
    \begin{minipage}[b]{7cm}
      \vfill
      \begin{center}
        {\huge \bf \textsf{ATLAS NOTE}}%
        % ATLAS note number, if any 
        \ifx\@atlasnote\@empty 
        	% ATLAS reference code, if any and no note number given
        	\ifx\@refcode\@empty \vskip 4mm \mbox{}%
        	\else \vskip 4mm {\Large \@refcode} \vskip 0mm%
        	\fi
        \else \vskip 4mm {\Large \@atlasnote} \vskip 0mm%
        \fi
        % Date, if any
        \ifx\@date\@empty\mbox{}%	
        \else \vskip 2mm \@date%
        \fi
      \end{center}
      \vfill
    \end{minipage}
    \hfill
    \includegraphics[width=3cm]{AT_cernlogo}    
  \end{center}
  % Add line numbers to front page content 
  {%
  \ifx\@draftversion\@empty%
  \else\linenumbers
  \fi
  % Title, author(s)
  %\vskip 60\p@
  \vskip \AN@skipbeforetitle
  \begin{center}%
    {\Large\bf \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
  \end{center}\par
  \vfill
  % Abstract
  \if\AtlasAbstractText\@empty\mbox{}%
  \else%
  \begin{center}
    {\bfseries \abstractname}
    \quotation
    \setlength{\parindent}{0pt}\setlength{\parskip}{0.5ex}\noindent\AtlasAbstractText
    \endquotation
  \end{center}
  \fi
  \vfill
  % Submission details
  \submitted
  % Thanks
  \@thanks
  }%
  %\vfil\null%
}

% This some before-and-after code that surrounds the title page. It
% shouldn't need to be modified. I've pulled out the part the actually
% typesets the title page and placed it in the \maketitlepage command
% above.
\renewcommand\maketitle{%
  \begin{titlepage}%
    \let\footnotesize\small%
    \let\footnoterule\relax%
    \let \footnote \thanks%
    \maketitlepage%
    \let\thefootnote\relax\footnotetext{\copyright\ Copyright \the\year\ CERN for the benefit of the ATLAS Collaboration. \\ \indent \indent Reproduction of this article or parts of it is allowed as specified in the CC-BY-3.0 license.}
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \setcounter{page}{1}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  %\global\let\@author\@empty
  %\global\let\@date\@empty
  %\global\let\@title\@empty
  %\global\let\title\relax
  %\global\let\author\relax
  %\global\let\date\relax
  \global\let\and\relax
}


\AtBeginDocument{
  % If selected, generate ATLAS Cover Page
	\if@PreprintCover%
		\AC@PrintPreprintCover%
	\fi
  \if@DraftCover%
  	\AC@PrintAtlasCover%
  	\AC@PrintAtlasPage%
  \fi
  % Automatically generate title page
  \if@MakeTitle
  	\maketitle
  \fi
  % Add draft heading and line numbers
  \ifx\@draftversion\@empty%
  \else \linenumbers \draftheading 
  \fi
  % Hack for tikz (must be loaded here in order to avoid conflicts with graphicx user in \maketitle}
  % This hack does not appear to be necessary any more (ICB: 2014-08-26)
  %\if@usetikz \RequirePackage{tikz} \fi
  %\pagenumbering{arabic} % reset page numbering after title page
}

% That's all, folks!
\endinput
