component {

	this.name = "cbpush";
	this.version = "1.0.0";
	this.author = "";
	this.webUrl = "https://github.com/coldbox-modules/cbpush";
	this.dependencies = [];

	this.entryPoint = "cbpush";

	this.layoutParentLookup = false;
	this.viewParentLookup = false;
	this.cfmapping = "cbpush";
	this.modelNamespace = "cbpush";
	this.applicationHelper = [ "helpers/helpers.cfm" ];

	function configure(){
		settings = {
			
		};

		routes = [
			
		];

		interceptorSettings = {
			customInterceptionPoints : [

			]
		};

		interceptors = [
	
		];
	}

}
