%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LaTeX Resume Template - Class File
% https://github.com/rohit-gohri/resume-template
%
% This class file defines the structure and design of the template. For content see the `resume.tex` file.
%
% Version: v1.0.0 (2020/05/04)
% By Rohit Gohri (https://rohit.page)
% 
% 
% Based On:
% Medium Length Professional CV
% 
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
% 
% Copyright (C) 2010 by Trey Hunner
% 
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
% 
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2020/05/03 v1.0.0 Resume Class]

\LoadClass[10pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{babel}
\usepackage[stretch=10]{microtype}
\usepackage[sc]{mathpazo} % Required for `Palatino` font
\usepackage{hyperref} % Required for creating links (\href)
\usepackage{xcolor}
\usepackage{trimspaces} % Required for triming variable values (https://tex.stackexchange.com/a/484290)
\usepackage{fontawesome} % Required for icons. List of available icons at http://ctan.imsc.res.in/fonts/fontawesome/doc/fontawesome.pdf
\usepackage{datetime} % Required for custom date formatting
\usepackage[left=0.6in,top=0.2in,right=0.6in,bottom=0.2in]{geometry} % Required for setting Document margins

\pagestyle{empty} % Suppress page numbers

\hypersetup{
    colorlinks={true}, %Colours links instead of ugly boxes
    linkcolor={red!50!black}, %Colour of internal links
    citecolor={blue!50!black}, %Colour of citations
    % urlcolor={blue!40!black}, %Colour for external hyperlinks
    urlcolor={black}, %Colour for external hyperlinks
    pdftitle={Resume}
}

\newdateformat{monthyeardate}{
  \shortmonthname[\THEMONTH]. \THEYEAR
}
\newdateformat{yeardate}{
  \THEYEAR
}

\newcommand{\fmtdate}[3][1]{%
\unskip{% group start to scope date name
\ifthenelse{\equal{#2}{}}{% If the 2nd arg is not provided only print the year
    \newdate{anon}{#1}{1}{#3}%
    \yeardate\displaydate{anon}%
}{%
    \newdate{anon}{#1}{#2}{#3}%
    \monthyeardate\displaydate{anon}%
}}}

\newcommand{\draft}[2][false]{%
{% group start to scope date name
    % From: https://tex.stackexchange.com/a/243879
    \newbox\anonvhbox
    \newboolean{IncludeAnonItem}
    \setboolean{IncludeAnonItem}{#1}

    \setbox\anonvhbox\vbox{%
    #2
    \unskip\unpenalty\unpenalty}

    \ifthenelse{\boolean{IncludeAnonItem}}{
    \unvbox\anonvhbox
    }{ }
}}

% NOTE: Deprecated
\newcommand{\showif}[2][false]{\draft[#1]{#2}}

% Normalized italics
\newcommand{\nem}[1]{\normalfont \em #1}

\newcommand{\tab}[1]{\hspace{.2667\textwidth}\rlap{#1}}
\newcommand{\itab}[1]{\hspace{0em}\rlap{#1}}

\newcommand*{\trim}[1]{%
  \trim@spaces@noexp{#1}%
}

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and links
% 
% Defines the commands to set variables and sets empty defaults
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} 
\def \@name {}

\def \setCity#1{\def\@getCity{#1}} 
\def \@getCity {}

\def \setEmail#1{\def\@getEmail{\trim{#1}}}
\def \@getEmail {}

\def \setPhoneNum#1{\def\@getPhoneNum{#1}} 
\def \@getPhoneNum {}

\def \setLinkedIn#1{\def\@getLinkedIn{\trim{#1}}} 
\def \@getLinkedIn {}

\def \setGithub#1{\def\@getGithub{\trim{#1}}}
\def \@getGithub {}

\def \setWebsite#1{\def\@getWebsite{\trim{#1}}} 
\def \@getWebsite {}

% NOTE: Deprecated
\def \setCustomLink#1{\def\@getWebsite{\trim{#1}}} 

\def \setPdfKeywords#1{\def\@getPdfKeywords{#1}} 
\def \@getPdfKeywords {}

\def \setPdfSubject#1{\def\@getPdfSubject{#1}} 
\def \@getPdfSubject {}

\def \linkSeparator {$\diamond$} % Set default separator to a diamond

\def \printLinks {
  \begingroup
    \def \\ {\linkSeparator\ }
    \centerline{%
      \@ifundefined{@getCity}{}{%
        \faMapMarker \hspace{0.2mm} \@getCity}
      \@ifundefined{@getEmail}{}{%
        \href {mailto:\@getEmail}
            {\faEnvelope \hspace{0.2mm} \@getEmail}}
      \@ifundefined{@getLinkedIn}{}{%
        \href {https://linkedin.com/in/\@getLinkedIn}
            {\faLinkedin \hspace{0.2mm} \@getLinkedIn}}
      \@ifundefined{@getGithub}{}{%
        \href {https://github.com/\@getGithub}
            {\faGithub \hspace{0.2mm} \@getGithub}}
      \@ifundefined{@getWebsite}{}{%
        \href {https://\@getWebsite}
            {\faLink \hspace{0.2mm} \@getWebsite}}
    }
  \endgroup
  \par
  \smallskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document

  \hypersetup{
    pdftitle={ \@name's Resume },
    pdfauthor={ \@name <\@getEmail> },
    pdfsubject={ \@getPdfSubject },
    pdfkeywords={ \@getPdfKeywords }
}

  \printname % Print the name specified with \name
  \printLinks
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \MakeUppercase{\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newcommand{\rSubsectionHeading}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
  \ifthenelse{\equal{#4}{} \AND \NOT \equal{#3}{}}{ % If 3 args are provided
    {\bf #1, {\normalfont \em #3}} \hfill {#2}
  }{
    \ifthenelse{\equal{#3}{}}{% If 2 args are provided
      {\bf #1} \hfill {#2} % Bold company name and date on the right
    }{ % If 4 args are provided
      {\bf #1} \hfill {#4} % Bold company name and location
      \\ {\em #3} \hfill {\em #2} % Italic job title and date on the right
    }\unskip
  }\unskip
}{}

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
  \rSubsectionHeading{#1}{#2}{#3}{#4}
  \smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
  \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
}{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\bigskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section
