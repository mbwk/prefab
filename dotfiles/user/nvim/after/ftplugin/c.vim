setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal textwidth=80
setlocal expandtab

setlocal cindent
setlocal cinoptions=:0,l1,t0,g0,(0

syn keyword cOperator likely unlikely
syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64
syn keyword cType __u8 __u16 __u32 __u64 __s8 __s16 __s32 __s64


highlight default link LinuxError ErrorMsg

syn match LinuxError / \+\ze\t/     " spaces before tab
syn match LinuxError /\%>80v[^()\{\}\[\]<>]\+/ " virtual column 81 and more

" Highlight trailing whitespace, unless we're in insert mode and the
" cursor's placed right after the whitespace. This prevents us from having
" to put up with whitespace being highlighted in the middle of typing
" something
autocmd InsertEnter * match LinuxError /\s\+\%#\@<!$/
autocmd InsertLeave * match LinuxError /\s\+$/
