
# vim-unimpaired-extras

This plugin just add extras mapping to the existing one from
[vim-unimpaired][1]. It only focuses on plugin mappings. If the plugin is not
installed, then it's just ignored.

## List of plugins / mappings:

- [Git Gutter][2] : [og ]og yog enable/disable/toggle Git Gutter Highlight
- [Grammarous][3]: [g ]g go to next/previous error
- [vim-table-mode][4]: [ot ]ot yot enable/disable/toggle table mode
- [vim-mkdp][5]: [om ]om yom enable/disable/toggle Markdown preview
- [deoplete][6]: [o<tab> ]o<tab> yo<tab> enable/disable/toggle auto-completion
- [ALE][7]: [oa ]oa yoa enable/disable/toggle ALE checking
- [Goyo][8]: yoy toggle Goyo
- [Denite][8]: toggle hidden files for file/rec source

[1]: 
[2]: 
[3]: 
[4]: 
[5]: 
[6]: 
[7]: 
[8]: 

## Configure denite

To configure the command fore denite, put in your vim configuration:

  ```
  if (executable('ag'))
      " denite command parameter when showing hidden files
      let g:unimpaired_extra_denite_cmd_hidden = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
      " denite command parameter when not showing hidden files
      let g:unimpaired_extra_denite_cmd = ['ag', '--follow', '--nocolor', '--nogroup', '-g', '']
  endif
  ```
