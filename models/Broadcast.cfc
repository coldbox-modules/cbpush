component accessors="true" {

    /**
     * Holds the module settings
     */
    property name="settings" inject="coldbox:moduleSettings:cbpush";

    /**
     * Holds the connection name
     */
    property name="connectionName";
    
    /**
     * Holds the channel name
     */
    property name="channelName";
    
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
     * Publishes an event to the channel with the given data.
     */
    function publish( string event = "", array data = [] ) {

        // Ensure the connection exists
        if ( isNull( getConnectionName() ) || !connectionExists( getConnectionName() ) ) {
            throw( type="MissingConnection", message="The connection '" & getConnectionName() & "' does not exist." );
        }

        // Ensure the channel has been specified
        if ( isNull( getChannelName() ) || !getChannelName().len() ) {
            throw( type="MissingChannel", message="You must specify a channel using .channel( name ) or .private( name )." );
        }

        // Ensure event name
        if ( !arguments.event.len() ) {
            throw( type="MissingEvent", message="You must specify an event name when calling .publish( event='eventName' )." );
        }

    }


    /**
     * Checks if the given connection exists.
     * 
     * @name The name of the connection
     * @return boolean
     */
    function connectionExists( required string name ) {
        return getSettings().keyExists( "connections" ) && getSettings().connections.keyExists( arguments.name );
    }
}