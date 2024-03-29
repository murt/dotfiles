(fn augroup! [name ...]
  `(do
     (nvim.cmd (.. "augroup " ,(tostring name) "\nautocmd!"))
     (do
       ,...)
     (nvim.cmd "augroup END")
     nil))

(fn executable! [name]
  `(> (nvim.eval (.. "executable('" ,(tostring name) "')")) 0))

(fn exists! [name]
  `(> (nvim.eval (.. "exists('" ,(tostring name) "')")) 0))

{
 : augroup!
 : executable!
 : exists!
 }
