
OPENRESTY_PREFIX=/usr/local/openresty

LUA_INCLUDE_DIR ?= $(OPENRESTY_PREFIX)/luajit/include/
LUA_LIB_DIR ?=     $(OPENRESTY_PREFIX)/lualib/resty
INSTALL ?= install

.PHONY: all test install

all: ;

install: all
	$(INSTALL) -d $(LUA_LIB_DIR)
	$(INSTALL) lib/resty/*.lua $(LUA_LIB_DIR)

test: all
	PATH=$(OPENRESTY_PREFIX)/nginx/sbin:$$PATH prove -I../test-nginx/lib -r t
