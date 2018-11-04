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

STEP-2.2
```
cd .\src\consoleAppNetCore
docker build -t dockerizesample .
docker images dockerizesample // Copy image id
docker run -i -t --entrypoint /bin/bash [imageID] // Run bash inside image 

// Run commands from step-1 inside image
ls
cd consoleAppNetCore.ConsoleApp/
dotnet restore
dotnet publish -c Release -o ./out
cd out
dotnet consoleAppNetCore.ConsoleApp.dll
exit
```

STEP-2.3
```
cd .\src\consoleAppNetCore

// Run and check the outputs
docker build -t dockerizesample .

// Run the same command again
// Check the outputs and note that cache has been used for multiple steps
docker build -t dockerizesample .  

// Add new package 
cd .\consoleAppNetCore.ConsoleApp\
dotnet add package Newtonsoft.Json

// Run the same command above again and check the outputs
// note that cache hasn't been used after 'COPY' command 
// because .csproj file changed when we add new package  
docker build -t dockerizesample .

// Run the same comand above see cache has been used
docker build -t dockerizesample .
```