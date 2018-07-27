+ `fileinput`  *可通过管道，传入文件名的方式传入参数*

```py
#filein.py
import fileinput

with fileinput.input() as f_input:
    for line in f_input:
        print(line, end='')


# ls|filein.py
# filein.py aa.txt
```

+ `raise SystemExit('It failed!')` *退出终端*

```py
#等同于
import sys
sys.stderr.write('It failed!\n')
raise SystemExit(1)
```

+ `argparse`

```py
import argparse
parser = argparse.ArgumentParser(description='Search some files')

parser.add_argument(dest='filenames',metavar='filename', nargs='*')

parser.add_argument('-p', '--pat',metavar='pattern', required=True,
                    dest='patterns', action='append',
                    help='text pattern to search for')

parser.add_argument('-v', dest='verbose', action='store_true',
                    help='verbose mode')

parser.add_argument('-o', dest='outfile', action='store',
                    help='output file')

parser.add_argument('--speed', dest='speed', action='store',
                    choices={'slow','fast'}, default='slow',
                    help='search speed')

args = parser.parse_args()

# Output the collected arguments
print(args.filenames)
```

+ `subprocess.check_output()`

```py
import subprocess
out_bytes = subprocess.check_output(['netstat','-a'])
out_text = out_bytes.decode('utf-8')
```