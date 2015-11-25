syn keyword cUserType contained 

syn match cStructType "\(\s*struct\s*\)\@<=\(\I\i*\s*\)" 

hi cUserType guifg=#00FFFF
hi link  cStructType cUserType 
