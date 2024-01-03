+############################################################################################
+			FTGL : Free Type Atlas for OpenGL Font Drawing
+############################################################################################


# Windows
```
cmake -B build -DCMAKE_BUILD_TYPE=Release ../

MSBuild freetype.sln /p:Configuration=Release /p:Platform=x64
copy Release\freetype.lib ..\freetype.lib
```

# Mac (M1)
```
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_APPLE_SILICON_PROCESSOR=arm64 ../
Make
```