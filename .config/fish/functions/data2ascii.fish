function data2ascii
    echo $argv \
    | string replace -r '^Data\(' '' \
    | string replace -r '\.\.\..*$' '' \
    | string replace -r '\)$' '' \
    | string replace -a ' ' '' \
    | xxd -r -p
    echo
end
