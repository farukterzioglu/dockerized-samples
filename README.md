//ENGINEAPP
//engineapp uygulamasının release & test build i
docker build -f .\build\engineApp\Dockerfile -t engineapp:latest . 
docker build -f .\build\engineApp\Dockerfile -t engineapp:test --target testrunner  .
 
//engineapp run & test
docker run --rm engineapp
docker run --rm -it engineapp:test


//STREAMER
//streamer release & test build i
docker build -f .\build\streamer\Dockerfile -t streamer:latest .
docker build -f .\build\streamer\Dockerfile -t streamer:test --target testrunner  .

//streamer run & test (streamer testi fail oluyor. CI da test edebilmek için)
docker run --rm streamer
docker run --rm -it streamer:test


//CORE 
docker build -f .\build\core\Dockerfile -t core:latest .
docker build -f .\build\core\Dockerfile -t core:package .

docker run --rm -it core:package



//Test result outout ???
docker run --rm -v C:\Logs\Streamer\TestResults:/app/test/TestResults streamer:test
docker run --rm -v "$(pwd)"/Logs/Streamer/TestResults:/app/test/TestResults dotnetapp:test
