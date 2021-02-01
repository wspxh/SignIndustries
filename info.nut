class SignInfo extends AIInfo {
	function GetAuthor() { return "PeiXiaoHan"; }
	function GetName() { return "SignIndustries"; }
	function GetDescription() {
		return "set sign on industries.";
	}
	function GetVersion() { return 1; }
	function GetDate() { return "1st Feb 2021"; }
	function CreateInstance() { return "SignIndustries"; }
	function GetShortName() { return "SI"; }
	function GetAPIVersion() { return "1.10"; }
}

RegisterAI(SignInfo());
