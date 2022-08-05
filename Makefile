OBJ_DIR = build_run_file
FOLDER1_DIR = folder1

.PHONY: all
.PHONY: run


create: 
	@mkdir -p $(OBJ_DIR)
lib:
	@echo "build libs"
	$(CC) -c -o $(OBJ_DIR)/file1.o $(FOLDER1_DIR)/file1.c

main:
	@echo "build main file"
	$(CC) -g -c -o $(OBJ_DIR)/main.o app/main.c -I $(FOLDER1_DIR)

all: create main lib
	@echo " ---------- link .o files ---------- "
	$(CC) -o $(OBJ_DIR)/runfile $(OBJ_DIR)/main.o $(OBJ_DIR)/file1.o 

run:
	@echo " ---------- run file ---------- "
	$(OBJ_DIR)/runfile

clean:
	@rm -rf $(OBJ_DIR)