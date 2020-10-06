﻿% author: claude
% file name: 85808c71-5e9a-4bd2-9dc4-314cb6698065.w
% path: C:\Program Files (x86)\CWEB\bin
% date: Tue Nov 27 10:33:03 China Standard Time 2018
% effects: learning cweb
% environment:
% C:\Program Files (x86)\CWEB\bin\cwebmac.tex
% C:\Windows\System32\cmd.exe
% %%
% C:\Program Files (x86)\CWEB\bin\ctangle.exe
% C:\Program Files (x86)\CWEB\bin\cweave.exe
% %%
% usage:
% step 0:
% %% Win7 -> Start -> Search "cmd" -> cmd.exe
% step 1:
% %% C:\Windows\System32\cmd.exe
% %% cd C:\Program Files (x86)\CWEB\bin
% %% cmd.exe是基于Windows CE和Windows NT操作系统
% %% 包括Windows 2000 ， XP, Vista,7以及Windows8中，和Server 2003 ）
% %% 的命令行编译程序 。它类似于在MS - DOS和Windows 9X的系统中的 
% %% command. com，或Unix系统使用的shell。
% %%
% %% C:\Program Files (x86)\CWEB\bin\cweave.exe ca.w
% %% usage: DOS
% %% C:\Program Files (x86)\CWEB\bin>cweave.exe ca.w
% %% This is CWEAVE (Version 3.64e Win32)
% %% *1*2*3*4*5*6*7*8*9*10*11*12*13*14*15*16*17*18*19*20*21
% %% Writing the output file...*1*2*3*4*5*6*7*8*9*10*11*12*13*14*15*1
% %% 
% %% Writing the index...
% %% Done.
% %% (No errors were found.)
% %% 
% %% C:\Program Files (x86)\CWEB\bin>ctangle.exe ca.w
% %% This is CTANGLE (Version 3.64e Win32)
% %% *1*2*3*4*5*6*7*8*9*10*11*12*13*14*15*16*17*18*19*20*21
% %% Writing the output file (ca.c):
% %% Done.
% %% (No errors were found.)
% %% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%
% %% ca.tex ca.idx ca.scn ca.w
% step 2:
% %% WinEdt 7.0
% %% Command Line:
% %% tex.exe --src --interaction=errorstopmode "ca.tex"
% %% Startup Folder:
% %% C:\Program Files (x86)\CWEB\bin
% %% This is TeX, Version 3.14159265 (MiKTeX 2.9.6500 64-bit)
% %%
% %%%%%%%%%%%%%%%%%%%%%%%%%%
% ca.dvi ca.idx ca.log ca.scn ca.tex ca.toc ca.w
% %%%%%%%%%%%%%%%%%%%%%%%%%%
% step 3:
% %% Command Line: dvips.exe "ca.dvi"
% %% Startup Folder: C:\Program Files (x86)\CWEB\bin
% %% This is dvips(k) 5.997
% %% Copyright 2017 Radical Eyeish Software (www.radicaleye.com)
% %%%%%%%%%%%%%%%%%%%%%%%%%%
% step 4:
% %% Command Line: ps2pdf.exe "ca.ps"
% %% Startup Folder: C:\Program Files (x86)\CWEB\bin
% %%%%%%%%%%%%%%%%%%%%%%%%%%
% step 5:
% %% usage: Cygwin64 Terminal
% %% Administrator:USER-20180718ST /cygdrive/c/Program Files (x86)/CWEB/bin
% %% $ tex.exe ca.tex && dvips.exe ca.dvi && ps2pdf.exe ca.ps
% %% This is TeX, Version 3.14159265 (TeX Live 2018/W32TeX) (preloaded format=tex)
% %% (./ca.tex (./cwebmac.tex) *1 [1] *2 [2] *3 [3] *4 [4] *5 [5] *6 [6] *7 [7] *8
% %% [8] *9 [9] *10 [10] *11 [11] *12 [12] *13 [13] *14 [14] *15 [15] *16 [16] *17
% %% [17] *18 [18] *19 [19] *20 [20] *21 Index: (./ca.idx) [21] Section names:
% %% (./ca.scn) Table of contents: (./ca.toc) [0] )
% %% Output written on ca.dvi (22 pages, 16676 bytes).
% %% Transcript written on ca.log.
% %% This is dvips(k) 5.998 Copyright 2018 Radical Eye Software (www.radicaleye.com)
% %% ' TeX output 2019.04.29:0208' -> ca.ps
% %% <c:/texlive/2018/texmf-dist/dvips/base/tex.pro>
% %% <c:/texlive/2018/texmf-dist/dvips/base/texps.pro>.
% %% <c:/texlive/2018/texmf-dist/fonts/type1/public/amsfonts/cm/cmtt10.pfb>
% %% <c:/texlive/2018/texmf-dist/fonts/type1/public/amsfonts/cm/cmr7.pfb>
% %% <c:/texlive/2018/texmf-dist/fonts/type1/public/amsfonts/cm/cmti10.pfb>
% %% <c:/texlive/2018/texmf-dist/fonts/type1/public/amsfonts/cm/cmmi10.pfb>
% %% <c:/texlive/2018/texmf-dist/fonts/type1/public/amsfonts/cm/cmtex10.pfb>
% %% <c:/texlive/2018/texmf-dist/fonts/type1/public/amsfonts/cm/cmbx10.pfb>
% %% <c:/texlive/2018/texmf-dist/fonts/type1/public/amsfonts/cm/cmr8.pfb>
% %% <c:/texlive/2018/texmf-dist/fonts/type1/public/amsfonts/cm/cmr10.pfb>
% %% <c:/texlive/2018/texmf-dist/fonts/type1/public/amsfonts/cm/cmsy10.pfb>[1] [2]
% %% [3] [4] [5] [6] [7] [8] [9] [10] [11] [12] [13] [14] [15] [16] [17] [18] [19]
% %% [20] [21] [0]
% %% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%
% step 6:
% %% usage: Time Stamp
%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%

