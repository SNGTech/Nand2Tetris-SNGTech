text = """@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D"""

for l in text.splitlines():
    print(f"\"{l}\\n\" \\")