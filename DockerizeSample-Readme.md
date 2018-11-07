STEP-1
```
cd .\src\dockerizeWorkshop\ConsoleApp
dotnet restore
dotnet publish -c Release -o ./out
cd out
dotnet ConsoleApp.dll
```
```
Hello World!
```

STEP-2.1
```
cd .\src\dockerizeWorkshop
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
cd .\src\dockerizeWorkshop
docker build -t dockerizesample:build --target build .
docker images dockerizesample:build // Copy image id
docker run -i -t --entrypoint /bin/bash [imageID] // Run bash inside image 

// Run commands from step-1 inside image
ls
dotnet restore
dotnet publish -c Release -o ./out
cd out
dotnet ConsoleApp.dll
exit
```

STEP-2.3
```
cd .\src\dockerizeWorkshop

// Run and check the outputs
docker build -t dockerizesample .

// Run the same command again
// Check the outputs and note that cache has been used for multiple steps
docker build -t dockerizesample .  

// Add new package 
cd .\dockerizeWorkshop.ConsoleApp\
dotnet add package Newtonsoft.Json

// Run the same command above again and check the outputs
// note that cache hasn't been used after 'COPY' command 
// because .csproj file changed when we add new package  
docker build -t dockerizesample .

// Run the same comand above see cache has been used
docker build -t dockerizesample .
```

STEP-2.4
```
// Check Dockerfile. 'dotnet restore' command is commented to see effects
cd .\src\dockerizeWorkshop
docker build -t dockerizesample .

// Run the same command again to see cache has been used
docker build -t dockerizesample . 

// Change something in code: Hello World -> Hello \n World

// Run the below command again and note that packages restored again even the .csproj file didn't changed
docker build -t dockerizesample . 

// Uncomment the codes inside Dockerfile and run above steps again.
// Packages will not be restored when the code changes, because of layer caching.
```

STEP-3
```
cd .\src\dockerizeWorkshop
docker build -t dockerizesample .
docker run -it --rm --name dockerize_sample dockerizesample
```
```
Hello World!
```


STEP-4
```
cd .\src\dockerizeWorkshop
docker build -t dockerizesample:test --target testrunner  .
docker run -it --rm  dockerizesample:test
```
```
Total tests: 1. Passed: 1. Failed: 0. Skipped: 0.
Test Run Successful.
```

STEP-5
```
cd .\src\dockerizeWorkshop\WebApp
dotnet restore
dotnet publish -c Release -o ./publish
cd publish
dotnet WebApp.dll

curl http://localhost:5000/api/values
```
```
...
Content           : ["value1","value2"]
...
```

STEP-6
```
cd .\src\dockerizeWorkshop
docker build -f .\DockerfileWebApp -t webapp .
docker images webapp // Copy image id
docker run -i -t --entrypoint /bin/bash [imageID]  

// Run inside of image
ls
dotnet WebApp.dll
exit

// Run outside of image
docker run -it --rm -p 8000:80 webapp
curl http://localhost:8000/api/values
```
```
Content           : ["value1","value2"]
```

STEP-7
```
docker run -e ASPNETCORE_ENVIRONMENT=test -it --rm -p 8000:80 webapp

// Output:
...
Hosting environment: test
...
```
