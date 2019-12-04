import sys

filename = sys.argv[1]
clusterfile = sys.argv[2]
clustername = sys.argv[3]

f = open(filename, 'r')
seq_name = ''
db = {}
for line in f:
	if line[0] == '>':
		seq_name = line.rstrip()
	else:
		db[seq_name] = line.rstrip()
f.close()

g = open(clusterfile, 'r')
g.readline()
h = open(clustername + '0.fa', 'w')
cluster_index = 1
for line in g:
	if line[0] == '>':
		h.close()
		h = open(clustername + str(cluster_index) + '.fa', 'w')
		cluster_index += 1
	else:
		tokens = line.split()
		seq_name = tokens[2].split('.')[0]
		h.write(seq_name + '\n')
		h.write(db[seq_name] + '\n')