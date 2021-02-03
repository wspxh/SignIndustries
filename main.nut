class SignIndustries extends AIController {
    signs = {};

    function Start();
}

function SignIndustries::Start() {
    AILog.Info("SignIndustries Started.");
    local industries = AIIndustryList();
    foreach(industry_id, value in industries) {
        local industry_type = AIIndustryType.GetName(AIIndustry.GetIndustryType(industry_id));
        local location = AIIndustry.GetLocation(industry_id);
        local sign_id = AISign.BuildSign(location, industry_type);
        if (sign_id != null) SignIndustries.signs.industry_id <-sign_id;
    }
    while (true) {
        this.Sleep(100);
        while (AIEventController.IsEventWaiting()) {
            local e = AIEventController.GetNextEvent();
            switch (e.GetEventType()) {
                case AIEvent.ET_INDUSTRY_OPEN:
                    local ec = AIEventIndustryOpen.Convert(e);
                    local industry_id = ec.GetIndustryID();
                    AILog.Info("A new industry open!");
                    local industry_type = AIIndustryType.GetName(AIIndustry.GetIndustryType(industry_id));
                    local location = AIIndustry.GetLocation(industry_id);
                    local sign_id = AISign.BuildSign(location, industry_type);
                    if (sign_id != null) SignIndustries.signs.industry_id <-sign_id;
                    break;
                case AIEvent.ET_INDUSTRY_CLOSE:
                    AILog.Info("One industry closed!")
                    local ec = AIEventSubsidyOffer.Convert(e);
                    local industry_id = ec.GetIndustryID();
                    local sign_id = SignIndustries.signs.industry_id;
                    if (sign_id != null) AISign.RemoveSign(sign_id);
            }
        }
    }
}

function SignIndustries::Save() {
    return {
        signs = this.signs
    };
}

function SignIndustries::Load(version, data) {
    this.signs = data.signs;
}