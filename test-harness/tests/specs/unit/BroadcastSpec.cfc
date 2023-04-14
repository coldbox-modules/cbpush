component extends="coldbox.system.testing.BaseTestCase" {

	/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all suites+specs in the run() method
	function beforeAll(){
		super.beforeAll();
	}

	// executes after all suites+specs in the run() method
	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run( testResults, testBox ){
		describe( "Component.cfc", function(){
			beforeEach( function( currentSpec ){
				setup();
				broadcast = getInstance( "Broadcast@cbpush" );
			} );

			it( "can instantiate a component", function(){
				expect( isObject( broadcast ) ).toBeTrue();
			} );

			it( "can get and set a connection", function() {
				broadcast.setConnectionName( "test" );
				expect( broadcast.getConnectionName() ).toBe( "test" );
			} );

			it( "can call connection() to set a connection and get a Broadcast object back", function() {
				var randomName = createUUID();
				var result = broadcast.connection( randomName );
				expect( broadcast.getConnectionName() ).toBe( randomName );
				expect( result ).toBeInstanceOf( "BroadCast" );
			} );
		
			it( "can get and set a channel", function() {
				broadcast.setChannelName( "test" );
				expect( broadcast.getChannelName() ).toBe( "test" );
			} );

			it( "can call channel() to set a channel and get a Broadcast object back", function() {
				var randomName = createUUID();
				var result = broadcast.channel( randomName );
				expect( broadcast.getChannelName() ).toBe( randomName );
				expect( result ).toBeInstanceOf( "Broadcast" );
			} );

			describe( "events", function() {
				it( "throws an error if we broadcast an event on an unknown connection", function() {
					expect( function() {
						broadcast
							.connection( "bad-connection")
							.channel( "some-channel" )
							.publish( event="test", data=[ "test" ] );
					} ).toThrow( type="MissingConnection", regex="The connection 'bad-connection' does not exist\.$" );
				} );

				it( "doesn't throw an error if we broadcast an event on a known connection", function() {
					expect( function() {
						broadcast
							.connection( "pusher" )
							.channel( "some-channel" )
							.publish( event="test", data=[ "test" ] );
					} ).notToThrow();
				} );

				it( "throws an error if we publish an event without specifying a channel", function() {
					expect( function() {
						broadcast
							.connection( "pusher" ) 
							.publish( event="test", data=[ "test" ] );
					} ).toThrow( type="MissingChannel", regex="You must specify a channel using .channel\( name \) or .private\( name \)\.$");
				} );

				it( "throws an error if we publish an event without specifying an event name", function() {
					expect( function() {
						broadcast
							.connection( "pusher" ) 
							.channel( "some-channel" )
							.publish( data=[ "test" ] );
					} ).toThrow( type="MissingEvent", regex="You must specify an event name when calling .publish\( event='eventName' \)\.$");
				} );

			} );

		} );
	}

}
