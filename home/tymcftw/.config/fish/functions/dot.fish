function dot
    if test (count $argv) -eq 0
        begin
            cd /

            for i in (dotfiles ls-files)
                printf '%s' (dotfiles -c color.status=always status $i -s | sed "s#$i##")
                printf '¬/%s¬\e[0;33m%s\e[0m\n' \
                    $i \
                    (dotfiles -c color.ui=always log -1 --format='%s' -- $i)
            end
        end | column -t --separator='¬' -T 2
    else
        dotfiles $argv
    end
end
