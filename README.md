
This is a quick and dirty tool program to convert .step files to .gltf files.

I created it for my own needs and I will update it as the need for new features crop up. I do not pretend that it captures every .step file correctly. I'm not sure it uses the opencascade libraries correctly. Their documentation is... challenging. I will not add a feature for you, but if you would like to contribute I'm down. 

This requires the `liboce` developer libraries for opencascade.

This also requires microjson which requires flex and bison. Microjson is automatically cloned and built as part of the build process

Outside of that it should have basically no other library requires and compiles under c++98. I the following dependencies will do it:

```bash
sudo apt-get install liboce-ocaf-dev flex bison
```

To build:
```
make
```

To run:
```
stp2gltf stp gltf bin
```

`stp` is the input step file
`gltf` is the ouput gltf json file
`bin` is the output binary file
