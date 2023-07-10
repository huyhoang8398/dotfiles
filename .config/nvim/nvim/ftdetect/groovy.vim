augroup filetypedetect
    autocmd BufRead,BufNewFile *.jenkins set filetype=groovy
    au BufNewFile,BufRead Jenkinsfile setf groovy
augroup END
