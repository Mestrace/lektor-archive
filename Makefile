LEKTOR?=poetry run lektor

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/content
OUTPUTDIR=$(BASEDIR)/output

GITHUB_PAGES_BRANCH=pages

publish: 
	$(LEKTOR) build -O $(OUTPUTDIR)

github: publish
	ghp-import -m "Generate Lektor site" -b $(GITHUB_PAGES_BRANCH) "$(OUTPUTDIR)"
	git push origin $(GITHUB_PAGES_BRANCH)


.PHONY: publish github