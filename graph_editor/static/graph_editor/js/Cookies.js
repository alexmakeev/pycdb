/**
 * Created by 1ka on 4/9/14.
 */
ZOOMPYCDB.namespace("ZOOMPYCDB.Cookies");
ZOOMPYCDB.Cookies = function(){
    var setCookie = function(name, value, options){
		options = options || {};
		var expires = options.expires;
		
		if (typeof expires == "number" && expires) {
			var d = new Date();
			d.setTime(d.getTime() + expires*1000);
			expires = options.expires = d;
		}
		if (expires && expires.toUTCString) {
			options.expires = expires.toUTCString();
		}
		
		value = encodeURIComponent(value);
		var updatedCookie = name + "=" + value;
		for(var propName in options) {
			updatedCookie += "; " + propName;
		var propValue = options[propName];   
		if (propValue !== true) {
			updatedCookie += "=" + propValue;
     		}
		  }
		  document.cookie = updatedCookie;
        },

        //cursor functions
        deleteCookie = function(name){
			setCookie(name, "", { expires: -1 });
        },
        getCookie = function(name){
			var matches = document.cookie.match(new RegExp("(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"));
			var result = matches ? decodeURIComponent(matches[1]) : undefined;
			return JSON.parse(result);
        };

    $(document).on("set_cookie",function(event,name, value){
        setCookie(name, value);
    });
    $(document).on("get_cookie",function(event,name){
        JSON.parse(getCookie(name));
    });
    $(document).on("delete_cookie",function(){
        deleteCookie();
    });

    return{
    	get: getCookie
    };
};