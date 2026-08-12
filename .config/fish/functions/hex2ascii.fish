function hex2ascii
    echo $argv | string replace -a ' ' '' | xxd -r -p
    echo
end
