# pubsub-connect

Pubsub-coonect is  Google Cloud Messaging library written in ruby. Google Cloud Messaging (GCM) is a free service that enables developers to send messages between servers and client apps. This includes downstream messages from servers to client apps, and upstream messages from client apps to servers.

For example, a lightweight downstream message could inform a client app that there is new data to be fetched from the server, as in the case of a "new email" notification. For use cases such as instant messaging, a GCM message can transfer up to 4kb of payload to the client app. The GCM service handles all aspects of queueing of messages and delivery to and from the target client app.

# Architectural Overview
A GCM implementation includes a Google connection server, an app server in your environment that interacts with the connection server via HTTP or XMPP protocol, and a client app.

[logo]: https://developers.google.com/cloud-messaging/images/notifications-overview.svg

Here's how these components interact:

 - Google GCM Connection Servers accept downstream messages from your app server and send them to a client app. The XMPP connection server can also accept messages sent upstream from the client app and forward them to your app server. For more information, see About GCM Connection Server.
 - On your App Server, you implement the HTTP and/or XMPP protocol to communicate with the GCM connection server(s). App servers send downstream messages to a GCM connection server; the connection server enqueues and stores the message, and then sends it to the client app. If you implement XMPP, your app server can receive messages sent from the client app.
 - The Client App is a GCM-enabled client app. To receive and send GCM messages, this app must register with GCM and get a unique identifier called a registration token. For more information on how to implement the client app, see the documentation for your platform.

# GCM Configuration

### To create a new Topic
https://cloud.google.com/pubsub/reference/rest/v1/projects.topics/create#body.aspect

### To get GCM API KEY
https://developers.google.com/cloud-messaging/registration#how-uninstalled-client-app-unregistration-works

# Setup

## With ruby 
```sh
$>gem install pubsub-connect
```

```ruby
require "pubsub"

PUBSUB_TOPIC = "News"
GCM_API_KEY="AIzaSyCS5u7FCyAdujJwaIzAIfYUpi_nTEr-hgc"

msg_wrapper = {data: {message: "hello world"}}
n = Pubsub::Notification.new(msg_wrapper)
n.broadcast
```
## With rails 
Add this gem into Gemfile
```
 gem "pubsub-connect"
```

```sh
$>bundle install
```
define following constant in rails initializer or environment file
```ruby
PUBSUB_TOPIC = "News"
GCM_API_KEY="AIzaSyCS5u7FCyAdujJwaIzAIfYUpi_nTEr-hgc"
```
in some ruby file

```ruby
msg_wrapper = {data: {message: "hello world"}}
n = Pubsub::Notification.new(msg_wrapper)
n.broadcast
```



