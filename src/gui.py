import tkinter 
from tkinter import filedialog


def upload_file(event=None):
    filename = filedialog.askopenfilename()
    print('Selected:', filename)


def start():
    program_window: tkinter.Tk = tkinter.Tk(screenName="Timetable Scheduler", baseName="Timetable Scheduler")
    button = tkinter.Button(text="Upload", foreground="red", command=upload_file)
    button.pack()
    program_window.mainloop()

if __name__ == "__main__":
    start()

