# [Introduce]
Files, Manuals For Go Development Environment in Windows Operation System

# [First To Do]
1. Download Some Files For Golang Development
   * Golang Setup Archive File For MS Windows 64bit
      - https://dl.google.com/go/go1.10.3.windows-amd64.zip
   * Git Portable Version File
      - https://github.com/git-for-windows/git/releases/download/v2.18.0.windows.1/PortableGit-2.18.0-64-bit.7z.exe
   * Visual Studio Code IDE
      - https://code.visualstudio.com/docs/?dv=winzip

2. Also Download Some Files For MongoDB Server & GUI Tool
   * MongoDB Community Server ARchive File
       https://fastdl.mongodb.org/src/mongodb-src-r3.6.5.zip
   * Robot3T For MongoDB GUI Tool
       https://download.robomongo.org/1.2.1/windows/robo3t-1.2.1-windows-x86_64-3e50a65.zip

3. Unzip All Archive Files
   Unzip or Execute Archive Files Under Project Folder
   After Unzipping you'll find the following directories and files:
   ```
   (Project Folder)/
   ├── go/
   |   ├── api/
   |   ├── bin/
   |       ....
   |
   ├── mongodb-src-rx.x.x/
   |                  ├── buildscripts/
   |                  ├── debian/
   |                      ....
   |
   ├── PortableGit/
   |           ├── bin/
   |           ├── cmd/
   |               ....
   |
   ├── robot3t-x.x.x-windows-x86_64/
   |                    ....
   |
   └── VSCode-win32-x64-x.x.x/
   ```

4. Create Empty Folder For Project Source
   * For MongoDB : myMongoDB
   * For Go Project File : workspace
   * For Running Log File : log
   ```
   (Project Folder)/
   ├── go/
   ...
   ├── log/
   ├── myMongoDB/
   └── workspace/
   ```

5. Define User Environment Variables
   * Location : Control Panel -> System -> Advanced System Setting -> Environment Variables
   * Define User Environment For Using Go Path And Other Variables
     GOPATH   : (Project Folder)/(workspace)
     Path     : (Exists Path Value);%GOPATH%\bin
   * Define System Environment For Using Go ROOT And Git
     GOROOT   : (Project Folder)/go
     GIT_PATH : (Project Folder)/git
     Path     : (Exists Path Value);%GOROOT%\bin;%GIT_PATH%\bin;%GIT_PATH%\cmd;

6. Make Bat Execute File For Running MongoDB Server
  * Create Empty File And Edit
    (Project Folder Full Path)\mongodb-src-rx.x.x\bin/mongod --dbpath (Project Folder Full Path)\myMongoDB --port 51030 --logpath (Project Folder Full Path)\log\MongoDB.log --logappend

7. Running Visual Studio Code & Add Go Development Tools

8. Execute Bat File & Starting MongoDB

9. Voilà!                                     
                   
