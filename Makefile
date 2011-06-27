EBIN_DIR := ebin
SRC_DIR := src
EXAMPLES_DIR := examples
INCLUDE_DIR := include
ERLC := erlc
ERLC_FLAGS := -W -I $(INCLUDE_DIR) -o $(EBIN_DIR) -pa $(EBIN_DIR)
ERL := erl
TEST_FLAGS := -noshell -pa $(EBIN_DIR) 
TEST_MODULES := spooky_test,spooky_test_session,spooky_test_template

all:
	@./rebar compile

clean:
	@./rebar clean

debug: 
	./rebar compile -C rebar.config.debug

examples: all
	@$(ERLC) $(ERLC_FLAGS) $(EXAMPLES_DIR)/*.erl

test: examples
	@./rebar eunit skip_deps=true


.PHONY: test examples
	
