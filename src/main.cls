\ProvidesClass{main}[]
\NeedsTeXFormat{LaTeX2e}
\def\@@ptsize{10pt}

\LoadClass[a4paper,\@@ptsize]{article}

% Dependences
\RequirePackage{fullpage}
\RequirePackage[margin=0cm]{geometry}
\RequirePackage[english]{babel}
\RequirePackage[utf8]{luainputenc}
\RequirePackage{fontspec}
\RequirePackage{url,parskip}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage[fixed]{fontawesome5}
\RequirePackage{titlesec}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{longtable}
\RequirePackage{etoolbox}
\RequirePackage{tikz}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{fancyhdr}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[absolute]{textpos}
\RequirePackage[UKenglish]{isodate}
\RequirePackage{xltxtra}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
%\RequirePackage{ifthen}

% Setup fancyhdr package
\fancyhf{}
\fancyhfoffset{0em}
\geometry{bottom=2cm}
\geometry{left=1.3cm}
\geometry{right=1.3cm}
\geometry{top=1cm}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}

% Define default accent colors
\definecolor{titleText}{HTML}{0000ff}
\definecolor{primaryText}{HTML}{464646}
\definecolor{primaryDarkText}{HTML}{989898}
\definecolor{secondaryText}{HTML}{777777}
\definecolor{secondaryDarkText}{HTML}{646464}
\definecolor{secondaryLightText}{HTML}{9a9a9a}
\definecolor{accentColor}{HTML}{1751A7}
\definecolor{linkcolor}{HTML}{3873BF}
\colorlet{profileIconColor}{accentColor!60}

% Define header icons
\newcommand{\iconProfile}{\faUser}
\newcommand{\iconCertificate}{\faCertificate}
\newcommand{\iconCoursework}{\faBook}
\newcommand{\iconEducation}{\faGraduationCap}
\newcommand{\iconExperience}{\faBriefcase}
\newcommand{\iconSkill}{\faMagic}
\newcommand{\iconSideProjects}{\faCubes}
\newcommand{\iconPublications}{\faFile}
\newcommand{\iconReference}{\faQuoteLeft}

\newcommand\horizontalLineLeft{
    \color{secondaryLightText}\noindent\rule{5cm}{0.4pt}
    \vspace{0.2cm}
}

\newcommand\horizontalLineRight{
    \color{secondaryLightText}\noindent\rule{12.5cm}{0.4pt}

    \vspace{0.2cm}
}

