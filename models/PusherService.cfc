component accessors="true" singleton {

    /**
     * Holds the module settings
     */
    property name="settings" inject="coldbox:moduleSettings:cbpush";

    /**
     * Checks if the given connection exists.
     * 
     * @name The name of the connection
     * @return boolean
     */
    function connectionExists( required string name ) {
        return getSettings().keyExists( "connections" ) && getSettings().connections.keyExists( arguments.name );
    }

    /**
     * Publishes an event to a channel.
     * 
     * @connectionName The name of the connection to use to publish the event.
     * @channelName The name of the channel to publish the event to.
     * @private Whether or not the channel is private.
     * @event The name of the event to publish.
     * @data The data to publish.
     */
    function publish(
        connectionName = "",
        channelName    = "",
        private        = false,
        event          = "",
        data           = []
    ) {
        // Ensure the connection exists
        if ( isNull( arguments.connectionName ) || !connectionExists( arguments.connectionName ) ) {
            throw( type="MissingConnection", message="The connection '" & arguments.connectionName & "' does not exist." );
        }

        // Ensure the channel has been specified
        if ( isNull( arguments.channelName ) || !arguments.channelName.len() ) {
            throw( type="MissingChannel", message="You must specify a channel using .channel( name ) or .private( name )." );
        }

        // Ensure event name
        if ( !arguments.event.len() ) {
            throw( type="MissingEvent", message="You must specify an event name when calling .publish( event='eventName' )." );
        }
    }

}