\datethis
@* Tue Nov 27 15:59:03 China Standard Time 2018.
This is the first line typed in the web format. This is \TeX\ by Knuth.

This is the second line.

\smallskip\rightline{--- Claude, November 2018}

@* The 1st C program. This is the Hello World program written in C language.

@p
#include <stdio.h> /* basic input/output routines: |fgets|, |printf| */
@#
int main() 
{
  printf("Hello, World! \n"); /* my first C program */
  return 0;
}

@* Walk within ten steps.
@.Walk@>
\smallskip\rightline{--- Claude, Fri Nov 30 15:36:51 China Standard Time 2018}

@*0 0-Upper and Lower case letter.

The lower case letters developed from the Middle Ages because they were \.{faster} and \.{easier} to wirte and easier to read. 

\.{https://www.reference.com/education/}

\.{difference-between-upper-lower-case-lettering-d8142c1707c29bae}

@*1 1-Letter case.

\.{https://en.wikipedia.org/wiki/Letter\_case}
Letter case.

\.{http://www.laurenscharff.com/courseinfo/SL03/email\_study.htm}

@*2 2-Gutenberg.
\.{http://www.gutenberg.org/}
Project Gutenberg offers over 58,000 free eBooks.

@*3 3-Sat Dec 01 14:06:41 China Standard Time 2018. Walk 19 steps.

\vfill

\mainfont Walk within 19 steps {\tt Anna} wow yeah!\hfill

\centerline{\titlefont Nice {\ttitlefont meal} wife cooked}

\centerline{\today} \vfill

Anna is able to walk 50 steps by herself.

@*4 4-subway is runnable in Guiyang.
Have a try.
@.subway@>

\smallskip\rightline{--- Claude, Fri Nov 30 15:36:51 China Standard Time 2018}

@*5 5-Kindness. Yuan Mingzhi Teacher said that it is not good for health to hold boiled water in plastic bottle.
@.kindness@>

sed is available for various systems.

\.{website ROMAN}: sed.sourceforge.net

\.{website Typewriter}: sedaceae.sourceforge.net/sed1line.txt

@*6 6-Tue 1/1/2019. Happy new year.
@.New Year@>

@*7 7-QW08. 

{\tt file name:} 808c71-5e9a-4bd2-9dc4-314cb6698065.pdf
@.808c71-5e9a-4bd2-9dc4-314cb6698065@>

{\tt title:} Bayesian Hierarchical Modeling for Integrating Low-Accuracy and High-Accuracy Experiments

{\tt author:} Peter Z. G. Qian (Department of Statistics University of Wisconsin Madison, WI 53706) and C. F. Jeff Wu (Georgia Institue of Technology)

{\tt abstract:} Standard practice when analyzing data from different types of experiments is to treat data from each type separately. 

@*8 8-TED talk. Have you ever had trouble remembering information? 
@.TED talk@>
But you know, sometimes my expression would be a bit like this. 

We've seen this before. We've got our tree. We could ask ourselves, "What does the tree mean?" 
It could mean lots of things, couldn't it? It might mean '\.{LIFE}'. It could mean 'GROWTH'. It could mean 'STABILITY'.
@.LIFE@>

If you get stuck on one, just look at the flip chart and pretend they're all there.
@.stuck@>
Just see if you can see them in your mind. You may want to put the numbers on. 

@c@=/* writing is very interesting; to express my great appreciate to Knuth. */@>

@*9 9-org-passwords-random-words. zoophoric-reasseverate-consimilarity-frankhearted-worse

\smallskip\rightline{--- Claude, Tue Nov 27 21:37:44 China Standard Time 2018}

@*10 Seventeen arches at sunset. When it's winteraceae solstice time in the Northern Hemisphere, the setting sun shines under the Seventeen-Arch Bridger of the Summer Palace in Beijing, causing this romantic glow.
In the 18th century, during the reign of the Qing dynasty of China,
Emperor Qianlong 
@.Qianlong@>
ordered the construction of this 1.1 square mile collection of gardens, lakes, and various structures including temples and small palaces.
Today it's one of Beijing's premier attractions and will be crowded today with visitorship headed to the bridge in time for sunset.
\smallskip\rightline{--- Claude, Sun Dec 22 18:02:16 2019 +0800}

@* German is West Germanic language that is mainly spoten in Central Europe. It is the most widely spoten and official or co-official language in Germany,
Austria, Switzerland, South Tyrol in Italy, the German-speaking
Community of Belgium and Liechtenstein.
It is one of the three official languages of
Luxembourg and a co-official language in the Opole Voivodeship
in Poland. The languages that are most similar to German
are the other members of the West Germanic language branch,
including Afrikaans, Dutch, English...

\smallskip\rightline{--- Claude, Mon Dec 23 08:30:50 2019 +0800}

@* Differences between LuaTeX, ConTeXtGarden and XeTeX. I'm interested in the differences
and commonalities between the "new" (La)TeX processors:
@.LuaTeX@>
@.XeTeX@>
@.ConTeXt@>
Personally, I've only used XeTeX so far and without having the time
to try out all three systems, I'm having a surprisingly hard time
setting them off from one each other.

As I understand it, these systems are actually very different in
some regards. So I'm explicityly asking for strengths and
weaknesses in every-day use (whatever that is), rather than
very special scenarios.

(I've already asked a similar question on Superscript User
some time ago.)

Both LuaTeX and XeTeX are UTF-8 engines for processing TeX
documents. This means that the input (.tex files) can contain
characters that with pdfTeX are difficult tu use directly.
Both can also use system fonts, again in contrast to pdfTeX.
However, the two are very different in approach.

XeTeX uses system-specific libraries to work.
This means that it is very easy to use 'out of the box'
for loading system fonts and other UTF-8 tasks.
Indeed, it was written for this purpose:
supporting languages, etc., that traditional TeX
struggles with. This makes for an easy to use
engine for end users, particularly if you use the
fontspec package on LaTeX. However, because things are
'farmed out' to the OS, there is a trade-off in
flexibility terms.

In contrast, LuaTeX has bigger aims. The idea is to
add a scripting language (Lua) to TeX, and to open
up the internals of TeX to this language. The result
is that a lot is possible, but it has to be
programmed in. There is growing LaTeX support
for LuaTeX: fontspec v2 supports it, and new
packages are being written to use more of the
new features.

At the moment, I'd use XeTeX for UTF-8 and font support,
unless I was after particular effects that only
LuaTeX does well (Arabic typography is a particular
challenge). The choice between XeTeX and LuaTeX is
'tight': both have advantages depending on your
exactamente requirements. (I'm on the LaTeX kernel
team, so as a programmer I'm very keen on exploring
LuaTeX.)

ConTeXt is not an engine, and so is in a slightly
different place here. ConTeXt is a format for TeX,
like LaTeX, but is newer and much larger.
ConTeXt Mark IV is a LuaTeX-only implementation.
The people behind ConTeXt are very active in
developing LuaTeX, and are using the new
features to extend TeX and what ConTeXt can do.
I've already pointed out that I'm working on
LaTeX, so of course I'd like to see new
features in LaTeX do the same. This is something
I and the other members of the LaTeX project are
working on.

The choice is slightly wrong. First two are TeX
engines while ConTeXt is a macro package
and as such should be compared with LaTeX
(in fact you can use both XeTeX and luaTeX
in ConTeXt, although using luatex is definitely
preferred). The best comparison of differences
between LaTeX and ConTeXt can be found in the
article by Berend de Boer's 'LaTeX in proper
ConTeXt'. To put it in rather simplistic
terms: ConTeXt attemps at giving cleaner interface
to control typography of the document
while retaining LaTeX's structure-oriented approach.

\smallskip\rightline{--- Claude, Mon Dec 23 12:43:45 2019 +0800}

@* FoxNews. Speaker Pelosi rips Trump on virus response, says as he 'fiddles, people are dying'.
De Blasio admonishes criticship not to 'look back' on his previous efforts to downplay coronavirus. Coronavirus deaths top 2,000 in US - just days after reaching 1,000 mark.

Coumo threatens lawsuit over Rhode Island crackdown on virus-fleeing New Yorkers. NJ governor balks at forced quarantine.

McCarthy details how \$2T stimulus will benefit small business, employees.

Mnuchin predicts post-pandemic economic recovery 'back to where we were beforehand'

Maryland Gov. Hogan says he's listening to scientists, not Trump, when it comes to coronavirus

Peter Navarro: Intent on preventing 'bottlenecks' of needed medical supplies, ventilators

\smallskip\rightline{--- Claude, Mon March 30 01:40:45 2020 +0800}

@* AMS-Journals.

AMS peer-reviewed journals are of the highest quality in mathematical research.

Our journals have been published since 1891 and cover a broadbrim range of mathematics.

Each journal is managed by editors who are prominent in their fieldsman, and each is unique in its offering of articles, book reviews, and reports.

In additional to publishing and distributing printed journals, the AMS offers searchable electronic versions that are available prior to the print versions.

When the journal is available in electronic format, the electronic version is considered the version of record.

Get information on how to subscribe to our journals or browse our current subscription rates.

New!
AMS journal contributors receive 15% off Charlesworth's specialist language editing and publication support services.

All articles submitted to journals published by the AMS are peer-reviewed.

The AMS has a single blind peer-view process in which the reviewers know who the authors of the manuscript are,
but the authors do not have access to the information on who the peer reviewers are.

Questions about the initial submission process should be directed to jml-initsub@@ams.org.

\smallskip\rightline{--- Claude, Wed April 01 18:21:57 2020 +0800}

@* Hillel Furstenberg and Grigorii Margulis win Abel Prize.

Posted on March 19, 2020 by Edward Dunne.
Hillel Furstenberg and Grigorii Margulis
have been announced as the winners of the 2020
Abel Prize.

You can read the official announcement here.
There is a news item about the prize on the AMS
website. Needless to say, they have made tremendous
contributions to mathematics.
In this post, I will point out a few things about Furstenberg
and Margulis from MathSciNet.

Note: Terry Tao has a short post on his blog,
which points to other, longer postscript he has made
mentioning Furstenberg or Margulis.

Note(added 3/19/2020): Kenneth Chang has an
informative article in the New York Times
about the Abel Prize and this year's prize
winners.

First, playfully, we can see that the MR
collaboration distance between them is 3.

So Furstenberg has a Margulis number of 3,
and, symmetrically, Margulis has a Furstenberg
number of 3.

The path between them is not unique.

Hillel Furstenberg. According to the
Mathematics Genealogy Project, Furstenberg
has 20 students and 171 descendants so far.
He has, himself, a student of Salomon Bochner
at Princeton. In MathSciNet, Furstenberg
has 67 publications and 3,4603 citations.
He has 17 coauthors, the most frequent of
which are Yitzhak Katznelson and
Benjamin Weiss.

Furstenberg's most cited work in MathSciNet
is his book based on his Porter Lectures at
Rice University in 1978, published as

MR0603625

Furstenberg, H.

Recurrence in
ergodic theory and combinatorial number
theory.

M. B. Porter Lectures. Princeton University
Press, N.J., 1981.xi+203 pp. ISBN:
0-691-08269-3

His most cited paper is

MR0213508

Furstenberg, Harry

Disjointness in ergodic theory,
minimalist sets, and a problem in
Diophantine approximation.

Math. Systems Theory 1 1967 1-49.

Furstenberg gave a series of CBMS
Lectures at Kent State University
in 2011, which were published as

MR3235463

Furstenberg, Hillel

Ergodic theory and fractal geometry.

CBMS Regional Conference Series in
Mathematics, 120. American Mathematical
Soceoty, Providence, RI, 2014. x+69
pp. ISBN: 978-1-4704-1034-6

My favorite paper by Furstenberg is

MR0068566

Furstenberg, Harry

On the infinitude of primes.

Amer. Math. Monthly 62 (1955), 353.

There is no review in MathSciNet,
but whatever we could have said would
have been longer than the paper, which
is a one paragraph proof of the infinitude
of primes using topology!

About the Abel Prize:

The Abel Prize is founded by the Norwegian
government and consists of MNOK 7.5
(USD 834,000).

The prize is awarded by the Norwegian
Academy of Science and Letters.

The choice of the Abel laureateship is based
on the recommendation of the Abel Committee,
which is composed of five internationally
recognized mathematicians.

Furstenberg and Margulis to share the Abel
Prize.

The Abel Prize for 2020 goes to Hillel
Furstenberg, Hebrew University of
Jerusalem, Israel and Gregory Margulis,
Yale University, New Haven, CT, USA,
for ''pioneering the use of methods
from probability and dynamics in group
theory, number theory and combinations.''

Hillel Furstenberg.

Hillel Furstenberg was born in Berlin in 1935.
His family was Jewish and they managed to
flee from Nazi Germany to the U.S. in 1939.
Sadly, his father did not survive the
journey, and Furstenberg grew up with his
mother and sister in an orthodox community
in New York.

Following a carrer in mathematics at
several universities in the U.S., he left
the country in 1965 for the Hebrew
University of Jerusalem, where he stayed
until his retirement in 2003.
Spending most of his career in Israel,
he helped estabilsh the country as a world
center for mathematics.

Furstenberg has won the Israel Prize
and the Wolf Prize.

When Hillel Furstenberg published one of
his early paper, a rumor circulated that
he was not an individual but instead a
pseudonym for a group of mathematicians.
The paper contained ideas from so many
different areas, surely it could not
possibly be the work of one man?

Gregory Margulis.
Gregory Margulis was born in Moscow in 1946.
In 1978, he won the Fields Medal at only 32
years old but was unable to receive the
medal in Helsinki since the Soviet
authorities refused him a visa.

He was one of the top young
mathematicians in the Soviet Union but was
unable to find a job at Moscow University
as he faced discrimination for being
of Jewish origin. Instead, he found
work at the Institute for Problems
in Information Transmission. During
the 1980s he visited academic institutions
in Europe and the U.S. before setting at
Yale in 1991, where he has been ever since.
Margulis is a winner of the Lobachevsky
Prize and the Wolf Prize.

From early on Gregory Margulis, born in
Moscow, showed a unique talent in
mathematics, but he was only allowed to
travel abroad in 1979 when Soviet academics
were given more personal freedoms.

Due to the ten years age differences and the
travel restrictions of the Soviet authorities,
the laureates did not formally collaborate,
however, they influenced each other's work.

Random walks.

Hillel Furstenberg and Gregory Margulis
invented random walk techniques to
inventigate mathematical objects such as
groups and graphs, and in so doing
introduced probabilistic methods to solve
many open problems in group theory,
number theory, combinatorics and graph
theory. A random walk is a path consisting
of a succession of random steps, and the
study of random walks is a central branch of
probability theory.

''Furstenberg and Margulis stunned the
mathematical world by their ingenious use of
probabilistic methods and random walks to
solve deep problems in diverse areas of
mathematics. This has opened up a wealthy
of new results, such as the existence
of long arithmetic progressions of prime
numbers, understanding the structure of
lattices in Lie groups, and the
construction of expander graphs with
applications to communication technology
and computer science, to mention a few,''
says Hans Munthe-Kaas, chair of the
Abel committee.

''The works of Furstenberg and Margulis
have demonstrated the effectiveness of
crossing boundaries between separate
mathematical disciplines and brought
down the traditional wall between pure and
applied mathematics,'' says Hans
Munthe-Kaas, chair of the Abel committee.

TheSIS Honouring of the 2020 Abel
Prize Laureates.

All events in connection to the Abel Prize
Week in May are cancelled due to the Corona
pandemic. The 2020 Abel Prize Laureates
Hillel Furstenberg and Gregory Margulis
will be honoured, together with the Abel
Prize Laureate(s) of 2021 during next
year's Abel Prize Ceremony, May 25 2021.

www.abelprize.no

Louis Nirenberg, Abel Prize laureate, dies at 94.

Nirenberg was the Abel Prize recipient
together with John F. Nash Jr. in 2015
and received the prize ''for striking
and seminal contributions to the theory of
nonlinear partial different equations
and its applications to
geometric analysis.''
(27.01.2020)

The Abel Prize is increased by 1.5
million NOK.
The board of the Norwegian Academy of
Science and Letters has decided to increase
the prize amount for the Abel Prize from
6 to 7.5 million NOK.

https://new.huji.ac.il/en

\smallskip\rightline{--- Claude, Wed April 01 19:37:25 2020 +0800}

@* ASQ.
ASQ.org will be completing routine
maintenance from 6 to 9 p.m. Tuesday,
April 7 (CDT), to make upgrades to our
system in an effort to better server
your needs.
Thank you for your patience.

ASQ is concerned about the growing
spread of COVID-19 (coronavirus).
This is an emerging,
rapidly evolking situation.
The health and safety of our memebers,
customers, instructor,
and stafford remains of utmost
importance.

Read ASQ's most up-to-date communication
on COVID-19.

@ Quality 4.0 Takes More Than Technology.
Quality 4.0 has an important role to
play in the factory of the future.
However, technology is only one element
in a broader quality transformation.

@ Conference Session Recordings Available.
Did you miss a session? Want to heard
your favorite session again?
Access The 2020 Lean and Six Sigma
Conference concurrent session
recordings!

Out of Crises: Business Process
Management Tools for Turbulent Times.

In this webinar, Tom Mosgaller sets the
foundation for an interactive
discussion of the factors that have made
the NIATx approach to improvement
successful.

Stay Connected With myASQ.

Share, learn, and network with leaders
and peer of the quality community.
Gain access to relevant solutions,
meaningful connections, and
interaction with like-minded individuals.

E-Learning Training Options.
Learn on your own using our web-based
instruction materials. 10% off all
web-based courses with Promo Code:
Spring10 now through April 30.

@ Explore. Engage. Experience.

@ Quality News Today Headlines.
For a full list of headlines, visit
the Quality News Today page.

@ Weekly Roundup: March 30-April 3, 2020.
How to Prepare for Major Supply Chain
Disruption.

Return on Artificial Intelligence: The
Challenge and the Opportunity.

Five Ways Augmented Intelligence Can
Improve Manufacturing.

Getting Ventilators to the People
Is a Problem Built for Blockchain.

Whait Is the Future for Industry 4.0
in the Post COVID-19 Paradigm?

Executing Product Safety Recalls
in the Age of COVID-19.

With memebers and customers in over 130
countries, ASQ brings together the
people, ideas and tools that make our
world work better.

ASQ celebrates the unique perspectives
of our community of members, staff and
those served by our society.
Collectively, we are the voice of
quality, and we increase the use
and impact of quality in response
to the diverse needs in the world.

@ AMS.
The Latest. Free AMS Mathematical
Modeling Books and Journals available
during COVID-19 pandemic.
March 27, 2020.

The Latest UPDATED Access MathSciNet
and other AMS content during COVID-19
closures. March 19, 2020.
updated April 1, 2020.

In response to current challenges that
colleges and universities face
as a result of the spread of COVID-19,
the American Mathematical Society is
offering libraries and institutions
additional support,
in line with recommendations in the
ICOLC Statement on the Global COVID-19
@.COVID-19@>
Pandemic and Its Impact on Library
Services and Resources.

The AMS is also participating in
the Copyright Clearance Center
Educational Continuity License
program, providing access to our
content for distance learing and
other educational users at no cost to
the user.

We are extending grace access for
content hosted on our platforms
(including MathSciNet) through the
end of May for our existing customers.
We will re-evaluate this timing as
needed.

As courses transition to online,
we can provide instructors with
complimentary electronic ''reserve''
copies of our textbooks for cases
in which students do not have access
to their print copies.

E-books purchased through the perpetual
access model on the AMS platform are
always available DRM-free with
unlimited simultaneous use.
In addition, we are partnering with
ProQuest to allow multi-user access
through mid-June to all e-books
purchased on their platforms.
Read ProQuest's statement.

We are providing remote access to all
our content, including MathSciNet.
In normal circumstances, this remote
access can be set up while campus or
while connected viana institution VPN
(in order to validate IP-based access).
We realize many students, faculty, and
researchers did not have an opportunity
to initiate this access before
leaving campus, so we have given
instructions to our library partners
on how patrons can connected to our
content.
Please contact your librarian for
assistance.

Libraries: if you have not received
instructions to share with your patrons,
please email us at cust-serv@@ams.org
or be in touch about any other of your
library's needs.

@* Inventiones mathematicae.
@.Inventiones mathematicae@>
ISSN: 0020-9910 (Print) 1432-1297 (Online)

OriginalPaper

A nonlinear Plancherel theorem with
applications to global well-posedness
for the defocusing Davey-Stewartson
equation and to the inverse
boundary value problem of Calderon,
Adrian Nachman, Idan Regev, Daniel
Tataru.

@ Nightmare Scenario.
Bill Gates, who warned in 2015 of
pandemic, tells how virus death toll
can be lower than predictions.

ANDY PUZDER: In coronavirus crisis,
Trump displays leadership Americans
expect and want.
Mark Cuban says coronavirus changes
'everything' in US - so leaders should
'step up'.
CHRISTENdie LIMBAUGH BLOOM: 7 ways to
developing the attribute you really
need in quarantine.

NORTHCOM commander says military is
treating pandemic like a campaign.

Pelosi, Schumer blast Trump pick to
oversee \$2T stimulus, call for
'urgent' House oversight.

Coronavirus patients delivered to
hospital ship Comfort in New York by
mistake: US officials.

PANDEMIC RX.
MICHAEL GOODWIN: Skip
blame game and focus on getting US through
crises.

SEAN HANNITY: The real reason
for New York's ventilators shortage.

Judge Jeanine: Coronavirus shutdown
rough but Trump 'working to get us back'.

NY blood center calls for plasma
donations from recovered
COVID-19 patients.

U.S. just in.
New Orleans area's coronavirus death rate
is highest in US, data show.

\smallskip\rightline{--- Claude, Sun April 05 23:04:48 2020 +0800}

@ Foxnews.
De Blasio cancels permits for Puerto
Rican Day, Pride, pro-Israel parades due
to coronavirus.
Australia joints US in seeking
probe of China amid questions over
coronavirus origin.

Supreme Court rules criminal jury verdicts
must be unanimous, overturning
decades-old precedent.

POLITICS just in.
De Blasio shredded for encouraging New
Yorkers to rat out social distancing
violators.

POLITICS just in.
Biden tops Trump in Novermber matchup,
but president leads on economy: poll.

U.S. just in.
Florida woman charged with violating
coronavirus order after
party at Airbnb rental led to shooting:
police.

U.S. just in.
Protesters rally against Washington's
coronavirus stay-at-home order:
'Give Me Liberty Or Give Me Covid 19'

U.S. just in.
Severe storms leave deadly mark on
South as tornadoes reported,
thousands without power

U.S. just in.
3 found dead in NYC hotel for discharged
coronavirus hospital patients.

U.S. just in.
Coronavirus crisis: US charites helping
millions in need fall apart as pandemic
looms.

World just in.
Israeli protesters accuse Netanyahu of
using coronavirus to erode democracy,
escape corruption charges.

WORLD just in.
Bosnians start hunger strike to protest
coronavirus quarantine.

WORLD just in.
Drones from China company cause spying
concerns, experts claim.

WORLD just in.
Hong Kong government using coronavirus
as 'golden opportunity' to crack down
on pro-democracy movement, arrested
activist claims.

WORLD just in.
American company using drones in
coronavirus fight in Africa,
hope to service to US.

\smallskip\rightline{--- Claude, Tue April 21 00:07:32 2020 +0800}

@ Quality Engineer Job Description,
Duties and Career Outlook.
Jan 06, 2020.

Quality engineering focuses on improving
the quality of products and services.
Explore a quality engineer job description,
including quality engineer responsibilities and
a quality engineer salary.

View Popular Schools.

What is your highest level of education?
Select your education level.

What subject are you interested in?
Engineering, Manufacturing Engineering,
Quality Control Technology.

Where do you want to attend class?
Shom me all schools.

What is a Quality Engineer?
Quality engineers ensure products and
services are of the highest quality.
They often evaluate products and services
through testing and statistical analysis.
Companies try to create new and improved
products and services; quality engineers
help in this process by checking for
efficiency and quality while still helping
the companies maintain competitive prices.
These engineers may work with the design,
development, and/or manufacturing process of
products.
Here we explore different aspects of a
quality engineer job description in more
detail.

What Does a Quality Engineer Do?
Quality engineers problem-solve and communicate
possible solutions to improve the quality of
a range of products. They also must work with
a wide range of staff members to discuss
improvements and ways to implementation
changes. Specific quality engineer
responsibilities may include tasks like:

Developing quality control systems.

Auditing quality systems.

Administering management information systems.

Finding ways to increase productivity.

Decreasing waste.

Optimizing resources.

Writing action plans.

Ensuring compliance with regulations and policies.

Conducting audits.

What is the Job Outlook for Quality Engineers?
The U.S. Bureau of Labor Stastistics (BLS)
did not report the specific job outlook for
quality engineers but did report a job outlook
for the broader category of industrial
engineers. These engineers had a job outlook of
8% from 2018 to 2028.
This outlook is faster than average and
equates to 23,800 new jobs in the field
over this same time span.

What is a Quality Engineer Salary?
PayScale.com reported that the median annual
salary for quality engineers was \$68,366
as of December 2019.
This salary could vary based on factors like
skill set, location, and work experience.
For example, PayScale.com also reported
that quality engineers in San Diego, CA,
made an average salary that was 22% higher
than the national average.
The website also reported that quality
engineers with 20 year or more of experience
made an average salary of \$84,497.

How Do You Become a Quality Engineer?
Quality engineers must have a background
in engineering.
To get started, associate's degree programs
in engineering are available,
but most engineers, including industrial and
quality engineers, need to have at least a
bachelor's degree.
Engineering colleges are available from
New York to California and are typically
offered at the bachelor's level.
Aspiring quality enigineers can pursue
a degree in industrial engineering.
Some industrial engineering programs
may offer a minor in quality engineering.

Although it may not be required,
master's degree programs in quality engineering
are more common.
These programs are usually offered as Master
of Science (MS) degrees and may be available
in online formats.
Some of these programs may also include topics
in management and might include course in areas
like:

Quality assurance.

Project management.

Lean manufacturing.

Product and process design.

Stastistics.

Experimental design.

Quality Engineer Certification.
The American Society for Quality (ASQ)
also provides Quality Engineer Certification
(CQE). To qualify, students need to have at
least 8 years of work experience.
Some work experience may be replaced with
education.
For example, those with a bachelor's degree
can waive 4 years of work experience,
while those with a master's degree can
waive 5 years of experience.
This professional certification may
allow quality engineers to advance
their careers and/or demonstrate
competency in decision-making and
quality evaluation and control.

https://www.tandfonline.com/toc/lqen20/current


\smallskip\rightline{--- Claude, Tue April 21 00:07:32 2020 +0800}

@* Share with the mathworks. Learn and Share.

M-x bjk-timestamp-format-claude-v5
@.Emacs web file Time Stamp@>
@.Time Stamp usage@>

Rosenkrieg mit Brad Pitt: Niederlage vor Gericht Fur Angelina Jolie.
@.web dot de@>

\smallskip\rightline{--- Claude, Tue October 06 15:15:46 2020 +0800}



@* Index. index