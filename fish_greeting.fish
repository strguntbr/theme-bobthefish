function fish_greeting
    if command -s fortune >/dev/null
        if command -s cowsay >/dev/null
            if command -s lolcat >/dev/null
                command fortune | cowsay -f $OMF_PATH/themes/charliethefish/fish.cow -n | lolcat
            else
                command fortune | cowsay -f $OMF_PATH/themes/charliethefish/fish.cow -n
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
