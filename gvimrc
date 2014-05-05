"set fileformat
set fileformats=mac,unix,dos

set showtabline=2
set noimdisableactivate
if has('kaoriya')
  set transparency=25
endif
if has("mac")
  set guifont=Menlo\ Regular:h13
  set guifontwide=Osaka−等幅:h12
elseif has("unix")
  set guifont=Meslo\ LG\ S:h11
endif
set antialias
set lines=50
set columns=145
