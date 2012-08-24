all: html css


html:
	jade -P index.jade

css:
	lessc style/presentation.less style/presentation.css

clean:
	rm -f index.html style/presentation.css

watch-css:
	nodemon --exec "lessc" css/presentation.less css/presentation.css

watch-html:
	jade -P -w index.jade
