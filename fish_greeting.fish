function fish_greeting
    if command -s fortune >/dev/null
        if command -s cowsay >/dev/null
            set cow -f (dirname (status --current-filename))/fish.cow
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
