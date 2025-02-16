diff:
	for script in vb*; do diff -u --color $$HOME/bin/$$script $$script; done

suck:
	for script in vb*; do cp $$HOME/bin/$$script $$script; done

