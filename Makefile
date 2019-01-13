run: build
	docker run -it \
   					 -p 8053:8053/udp \
						 -p 8053:8053/tcp \
						 --cap-drop=ALL \
						 -v ${PWD}/config/:/etc/knot/ \
						 -v ${PWD}/zonefiles/:/var/lib/knot/zones/ \
						 knot-testbed

build:
	docker build -t knot-testbed .
