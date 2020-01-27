HTTP_PORT=8080
REVEALJS_URL='https://github.com/hakimel/reveal.js/archive/3.8.0.tar.gz'

init:
	curl -L ${REVEALJS_URL}  | \
	tar xvz --strip-components=1 \
		--exclude "reveal.js-*/test" \
		--exclude "reveal.js-*/*.md" \
		--exclude "reveal.js-*/.gitignore" \
		--exclude "reveal.js-*/LICENSE" \
		--exclude "reveal.js-*/.travis.yml" \
		--exclude "reveal.js-*/*.json" \
		--exclude "reveal.js-*/demo.html" \
		--exclude "reveal.js-*/gruntfile.js" \
		--exclude "reveal.js-*/index.html"

start_http_server:
	(python3 -m http.server $(HTTP_PORT) 2>&1 >/dev/null) 2>&1 >/dev/null|| true &

stop_http_server:
	killall python3

present:
	echo "Opening http://localhost:$(HTTP_PORT)"
	chrome http://localhost:$(HTTP_PORT)

pdf:
	docker run --rm --volume '$(shell helper/wslpath --windows $(PWD)):/documents/' \
			--env https_proxy=host.docker.internal:3128 \
			--env https_proxy=host.docker.internal:3128 astefanutti/decktape \
					--size '297x210' \
					--chrome-arg=--allow-file-access-from-files \
					http://host.docker.internal:$(HTTP_PORT) \
					/documents/presentation-slides.pdf 

clean:
	rm -rf css js lib plugin
