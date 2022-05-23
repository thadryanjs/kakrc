
set-option global tabstop 4

set-option global ui_options terminal_enable_mouse=true
set-option global ui_options terminal_assistant=cat

evaluate-commands %sh{
    plugins="$kak_config/plugins"
    mkdir -p "$plugins"
	[ ! -e "$plugins/plug.kak" ] && \
	    git clone -q https://github.com/andreyorst/plug.kak.git "$plugins/plug.kak"
	printf "%s\n" "source '$plugins/plug.kak/rc/plug.kak'"
}

plug "lePerdu/kakboard" %{
    hook global WinCreate .* %{ kakboard-enable }
}

plug "andreyorst/plug.kak" noload

plug "andreyorst/base16-gruvbox.kak" theme config %{
    colorscheme base16-gruvbox-dark-soft
}

colorscheme default

plug "andreyorst/kaktree" config %{
    hook global WinSetOption filetype=kaktree %{
	remove-highlighter buffer/numbers
	remove-highlighter buffer/matching
	remove-highlighter buffer/wrap
	remove-highlighter buffer/show-whitespaces
    }
    kaktree-enable
	set-option global kaktree_double_click_duration '0.5'
	set-option global kaktree_indentation 2
	set-option global kaktree_dir_icon_open  '▾ 📂'
	set-option global kaktree_dir_icon_close '▸ 📁'
	set-option global kaktree_file_icon      '⠀⠀📄'
	set-option global kaktree_tab_open_file true
}

