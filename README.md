This repository contains the source code of the MigratoryData iOS example application.

There are two example applications, one written in Objective-C and the other in Swift, each demo application in its own directory.

This iOS example application connects securely to the MigratoryData server running at the address `127.0.0.1:8800`. It subscribes to the subject `/server/status` and displays the messages received for that subject.

If you don't have a MigratoryData server installed on your machine but there is docker installed you can run the following command to start MigratoryData server, otherwise you can download and install the latest version for your os from [here](https://migratorydata.com/downloads/migratorydata-6/).

```bash
docker pull migratorydata/server:latest
docker run -d --name my_migratorydata -p 8800:8800 migratorydata/server:latest
```

You can edit the source code of examples application to connect to MigratoryData installation and subscribe to your subjects.

#### REQUIREMENTS

* MigratoryData server 6.0.16 or later

#### BUILD REQUIREMENTS

 * XCode 12.x or later
 * iOS SDK 12.x or later
