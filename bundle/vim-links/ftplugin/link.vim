" added by C Binz
" trying to get support for linking similar to vimwiki
" credit user "Kent" on StackOverflow
"TODO:  Implement syntax concealment - DONE
"	Check whether word under cursor is a link or not	

" outer if wrapper checks to make sure function is not being redefined
if !exists("*LinkForward")
		function! LinkForward()
			let g:fromFile=expand('%:p')
			let fnr= substitute(getline('.'),'^.*\[\[\([^\]]*\)\].*$',"\\1",'g')
			"let fn= substitute(getline('.'),'^.*\[\[\([^\]|]*\)\|\].*$',"\\1",'g') "modified
			let fn = substitute(fnr,"\|.*","","")
			echo fn

		
			" different rules for different filetypes - URLs and PDFs
			if (match(fn,"http") == 0)
				execute "silent !start explorer.exe ".fn
			elseif (match(fn,".pdf") != -1)
				execute "silent !start explorer.exe ".fn
			else " if unmatched, try editing as a text file, in a new tab
				execute "tabe ".fn
			endif
		endfunction
endif

nnoremap <cr> :call LinkForward()<cr>
