(fn augroup! [name ...]
  `(do
     (nvim.cmd (.. "augroup " ,(tostring name) "\nautocmd!"))
     (do
       ,...)
     (nvim.cmd "augroup END")
     nil))

{
 : augroup!
 }
