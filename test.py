import sys
import time
import tkinter as tk
import PySimpleGUI as sg
import subprocess

class StdoutRedirector:
    def __init__(self, text_widget):
        self.text_space = text_widget

    def write(self, string):
        self.text_space.insert("end", string)

def install_chrome():
    subprocess.call(['/bin/bash', './apps/update.sh'])
    subprocess.call(['/bin/bash', './apps/chrome.sh'])

def update():
    subprocess.call(['/bin/bash', './apps/update.sh'])

sg.theme('DarkAmber')  # Define o tema da interface

# Define o layout da interface
layout = [[sg.Text('Obrigado por utilizar o nosso script!')],
          [sg.Button('chrome'), sg.Button('Cancelar'), sg.Button('update'),]]

# Cria a janela com o layout definido
janela = sg.Window('Minha Tela', layout)

# Loop para ler eventos e atualizar a janela
while True:
    evento, valores = janela.read()
    if evento == sg.WIN_CLOSED or evento == 'Cancelar':  # Se o usuário fechar a janela ou clicar em Cancelar
        break
    if evento == 'chrome':  # Se o usuário clicar em OK
        install_chrome()
        break
    if evento == 'update':  # Se o usuário clicar em OK
        update()
        break
        
# Fecha a janela ao finalizar o loop
janela.close()
