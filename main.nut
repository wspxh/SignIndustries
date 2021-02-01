class SignIndustries extends AIController
 {
   function Start();
 }

 function SignIndustries::Start()
 {
   AILog.Info("SignIndustries Started.");
   local industries=AIIndustryList();
   foreach(industry_id,value in industries){
	   local industry_type=AIIndustryType.GetName(AIIndustry.GetIndustryType(industry_id));
	   local location=AIIndustry.GetLocation(industry_id);
	   AISign.BuildSign(location,industry_type);
   }
   while (true) {this.Sleep(2147483647)}
 }
function SignIndustries::Save()
{
	return { x = 0 };
}

function SignIndustries::Load(version, data)
{
}