
SRC_DIR = src
LIB_DIR = lib
OBJ_DIR = obj
DOC_DIR = doc
BIN_DIR = bin
RES_DIR = res

VULKAN_HEAD = C:\VulkanSDK\1.2.131.2\Include
VULKAN_LIB = C:\VulkanSDK\1.2.131.2\Lib\vulkan-1.lib
 
GLFW_HEAD = C:\glfw-3.3.2.bin.WIN64\include
GLFW_LIB = -L C:\glfw-3.3.2.bin.WIN64\lib-mingw-w64 -lglfw3 -lgdi32 -lopengl32

GLM_HEAD = C:\glm

all: $(BIN_DIR)\vulkan

$(BIN_DIR)\vulkan: $(OBJ_DIR)\vulkan.o
	c++ -std=c++17  $(OBJ_DIR)\vulkan.o $(GLFW_LIB) $(VULKAN_LIB) -o $(BIN_DIR)\vulkan

$(OBJ_DIR)\vulkan.o: $(SRC_DIR)\vulkan.cpp
	c++ -std=c++17 -c $(SRC_DIR)\vulkan.cpp -I $(VULKAN_HEAD) -I $(GLFW_HEAD) -I $(GLM_HEAD) -o $(OBJ_DIR)\vulkan.o

