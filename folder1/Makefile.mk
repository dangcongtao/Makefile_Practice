
CFLAGS += -I./folder1
VPATH += ./folder1

# folder1:
# 	@echo $(OBJ_DIR)
# # echo "Hello"
# gcc -o file1.o file1.cpp

OBJ += $(OBJ_DIR)/file1.o