# My_DevEnv
Este repositório contém a descrição de como eu configuro o meu ambiente de desenvolvimento para programar em python 


## Primeiros passos :computer:
#### Este passo a passo está sendo feito para o ubuntu 24.04 LTS, mas muitos comandos podem ser replicados no windows ou Mac
- siga as intruções de instalação do professor Otávio Miranda do curso de python 3 que se encontra no seguinte link:
- https://gist.github.com/luiz-oberto/bcf532a8307e0487dccd1f337daefa64

## Em seguida, A configuração suprema do VSCode!
Tendo seguido os primeiros passos para instalar as ferramentas que você vai precisar para programar em python, vamos agora configurar o VSCode para tornar nosso ambiente ainda mais agradável!
### Pesquise e instale as seguintes extensões:
1. Python ( o da microsoft) 
2. code runner
3. om dracula
4. material icon theme

Agora copie o código de **settings_base.json** encontrado neste repositório e cole no seu **settings.json**, ou então aproveita que tá por aqui mesmo e copia daqui desse prompt:

~~~json
{
    "explorer.compactFolders": false,
    "code-runner.runInTerminal": true,
    "code-runner.clearPreviousOutput": true,
    "code-runner.executorMap": {
        "python": "clear; python -u",
    },
    "code-runner.ignoreSelection": true,
    "workbench.colorTheme": "OM Theme (Default Dracula Italic)",
    "workbench.iconTheme": "material-icon-theme",
    "python.defaultInterpreterPath": "python",
}
~~~

Outra coisa que lhe pode ser muito útil: atalhos! Pega essa configuração e coloque no keybinding.json
~~~json
[
    {
        "key": "ctrl+;",
        "command": "editor.action.commentLine",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "ctrl+/",
        "command": "-editor.action.commentLine",
        "when": "editorTextFocus && !editorReadonly"
    }
]
~~~


#### É isso aí meu mano, agora é só ser feliz!
tá abençoado, meu fi! SHINE!
