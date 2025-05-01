diff:
	for script in vb*; do diff -u --color $$script $$HOME/bin/$$script; done

suck:
	for script in vb*; do cp $$HOME/bin/$$script $$script; done

spit:
	for script in vb*; do cp $$script $$HOME/bin/$$script; done
