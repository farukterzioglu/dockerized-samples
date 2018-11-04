STEP-1
```
cd .\src\consoleAppNetCore\consoleAppNetCore.ConsoleApp
dotnet restore
dotnet publish -c Release -o ./out
cd out
dotnet consoleAppNetCore.ConsoleApp.dll
```
```
Hello World!
```

STEP-2.1
```
cd .\src\consoleAppNetCore
docker build -t dockerizesample .
docker images dockerizesample // Copy image id
docker run -i -t --entrypoint /bin/bash [imageID] // Run bash inside image 

// Inside image
pwd // See the current directory
dotnet // See available options 
exit // Exit the image 
```