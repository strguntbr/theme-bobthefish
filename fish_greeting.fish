function fish_greeting
    if command -s fortune >/dev/null
        if command -s cowsay >/dev/null
            test -e $OMF_PATH/themes/charliethefish/fish.cow
                and set cow -f $OMF_PATH/themes/charliethefish/fish.cow
            if command -s lolcat >/dev/null
                command fortune | cowsay $cow -n | lolcat
            else
                command fortune | cowsay $cow -n
            end
        else
            if command -s lolcat >/dev/null
                command fortune | lolcat
            else
                command fortune
            end
        end
    end
end