% Resume part title definition
\newcommand\sectionTitle[2]{
    \section{\texorpdfstring{\color{accentColor}#2\enspace \textsc{#1}}{#1}}
}

\newcommand\horizontalLine{
    \rule{\textwidth}{0.4pt}
}

% Setup CV sections
\titleformat{\section}{\Large\raggedright}{}{0em}{}[\titlerule]
\titlespacing{\section}{0pt}{2pt}{2pt}

% Configure list
\setlist[itemize,1]{label=\faAngleRight, nosep, leftmargin=2em, itemsep=0.2em}
\setlist[itemize,2]{label=\faAngleRight, nosep, leftmargin=1.5em, itemsep=0.2em}

% Setup Array : new column type
\newcolumntype{R}[1]{>{\hfill}m{#1}}

%Italian hyphenation for the word: ''corporations''
\hyphenation{im-pre-se}

% Setup fonts
\defaultfontfeatures{Ligatures=TeX}
\setmainfont[Color=primaryText, Path = fonts/calibri/]{calibri}
\setsansfont[Scale=MatchLowercase, Ligatures=TeX, Path = fonts/calibri/]{calibri}
\newcommand{\custombold}[1]{\color{primaryText}\fontspec[Path = fonts/calibri/]{calibri-bold}\selectfont #1 \normalfont}

%New length definition
\newlength{\fulllength}
\setlength{\fulllength}{17.8cm}

\newlength{\leftcolumnlength}
\setlength{\leftcolumnlength}{2.5cm}

\newlength{\rightcolumnlength}
\setlength{\rightcolumnlength}{\dimexpr(\fulllength-\leftcolumnlength)\relax}

\newcommand{\setleftcolumnlength}[1]{
    \setlength{\leftcolumnlength}{#1}
    \setlength{\rightcolumnlength}{\dimexpr(\fulllength-\leftcolumnlength)\relax}
}

\newcommand\link[2]{\color{linkcolor}\href{#1}{#2}\color{Black} }
\newcommand\important[1]{\textbf #1}

% Create a tag
% Usage: \cvtag{<tag label>}
\newcommand{\cvtag}[1]{%
    \tikz[baseline]\node[anchor=base,draw=secondaryLightText,rounded corners=0.6ex,inner xsep=1ex,inner ysep =0.55ex,text height=1.5ex,text depth=.25ex]{#1};
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
    \fancyfoot{}
    \fancyfoot[L]{#1}
    \fancyfoot[C]{#2}
    \fancyfoot[R]{#3}
}

% Header command
\newcommand{\headername}[1]{\color{primaryText}
\fontspec[Path = fonts/calibri/]{calibri-bold}\fontsize{24pt}{12pt}\selectfont\vspace{10pt}\raggedright {#1} \normalfont}

\titlespacing{\section}{0pt}{0pt}{0pt}

% Headings command
\titleformat{\section}{\color{titleText}
\fontspec[Path = fonts/calibri/]{calibri}\fontsize{16pt}{24pt}\selectfont\raggedright}{} {0em}{}

\newcommand{\SectionHead}[1]{\smash{\begin{tabular}{l}
                                        \hline #1 \\ \hline
\end{tabular}\hspace*{-\tabcolsep}}}

% Subeadings command
\titleformat{\subsection}{
    \color{primaryText}\fontspec[Path = fonts/calibri/]{calibri}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase
}{}{0em}{}
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsubsection}{0pt}{\parskip}{-\parskip}
\newcommand{\runsubsection}[1]{\color{primaryText}
    \fontspec[Path = fonts/calibri/]{calibri-bold}\fontsize{12pt}{12pt}\selectfont\bfseries {#1} \normalfont
}

% Descriptors command
\newcommand{\descript}[1]{\color{primaryText}\raggedright\hspace*{0pt}\hfill\vspace{3pt}\fontspec[Path = fonts/calibri/]{calibri-bold}\fontsize{11pt}{13pt}\selectfont{\vspace{2pt}#1\\}\normalfont}

% Item Description command
\newcommand{\itemdes}[1]{\color{primaryText}\raggedright\vspace{2pt}\fontspec[Path = fonts/calibri/]{calibri}\fontsize{11pt}{13pt}\selectfont {#1} \normalfont}

% Descriptors command
\newcommand{\descriptright}[1]{
    \color{primaryText}\raggedright\hspace*{0pt}\hfill\fontspec[Path = fonts/calibri/]{calibri-italic}\fontsize{11pt}{12pt}\selectfont{#1\vspace{2pt}\\}\normalfont}

% Descriptors datecolor
\newcommand{\datecolor}[1]{\color{secondaryDarkText}\raggedright\scshape\fontspec[Path = fonts/calibri/]{calibri-italic}\fontsize{11pt}{13pt}\selectfont {#1 } \normalfont}

% Section seperators command
\newcommand{\sectionsep}[0]{\vspace{4pt}}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{\vspace{-\topsep}\begin{itemize}
                                                 \itemsep1pt \parskip0pt \parsep0pt}{
\end{itemize}\vspace{-\topsep}}

\newcolumntype{E}{>{\raggedright\arraybackslash}p{\rightcolumnlength}}

% Define the 'referencees' environment
\newenvironment{referees}{%
    \par
    }{%
    \hfill \\
}

\newcommand*\refereeItem[5]{
  \hspace{1em}
  \begin{minipage}[t]{\dimexpr(\linewidth/3) - 3em}
    \begin{tabular}{>{}l >{}l}
      \multicolumn{2}{l}{\fontsize{12pt}{15pt}\textbf{#1}\vspace{2pt}}\\
      \multicolumn{2}{l}{\emph{\fontsize{11pt}{14pt}#2}, \textsc{\fontsize{11pt}{14pt}#3}\vspace{5pt}}\\
      \quad \color{secondaryDarkText}\faPhone & \fontsize{11pt}{14pt}#4\vspace{2pt} \\
      \quad \color{secondaryDarkText}\faEnvelope & \fontsize{11pt}{14pt}\href{mailto:#5}{#5} \\
    \end{tabular}
  \end{minipage}%
  }

% Profile item
\newcommand{\profileItem}[3]{
    \href{#3}
    {\custombold{\color{profileIconColor}\fontsize{14}{14}#1\quad \raisebox{2pt}{\color{primaryText}#2 \color{secondaryLightText}\fontsize{7}{7}\faLink}}}
    \vspace{4pt}
}

% Certificate item
\newcommand{\certificateItem}[2]{
    \href{#2}
    {\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase{#1} \raisebox{1pt}{\color{secondaryLightText}\fontsize{7}{7}\faLink}}
    \vspace{6pt}
}

% Education item
\newcommand{\educationItem}[4]{
    \datecolor{#1}
    \subsection{#2}\label{subsec:2}
    #3 \\
    #4 \\
    \vspace{8pt}
}

% List item one
\newcommand{\listItemOne}[6]{
    \datecolor{#1} \runsubsection{\href{#3}{#2 \raisebox{1pt}{\color{secondaryLightText}\fontsize{7}{7}\faLink}}}
    \descript{#4}
    \noindent\hspace{5em}%
    \begin{minipage}{0.85\textwidth\vspace{2pt}}
        #5
    \end{minipage} \\
    \noindent\hspace{5em}%
    \begin{minipage}{0.85\textwidth\vspace{2pt}}
        \footnotesize{\foreach \n in {#6}{\cvtag{\n} \vspace{0.3pt}}}
    \end{minipage}%
    \sectionsep
}

% Skill item
\newcommand{\skillItem}[2]{
    \runsubsection{#1 \vspace{5pt}} \\
    \begin{minipage}{\textwidth\vspace{2pt}}
        \footnotesize{\foreach \n in {#2}{\cvtag{\n} \vspace{0.3pt}}}
    \end{minipage}%
    \sectionsep
}

% link icon need to be universal
\newcommand{\linkIcon}{\raisebox{1pt}{\color{secondaryLightText}\fontsize{7}{7}\faLink}}

% Universal list
\newenvironment{universalList}{%
    \begin{longtable}{R{\leftcolumnlength}|E}
    }{%
    \end{longtable}
}

% Universal List item
\newcommand\universalListItem[8]{
    \datecolor{#1}    & \runsubsection{\href{#4}{#3 \linkIcon}\hspace*{0pt}\hfill\href{#6}{#5 \linkIcon}} \\*
    \datecolor{#2}    & \begin{minipage}[t]{\rightcolumnlength\vspace{4pt}}
                            #7
    \end{minipage} \\*
    &  \footnotesize{\foreach \n in {#8}{\cvtag{\n} \vspace{0.3pt}}} \\
}

\newcommand\emptySeparator{\multicolumn{2}{c}{}\\}
