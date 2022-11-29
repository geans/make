defaul_geometry='--width=500 --height=150'
type=$(zenity --info --title 'Tipo de download' \
      --text 'Quer baixar como ...' \
      --ok-label Vídeo \
      --extra-button Áudio $defaul_geometry)

if [[ $type = "Áudio" ]]
    then commmand='youtube-dl -x --audio-format mp3 --audio-quality 0'
    else commmand='youtube-dl'
fi

text=$(zenity --entry --text='Links para download separados com ";"' $defaul_geometry)
IFS=', ' read -r -a links <<< $text

local_save=$(zenity --file-selection \
    --title="Selecione pasta para salvar os downloads" --directory $defaul_geometry)
cd "$local_save"
echo "$local_save"

linkfile=tmp.txt
for link in ${links[@]}
do
    echo $link >> $linkfile
done

$commmand -a $linkfile |
    sed -u 's/\[download\]/# /' |
    sed -u 's/^.* \([0-9.]*\)%.*$/\1/' |
    zenity --progress \
        --title="Download" \
        --text="Downloading..." \
        --percentage=0 \
        $defaul_geometry \
        --auto-close
if [ "$?" = -1 ]
    then
        zenity --error \
          --text="Download cancelado." $defaul_geometry
    else
        rm $linkfile
        zenity --info \
            --text="Donwload terminado. Veja em: ${local_save}" $defaul_geometry
        opcao=$(zenity --info --title 'Renomear' \
            --text 'Quer remover finalzinho dos nomes dos arquivo? Serão removidos de todos do diretório: '$local_save \
            --ok-label Não \
            --extra-button Sim $defaul_geometry)
        if [[ $opcao = "Sim" ]]; then
            if [[ $type = "Áudio" ]]
                then 
                    ext=mp3
                    tam=20
                else 
                    ext=mkv
                    tam=16
            fi
            for name in *.$ext
            do
                new_name=${name:0:${#name}-$tam}'.$ext'
                mv "$name" "$new_name"
            done
        fi
        echo $opcao
        nemo "$local_save"
fi
