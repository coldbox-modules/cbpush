/**
 * This component provides a fluid interface for broadcasting events to a channel.
 */
component accessors="true" {

    /**
     * The Pusher service
     */
    property name="pusherService" inject="PusherService@cbpush";

    /**
     * Holds the connection name
     */
    property name="connectionName";
    
    /**
     * Holds the channel name
     */
    property name="channelName";

    /**
     * Holds the private channel name
     */
    property name="privateChannelName";
    
    /**
     * Provides fluid interface for setting the connection.
     * 
     * @name The name of the connection
     * @return Broadcast
     */
    function connection( required string name ) {
        setConnectionName( arguments.name );
        return this;
    }

    /**
     * Provides fluid interface for setting the channel.
     * 
     * @name The name of the channel
     * @return Broadcast
     */
    function channel( required string name ) {
        setChannelName( arguments.name );
        return this;
    }

    /**
     * Provides fluid interface for setting the private channel.
     * 
     * @name The name of the private channel
     * @return Broadcast
     */
    function private( required string name ) {
        setPrivateChannelName( arguments.name );
        return this;
    }
   
    /**
     * Publishes an event to the channel with the given data.
     */
    function publish( string event = "", array data = [] ) {
        // Publish the event using the pusher service.
        pusherService.publish( 
            connectionName = getConnectionName(),
            channelName    = !isNull( getPrivateChannelName() ) ? getPrivateChannelName() : getChannelName(),
            private        = !isNull( getPrivateChannelName() ) ? true : false,
            event          = arguments.event,
            data           = arguments.data
        );
    }
}