#!/bin/bash
# Fred DENIS -- 28-Jun-2024 -- https://unknowndba.blogspot.com/
# List all ollama available models; indeed, I didnt find any commnand to do that; may be in the future: https://github.com/ollama/ollama/issues/2022
# Script created to help in https://unknowndba.blogspot.com/2024/06/getting-started-with-ollama.html
#
printf "%-25s: %s\n" "Model" "Description"
for i in {1..120}; do printf "%s" "-"; done; printf "\n"
curl https://ollama.com/library --silent | grep -E "/library/|max-w-md break-words" |\
    awk -F "[\"/]" '{  if ($3 == "library")              {model=$4};
                       if ($2 == "max-w-md break-words") {gsub(/[<>]/, "", $3);printf("%-25s: %s\n", model, $3) | "sort"}
                    }'
for i in {1..120}; do printf "%s" "-"; done; printf "\n"
