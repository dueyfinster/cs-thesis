# Lyx Thesis Template

## Intro

This is a collection LaTeX/BiBTeX styles that are meant to be used with [Lyx][] to compose a thesis. As Lyx uses LaTeX, your thesis will look really good!

See [Sample PDF][PDF] for an example of the Thesis (see credits for real submitted thesis from previous authors).  

## Installation

#### Installing on Mac OS X or Linux
Simply [download the zip file][RepoZip], extract it and run the script as described below. It will also ensure you have the correct tex distribution installed, if not it will advise to set it in `CSThesis.conf`

* **Make the install script executable**: `chmod +x install.sh`
* **Run the script as superuser**: `sudo ./install.sh`
* **Open Lyx** and click on **Tools**->**Reconfigure** and restart

###### What the Script does:

1. Downloads and installs Tex distribution
2. Copies the included template files to appropriate location
3. Refreshes the Tex Cache

#### Installing on Windows
Unfortunately a script is not available. If you know how to script this using batch files, please send a pull request! For now, the manual steps must be followed:

* Download and Install [MikTex]
* Copy `udthesis.sty` and `tcd-fancyhdr.sty` to `C:\Program Files\MiKTeX 2.5\tex\latex\base`
* Copy `udthesis.layout` to `C:\Documents and Settings\<Username>\Application Data\lyx1.4.x\layouts`
* run MiKTex->Settings, Refresh FNDB, update format
* open lyx and click on tool->reconfigure
* restart lyx
* Copy the `apa-good.bst` style to the directory `C:\Program Files\MiKTeX 2.7\bibtex\bst\apa-good`
* In Lyx run **Tools** > **TeX Information** > **Rescan** and make sure apa-good appears on the list.

## Explanation of Project Files

##### LyX Files (in `Thesis` folder):

* `Thesis.lyx` - the main file that includes the chapters, bibliography etc (Generate the PDF from this). **First you should update your name, college etc**. Do this in Lyx: **Document** > **Settings** > **LaTeX Preamble**
* `acknowledgements.lyx` - acknowledgements
* `appendix*.lyx` - all the appendices
* `chapter*.lyx` - all the chapters 
* `thesis.bib` - all the bibliography references (open this with a BibTeX editor [I recommend [Bibdesk][] ])
* `related_publications.lyx` - related publications
* `images/uni_logo.png` - the logo of your university (also can put all other images in this folder)


## Credits
* Neil Grogan ([Institute of Technology, Blanchardstown][ITB] [Dublin, Ireland] and [University College Dublin, Ireland][UCD])
* [Eamonn Linehan][] ([National University of Ireland, Maynooth][NUIM]) - [Thesis][ELThesis]
* Jesus Bisbal ([University of Dublin, Trinity College][TCD]) - [Thesis][JBThesis]
* [Dinesh Das][] ([University of Texas, Austin][UTA]) - [Thesis][DDThesis]
* [Piet van Oostrum][] ([University of Utrecht, The Netherlands][UU])
* [Lyx][] Developers

## Copyright 
Copyright &copy; 1994-2013 of the respective authors as detailed in the files. Free usage and modification is permitted as long as copyright notice is kept.

[RepoZip]: https://github.com/dueyfinster/CSThesis/zipball/master/
[Lyx]: http://www.lyx.org
[PDF]: Sample.pdf
[Eamonn Linehan]: http://www.dsg.cs.tcd.ie/~linehane/lyx/
[ITB]: http://www.itb.ie
[UCD]: http://www.ucd.ie
[TCD]: http://www.tcd.ie
[NUIM]: http://www.nuim.ie
[Dinesh Das]: mailto:ddas@cs.utexas.edu
[Piet van Oostrum]: mailto:piet@cs.ruu.nl
[UTA]: http://www.utexas.edu
[UU]: http://www.uu.nl
[MikTex]: http://www.miktex.org/download
[Bibdesk]: http://bibdesk.sourceforge.net/
[JBThesis]: http://www.tara.tcd.ie/bitstream/2262/797/1/TCD-CS-2001-03.pdf
[ELThesis]: https://www.cs.tcd.ie/publications/tech-reports/reports.04/TCD-CS-2004-46.pdf
[DDThesis]: http://www.cs.utexas.edu/ftp/predator/das-thesis.pdf
