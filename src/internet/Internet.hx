package internet;

import lorem.Lorem;

using StringTools;

/**
	*
		* internet

	- [ ] avatar
	- [ ] email
	- [ ] exampleEmail
	- [ ] userName
	- [x] protocol
	- [x] url
	- [ ] domainName
	- [x] domainSuffix
	- [ ] domainWord
	- [ ] ip
	- [ ] ipv6
	- [ ] userAgent
	- [ ] color
	- [ ] mac
	- [ ] password

 */
class Internet {
	public function new() {
		// your code
	}

	public function protocol():String {
		return internet.Protocol.get();
	}

	public function domainSuffix():String {
		return internet.DomainSuffix.get();
	}

	public function domainName(?name:String):String {
		var v:String = name;
		if (v == null)
			v = new lorem.Lorem().word();
		v = v.toLowerCase().replace(' ', '-').replace('.', '');
		return v;
	}

	public function url(?name:String):String {
		var domainName = domainName(name);
		return '${internet.Protocol.get()}://www.${domainName}.${internet.DomainSuffix.get()}';
	}

	public function convert2Website(name:String):String {
		return 'https://www.${name.toLowerCase().replace(' ', '-').replace('.', '')}.nl';
	}
}
