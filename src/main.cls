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
\definecolor{PrimaryDarkText}{HTML}{989898}
\definecolor{secondaryText}{HTML}{777777}
\definecolor{secondaryDarkText}{HTML}{646464}
\definecolor{secondaryLightText}{HTML}{9a9a9a}
\definecolor{accentcolor}{HTML}{1751A7}
\definecolor{linkcolor}{HTML}{3873BF}
%\colorlet{symbolcolor}{accentcolor!85}

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
    \section{\texorpdfstring{\color{accentcolor}#2\enspace \textsc{#1}}{#1}}
}

\newcommand\horizontalLine{
    \rule{\textwidth}{0.4pt}
}

% Setup CV sections
\titleformat{\section}{\Large\raggedright}{}{0em}{}[\titlerule]
\titlespacing{\section}{0pt}{2pt}{2pt}

% Configure list
\setlist[itemize,1]{label=\faAngleRight, nosep, leftmargin=2em}
\setlist[itemize,2]{label=\faAngleRight, nosep, leftmargin=1.5em}

% Setup Array : new column type
\newcolumntype{R}[1]{>{\hfill}m{#1}}

%Italian hyphenation for the word: ''corporations''
\hyphenation{im-pre-se}

% Setup fonts
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Color=primaryText, Path = fonts/calibri/]{calibri}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/calibri/]{calibri}
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
    \tikz[baseline]\node[anchor=base,draw=PrimaryDarkText,rounded corners=0.5ex,inner xsep=1ex,inner ysep =0.55ex,text height=1.3ex,text depth=.25ex]{#1};
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
\titleformat{\subsection}{\color{primaryText}
\fontspec[Path = fonts/calibri/]{calibri}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase}{}{0em}{}
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsubsection}{0pt}{\parskip}{-\parskip}
\newcommand{\runsubsection}[1]{\color{primaryText}
\fontspec[Path = fonts/calibri/]{calibri-bold}\fontsize{12pt}{12pt}\selectfont\bfseries {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{\color{primaryText}\raggedright\hspace*{0pt}\hfill\vspace{3pt}\fontspec[Path = fonts/calibri/]{calibri-bold}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}

% Item Description command
\newcommand{\itemdes}[1]{\color{primaryText}\raggedright\vspace{2pt}\fontspec[Path = fonts/calibri/]{calibri}\fontsize{11pt}{13pt}\selectfont {#1} \normalfont}

% Descriptors command
\newcommand{\descriptright}[1]{\color{primaryText}\raggedright\hspace*{0pt}\hfill\fontspec[Path = fonts/calibri/]{calibri-italic}\fontsize{11pt}{12pt}\selectfont {#1 \\} \normalfont}

% Descriptors datecolor
\newcommand{\datecolor}[1]{\color{secondaryDarkText}\raggedright\scshape\fontspec[Path = fonts/calibri/]{calibri-italic}\fontsize{11pt}{13pt}\selectfont {#1 } \normalfont}

% Section seperators command
\newcommand{\sectionsep}[0]{\vspace{4pt}}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{\vspace{-\topsep}\begin{itemize}
                                                 \itemsep1pt \parskip0pt \parsep0pt}{
\end{itemize}\vspace{-\topsep}}

% Define the 'referencees' environment
\newenvironment{referees}{%
    \par
    }{%
    \hfill \\
}

\newcommand*\referee[5]{
  \hspace{1em}
  \begin{minipage}[t]{\dimexpr(\linewidth/3) - 3em}
    \begin{tabular}{>{}l >{}l}
      \multicolumn{2}{l}{\textbf{#1}}\\
      \multicolumn{2}{l}{\emph{#2}, \textsc{#3}}\\
      \quad \faEnvelope & #4 \\
      \quad \faPhone & #5 \\
    \end{tabular}
  \end{minipage}%
  }

% Define the 'experiences' environment
\newcolumntype{E}{>{\raggedright\arraybackslash}p{\rightcolumnlength}}

\newenvironment{experiences}{%
    \begin{longtable}{R{\leftcolumnlength}|E}
    }{%
    \end{longtable}
}

% Render an experience in the experiences environment
% Usage:
% \experience
%  {<End date>}      {<Title>}{<Enterprise>}{<Country>}
%  {<Start date}     {
%                      <Experience description (Could be a list)>
%                    }
%                    {<Technology list>}
\newcommand\experience[7]{
    \textbf{#1}    & \textbf{#2, \textsc{#3}, #4}                                \\*
    \textbf{#5}    & \begin{minipage}[t]{\rightcolumnlength}
                         #6
    \end{minipage}                                        \\*
    & \footnotesize{\foreach \n in {#7}{\cvtag{\n}}}    \\
}

\newcommand\emptySeparator{\multicolumn{2}{c}{}\\}