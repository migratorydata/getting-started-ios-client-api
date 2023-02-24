This is an example of an iOS client app which uses MigratoryData Client API for iOS.

This iOS example application connects securely to the MigratoryData server running at the address `127.0.0.1:8800`. It subscribes to the subject `/server/status` and displays the messages received for that subject.

If you don't have a MigratoryData server installed on your machine but there is docker installed you can run the following command to start MigratoryData server, otherwise you can download and install the latest version for your os from [here](https://migratorydata.com/downloads/migratorydata-6/).

```bash
docker pull migratorydata/server:latest
docker run -d --name my_migratorydata -p 8800:8800 migratorydata/server:latest
```

You can edit the source code of this example application to connect to MigratoryData installation and subscribe to your subjects.

#### REQUIREMENTS

* MigratoryData server 6.0.1 or later

#### BUILD REQUIREMENTS

 * XCode 6.x or later
 * iOS SDK 8.x or later
