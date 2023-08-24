@echo off
echo "Make sure Docker is running..."
echo "Installing application..."
docker pull ghcr.io/fevanmanshoven/docker-implicite-test:main >nul 2>&1
echo "Starting application..."
docker run -it -d -p 5000:80 --name ImpliciteTestWindows ghcr.io/fevanmanshoven/docker-implicite-test:main >nul 2>&1
echo "Running application..."
docker start ImpliciteTestWindows >nul 2>&1
echo "Loading..."
timeout 5 >nul 2>&1
echo "Press enter to open application. Keep this open while using the app."
pause >nul 2>&1
start http://localhost:5000
echo "Press enter to exit application. Keep this open while using the app."
pause >nul 2>&1
docker stop ImpliciteTestWindows
