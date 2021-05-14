case $((RANDOM % 5)) in
  0 ) # 緑系統
    prompt='%F{#008000}❯%f%F{#3cb371}❯%f%F{#98fb98}❯%f '
    path_color=#3cb371
    ;;
  1 ) # 青系統
    prompt='%F{#1e90ff}❯%f%F{#87cefa}❯%f%F{#e0ffff}❯%f '
    path_color=cyan
    ;;
  2 ) # 赤系統
    prompt='%F{#ff0000}❯%f%F{#ff5555}❯%f%F{#ffaaaa}❯%f '
    path_color=#ff5555
    ;;
  3 ) # 黄系統
    prompt='%F{#ba8b40}❯%f%F{#fac559}❯%f%F{#ffe9e9}❯%f '
    path_color=#fac559
    ;;
  4 ) # 黒系統
    prompt='%F{#696969}❯%f%F{#a9a9a9}❯%f%F{#dcdcdc}❯%f '
    path_color=#a9a9a9
    ;;
esac

PURE_PROMPT_SYMBOL=$prompt
zstyle :prompt:pure:path color $path_color

