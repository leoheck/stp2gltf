SRCS:= main.cpp LoadStep.cpp LoadFace.cpp Accessor.cpp
OBJS:= $(patsubst %.cpp, %.o, $(SRCS))

OCC_LIB = \
	-lTKBin \
	-lTKBinL \
	-lTKBinTObj \
	-lTKBinXCAF \
	-lTKBO \
	-lTKBool \
	-lTKBRep \
	-lTKCAF \
	-lTKCDF \
	-lTKernel \
	-lTKFeat \
	-lTKFillet \
	-lTKG2d \
	-lTKG3d \
	-lTKGeomAlgo \
	-lTKGeomBase \
	-lTKHLR \
	-lTKIGES \
	-lTKLCAF \
	-lTKMath \
	-lTKMesh \
	-lTKMeshVS \
	-lTKOffset \
	-lTKPrim \
	-lTKShHealing \
	-lTKSTEP209 \
	-lTKSTEP \
	-lTKSTEPAttr \
	-lTKSTEPBase \
	-lTKSTL \
	-lTKTObj \
	-lTKTopAlgo \
	-lTKVRML \
	-lTKXCAF \
	-lTKXDEIGES \
	-lTKXDESTEP \
	-lTKXMesh \
	-lTKXml \
	-lTKXmlL \
	-lTKXmlTObj \
	-lTKXmlXCAF \
	-lTKXSBase \
	-lTKService \
	-lTKOpenGl \
	-lTKV3d

CFLAGS:= -g -I/usr/include/opencascade -I./microjson -L./microjson

.PHONY: all test clean distclean

all: stp2gltf

stp2gltf: microjson $(OBJS)
	g++ $(CFLAGS) -o $@ $(OBJS) $(OCC_LIB) -lmicrojson


microjson:
	git clone https://github.com/vxmdesign/microjson.git
	cd ./microjson && make static

%.o: %.cpp
	g++ $(CFLAGS) -c $^

clean:
	rm -f *.o
	rm -f stp2gltf
	rm -f *.gltf
	rm -f *.bin

distclean: clean
	rm -rf microjson

test:
	./stp2gltf test.stp test.gltf test.bin

install_dependencies:
	sudo apt install -y flex
	sudo apt install -y bison
	sudo apt install -y libocct-foundation-dev
	sudo apt install -y libocct-ocaf-dev
	sudo apt install -y libocct-data-exchange-dev
