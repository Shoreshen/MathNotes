PW = $(shell cat ~/文档/PW)
SERVER = $(shell cat ~/文档/SERVER)
BRANCH = $(shell git symbolic-ref --short HEAD)

test:
	@echo $(BRANCH)
commit: 
	git add -A
	@echo "Please type in commit comment: "; \
	read comment; \
	git commit -m"$$comment"

sync: commit
	git push -u origin $(BRANCH)

reset_hard:
	git fetch && git reset --hard origin/$(BRANCH)
