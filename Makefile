 
-include folder1/Makefile.mk
-include app/Makefile.mk


NAME_MODULE	= run_file
OBJ_DIR = build_$(NAME_MODULE)

CFLAGS	+=	$(OPTIMIZE_OPTION)	\
		$(WARNNING_OPTION)	\
		-Winline			\
		-pipe				\
		-g					\
		-Wall				\

.PHONY: clean
.PHONY: run


# rule to build project
all: create $(OBJ_DIR)/$(NAME_MODULE)
run: $(OBJ_DIR)/$(NAME_MODULE)
	./$(OBJ_DIR)/$(NAME_MODULE)
clean:
	@rm -rf $(OBJ_DIR)



# link file .o to execute file
$(OBJ_DIR)/$(NAME_MODULE): $(OBJ)
	@echo ---------- START LINK CPP PROJECT ----------
	@echo "obj= " $(OBJ)
	@echo "@= " $@
	@echo "^= " $^
	@echo ""
	@echo gcc -o $@ $^ $(CFLAGS) $(CFLAGS)
	@gcc -o $@ $^ $(CFLAGS)

# build each files .c to .o
$(OBJ_DIR)/%.o: %.c
	@echo var: $<
	@$(CC) -c -o $@ $< $(CFLAGS)

# create folder build
create:
	@echo mkdir -p $(OBJ_DIR)
	@mkdir -p $(OBJ_DIR)
# gcc -c -Wall -I/folder1 main.c


