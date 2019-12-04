import sys

filename = sys.argv[1]
dest = sys.argv[2]

f = open(filename, 'r')
d = open(dest, 'w')

count = True
for line in f:
	if count:
		s = line.rstrip()
		d.write(s[-1] + s[:-1] + '\n')
	else:
		d.write(line)
	count = count == False

f.close()
d.close()