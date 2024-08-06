
public class Client : NSObject, MigratoryDataListener, ObservableObject {
 
    let client = MigratoryDataClient()
        
    var status: String = " - "
    var message: String = " - "
    
    var count = 1
    
    public func start() {
        client?.setLogLevel(.LOG_TRACE)
        
        client?.setEncryption(false)
        
        client?.setEntitlementToken("some-token")
        
        client?.setListener(self)
                
        client?.setHttpHeader("myheader", value: "myvalue")
                        
        client?.setServers(["127.0.0.1:8800"])
        
        client?.subscribe(["/server/status"])
        
        client?.connect()
    }

    public func stop() {
        client?.disconnect()
    }
    
    public func publish() {
        let message = MigratoryDataMessage("/server/status", content:"content - \(count)" )
        
        do {
            try ExceptionHandler.catchException {
                self.client?.publish(message)
            }
        } catch {
            print("Unexpected error: \(error.localizedDescription).")
        }

        count+=1
    }

    public func resume() {
        do {
            try ExceptionHandler.catchException {
                self.client?.resume()
            }
        } catch {
            print("Unexpected error: \(error.localizedDescription).")
        }
    }

    public func pause() {
        do {
            try ExceptionHandler.catchException {
                self.client?.pause()
            }
        } catch {
            print("Unexpected error: \(error.localizedDescription).")
        }
    }

    // MigratoryDataListener onMessage
    nonisolated public func onMessage(_ message: MigratoryDataMessage?) {
        let content = message?.getContent()
        let subject = message?.getSubject()
        
        print("Message : \(subject ?? "") - \(content ?? "")")

        DispatchQueue.main.async{
            self.changeMessages(newMessage: "\(subject ?? "") - \(content ?? "")")
         }
    }

    // MigratoryDataListener onStatus
    nonisolated public func onStatus(_ status: String?, info: String?) {
        print("status: \(status ?? "") || info: \(info ?? "")")
        
        DispatchQueue.main.async{
            self.changeStatus(newStatus: "\(status ?? "") - \(info ?? "")")
         }

    }

    func changeStatus(newStatus: String) {
        status = newStatus
        self.objectWillChange.send()
    }
    
    func changeMessages(newMessage: String) {
        message = newMessage
        self.objectWillChange.send()
    }

}
