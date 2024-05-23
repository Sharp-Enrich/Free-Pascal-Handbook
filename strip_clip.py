import time
import pyperclip

old = ""
while True:
    content = pyperclip.paste()
    if content != old:
        print(f"处理前::{content}\n\n")
        old = content.strip().replace(" ","")
        print(f"处理后::{old}")
        pyperclip.copy(old)
    time.sleep(2)
'The text to be copied to the clipboard.'