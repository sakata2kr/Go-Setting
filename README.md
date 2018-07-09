# Files, Manuals For Go Development Environment in Windows Operation System

# [First To Do]
1. Download Some Files For Golang Development
   * Golang Setup Archive File For MS Windows 64bit
      - https://dl.google.com/go/go1.10.3.windows-amd64.zip
   * Git Portable Version File
      - https://github.com/git-for-windows/git/releases/download/v2.18.0.windows.1/PortableGit-2.18.0-64-bit.7z.exe
   * Visual Studio Code IDE
      - https://code.visualstudio.com/docs/?dv=winzip

2. Also Download Some Files For MongoDB Server & GUI Tool
   * MongoDB Community Server Archive File
      - http://downloads.mongodb.org/win32/mongodb-win32-x86_64-2008plus-ssl-v3.6-latest.zip
   * Robot3T For MongoDB GUI Tool
      - https://download.robomongo.org/1.2.1/windows/robo3t-1.2.1-windows-x86_64-3e50a65.zip

3. Unzip All Archive Files
   * Unzip or Execute Archive Files Under Project Folder
     (go  ~ For Golang 64bit Archive File
      Git ~ For Portable Git Archive File (Extract automatic)
      MongoDB ~ For MongoDB Community Server Archive File
      robo3t  ~ For Robot3T Archive File
      VSCode  ~ For Visual Studio Code IDE Archive File)
   * After Unzipping you'll find the following directories and files:
   ```
   (Project Folder)/
   ├── go/
   |   ├── api/
   |   ├── bin/
   |       ....
   |
   ├── mongoDB/
   |   └── bin/
   |
   ├── Git/
   |   ├── bin/
   |   ├── cmd/
   |   ....
   |
   ├── robot3t/
   |   ├── imageformats
   |   ....
   |
   └── VSCode/
   ```

4. Create Empty Folder For Project Source
   * For MongoDB : (MongoDB)/myMongoDB
   * For Go Path Directory : (MongoDB)/GOPATH
   * For Running Log File : log
   ```
   (Project Folder)/
   ├── go/
   ...
   ├── MongoDB/
   |   ....
   |   ├── myMongoDB/
   |   └── myMongoDB/
   └── GOPATH/
   ```

5. Define User Environment Variables
   * Location : Control Panel -> System -> Advanced System Setting -> Environment Variables
     - Define User Environment For Using Go Path And Other Variables
        1) GOPATH   : (Project Folder)/GOPATH
        2) Path     : (Exists Path Value);%GOPATH%\bin
     - Define System Environment For Using Go ROOT And Git
        1) GOROOT       : (Project Folder)/go
        2) GIT_HOME     : (Project Folder)/git
        3) MongoDB_HOME : (Project Folder)/(MongoDB Path)
        3) Path         : (Exists Path Value);%GOROOT%\bin;%GIT_PATH%\bin;%GIT_PATH%\cmd;%MongoDB_HOME%\bin

6. Make Bat Execute File For Running MongoDB Server
  * Create Empty File And Edit
  ```
  mongod --dbpath %MongoDB_HOME%\myMongoDB --port 51030 --logpath %MongoDB_HOME%\log\MongoDB.log --logappend
  ```

7. Running Visual Studio Code & Add Go Development Tools

8. Execute Bat File & Starting MongoDB

9. Voilà!                                     
                   
