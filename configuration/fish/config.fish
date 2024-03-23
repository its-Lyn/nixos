export EDITOR=/usr/bin/nvim

function dlc -d "Quickly clear out Downloads"
    command rm -rf ~/Downloads/*
end

function classes -d "Show your timetable" --argument-names 'opt'
    if test -n $opt
        ~/.config/fish/scripts/FishTable $opt
    else
        ~/.config/fish/scripts/FishTable
    end
end