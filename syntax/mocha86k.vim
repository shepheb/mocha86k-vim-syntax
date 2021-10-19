" Vim syntax file
" Language:     Mocha 86k Assembler (Invented CPU, big brother to DCPU-16)
" Maintainer:   Braden Shepherdson <braden.shepherdson@gmail.com>
" Last Change:  July 8, 2020
" URL:          http://github.com/shepheb/mocha86k-vim-syntax
" Revision:     1


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


syn case match
syn keyword m86kTodo NOTE TODO FIXME XXX contained
syn case ignore

" any valid identifier
syn match m86kIdentifier "[a-z_][a-z0-9_]*"

" valid label
syn match m86kLabel      "^:[A-Z_][A-Z0-9_]*"
syn match m86kSubLabel   "^:\.[A-Z_][A-Z0-9_]*"
" me=e-1

" one character
syn match m86kASCII      "'.'"

" numbers:
" decimal
syn match m86kNumber     "\<[0-9]\+\>"
" hexadecimal
syn match m86kNumber     "\<0[Xx][0-9a-fA-F]\+\>"
syn match m86kNumber     "\$[0-9a-fA-F]\+\>"

" string in double quotes
syn region m86kString    start=+"+ end=+"+

" comments with special marks
syn match m86kComment    ";.*" contains=m86kTodo

" registers
syn keyword m86kRegister     a b c x y z i j pc sp ex ia
syn keyword m86kRegister     push pop peek pick

" instruction opcodes
syn keyword m86kOpcode NOP RFI BRK HLT ULK
syn keyword m86kOpcode SWPW PEAW NOTW NEGW JSRW LOGW LNKW HWNW HWQW HWIW
syn keyword m86kOpcode INTW IAQW EXTW CLRW PSHW POPW
syn keyword m86kOpcode SWPL PEAL NOTL NEGL JSRL LOGL LNKL HWNL HWQL HWIL
syn keyword m86kOpcode INTL IAQL EXTL CLRL PSHL POPL
syn keyword m86kOpcode BZRW BNZW BPSW BNGW BZRDW BNZDW BPSDW BNGDW
syn keyword m86kOpcode BZRL BNZL BPSL BNGL BZRDL BNZDL BPSDL BNGDL
syn keyword m86kOpcode SETW ADDW SUBW ANDW BORW XORW SHLW SHRW ASRW ADXW SBXW
syn keyword m86kOpcode SETL ADDL SUBL ANDL BORL XORL SHLL SHRL ASRL ADXL SBXL
syn keyword m86kOpcode MULW MLIW DIVW DVIW LEAW BTXW BTSW BTCW BTMW
syn keyword m86kOpcode MULL MLIL DIVL DVIL LEAL BTXL BTSL BTCL BTML
syn keyword m86kOpcode BRBW BRCW BREW BRNW BRGW BRAW BRLW BRUW
syn keyword m86kOpcode BRBL BRCL BREL BRNL BRGL BRAL BRLL BRUL
syn keyword m86kOpcode IFBW IFCW IFEW IFNW IFGW IFAW IFLW IFUW
syn keyword m86kOpcode IFBL IFCL IFEL IFNL IFGL IFAL IFLL IFUL

" directives
syn match m86kDirective       "\.define"
syn match m86kDirective       "\.def"
syn match m86kDirective       "\.sym"
syn match m86kDirective       "\.equ"
syn match m86kDirective       "\.org"
syn match m86kDirective       "\.fill"
syn match m86kDirective       "\.reserve"
syn match m86kDirective       "\.macro"
syn match m86kDirective       "\.include"


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_m86k_syntax_inits")
  if version < 508
    let did_m86k_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif


  HiLink m86kTodo               Todo
  HiLink m86kComment            Comment

  HiLink m86kLabel              Function
  HiLink m86kSubLabel           Label
  HiLink m86kString             String
  HiLink m86kASCII              Character
  HiLink m86kNumber             Number

  HiLink m86kOpcode             Statement
  HiLink m86kRegister           Type
  HiLink m86kDirective          PreProc

  delcommand HiLink
endif


let b:current_syntax = "mocha86k"

" vim: ts=8 syntax=vim
