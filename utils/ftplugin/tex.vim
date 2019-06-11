setlocal iskeyword+=:,-
setlocal makeprg=pdflatex\ -file-line-error\ -interaction=nonstopmode\ %

let g:auto_save = 1  " enable AutoSave on Vim startup for tex file - preview without explicit save

iab <buffer> ,b \begin{
iab <buffer> ,e \end{

iab <buffer> ,i \item

" More abbreviations...
