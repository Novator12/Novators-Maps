---InlineJobs von twa
gv_InlineJobs = {
	Counter = 0
  };

function StartInlineJob(_EventType, _Function, ...)
   gv_InlineJobs.Counter = gv_InlineJobs.Counter +1;
    _G["InlineJob_Data_" ..gv_InlineJobs.Counter] = copy(arg);
    _G["InlineJob_Function_" ..gv_InlineJobs.Counter] = _Function;
    _G["InlineJob_Executor_" ..gv_InlineJobs.Counter] = function(i)
        if _G["InlineJob_Function_" ..i](unpack(_G["InlineJob_Data_" ..i])) then
            return true;
        end
    end
    return Trigger.RequestTrigger(
        _EventType,
        "",
        "InlineJob_Executor_" ..gv_InlineJobs.Counter,
        1,
        {},
        {gv_InlineJobs.Counter}
    );
end

function copy(_Source, _Dest)
    _Dest = _Dest or {};
    assert(_Source ~= nil, "copy: Source is nil!");
    assert(type(_Dest) == "table");

    for k, v in pairs(_Source) do
        if type(v) == "table" then
            _Dest[k] = _Dest[k] or {};
            for kk, vv in pairs(copy(v)) do
                _Dest[k][kk] = _Dest[k][kk] or vv;
            end
        else
            _Dest[k] = _Dest[k] or v;
        end
    end
    return _Dest;
end


---Aktiviere Blende

function StartBlende( _headlineText, _briefText, _action_func, _duration)                  --bspw.: StartBlende( "Chapter 1", "Herzlich willkommen auf dieser Karte", function() Message("Hallo") end)      _action_func wird am Ende der Blende ausgeführt
    _G._headlineText = _headlineText
	_G._briefText = _briefText
	_G._duration = _duration
	TriggerFixCppLogicExtension.AddMapArchiveToLoadOrder()
	

	while GUI.GetSelectedEntity() do 
		GUI.DeselectEntity(GUI.GetSelectedEntity()) 
	end

	
	Game.GameTimeSetFactor(0)
	XGUIEng.ShowWidget("Normal", 0)
	XGUIEng.ShowWidget("Movie", 1)
	XGUIEng.ShowWidget("CreditsWindow", 0)
	XGUIEng.ShowWidget("BlendeWindow_BG_Video", 0)
	XGUIEng.SetText("BlendeWindowText","@color:0,252,255,0 " .. _briefText)
	XGUIEng.SetText("BlendeWindowTextTitle","@color:255,255,0 " .. _headlineText)

	for i = 1,5,1 do
		XGUIEng.SetMaterialColor("BlendeWindowText", i, nil, nil, nil, 0)
		XGUIEng.SetMaterialColor("BlendeWindowTextTitle", i, 255, 255, 255, 0)
		XGUIEng.SetMaterialColor("BlendeWindowBG", i, 255, 255, 255, 0)
		XGUIEng.SetMaterialColor("BlendeWindowBG2", i, 255, 255, 255, 0)
		XGUIEng.SetMaterialColor("BlendeWindowLogo", i, 255, 255, 255, 0)
		XGUIEng.SetMaterialColor("MovieBarTop", i, 255, 255, 255, 0)
		XGUIEng.SetMaterialColor("MovieBarBottom", i, 255, 255, 255, 0)
    end


	
	
	darker_counter = XGUIEng.GetSystemTime();

	--Action Handler für Func am Ende der Blende

	start_handler = 0;
	StartInlineJob(Events.LOGIC_EVENT_EVERY_TURN ,function(_action_func2)
		if start_handler == 1 then
			_action_func2()
			start_handler = 0;
			return true;
		end
	return false;
	end, _action_func)

end
	
function GUI_CountSystemTime()      -- Kontrolle der Blende
	if darker_counter then 
		local factor = math.min(255,(XGUIEng.GetSystemTime() - darker_counter)*255/3);  --Bindung an System Zeit

		for i = 1,5,1 do
			XGUIEng.SetMaterialColor("BlendeWindowBG", i, 255, 255, 255, factor)
			XGUIEng.SetMaterialColor("BlendeWindowBG2", i, 255, 255, 255, factor)
			XGUIEng.SetMaterialColor("BlendeWindowLogo", i,255, 255, 255, factor)
			XGUIEng.SetMaterialColor("MovieBarTop", i, 255, 255, 255, factor)
			XGUIEng.SetMaterialColor("MovieBarBottom", i, 255, 255, 255, factor)
		end

		XGUIEng.SetText("BlendeWindowText","@color:0,252,255,".. factor .. " " .. _briefText)
		XGUIEng.SetText("BlendeWindowTextTitle","@color:255,255,0,".. factor .. " " .. _headlineText)

			
		if  XGUIEng.GetSystemTime() >= darker_counter +4  then    --darker_counter +4 gibt die länge des einfadens an
			darker_counter = nil;
			blende_counter = XGUIEng.GetSystemTime();
			XGUIEng.ShowWidget("BlendeWindowBG2", 0)
			XGUIEng.StartVideoPlayback("BlendeWindow_BG_Video", "data/maps/externalmap/bgflag.bik", 1)   --für s5x form
			XGUIEng.ShowWidget("BlendeWindow_BG_Video", 1)
		end

	elseif blende_counter then
		if XGUIEng.GetSystemTime() >= blende_counter + _duration then  --blende_counter +15 gibt die länge der lese Zeit des Textes an (beliebig erhöhbar je nach Textlänge)
			blende_counter = nil;
			brighter_counter =  XGUIEng.GetSystemTime();
			XGUIEng.StopVideoPlayback("BlendeWindow_BG_Video")
			XGUIEng.ShowWidget("BlendeWindow_BG_Video", 0)
			XGUIEng.ShowWidget("BlendeWindowBG2", 1)

	    end

	elseif brighter_counter then
		local factor = 255 - math.min(255,(XGUIEng.GetSystemTime() - brighter_counter)*255/3);   --Bindung an System Zeit

		for i = 1,5,1 do
			XGUIEng.SetMaterialColor("BlendeWindowBG", i, 255, 255, 255, factor)
			XGUIEng.SetMaterialColor("BlendeWindowBG2", i, 255, 255, 255, factor)
			XGUIEng.SetMaterialColor("BlendeWindowLogo", i,255, 255, 255, factor)
			XGUIEng.SetMaterialColor("MovieBarTop", i, 255, 255, 255, factor)
			XGUIEng.SetMaterialColor("MovieBarBottom", i, 255, 255, 255, factor)
		end

		XGUIEng.SetText("BlendeWindowText","@color:0,252,255,".. factor .. " " .. _briefText)
		XGUIEng.SetText("BlendeWindowTextTitle","@color:255,255,0,".. factor .. " " .. _headlineText)

			
		if  XGUIEng.GetSystemTime() >= brighter_counter +3  then      --brighter_counter +4 gibt die länge der Fadeoutzeit an
			brighter_counter = nil;
			XGUIEng.ShowWidget("Normal", 1)
			XGUIEng.ShowWidget("Movie", 0)
			Game.GameTimeSetFactor(1)
			start_handler = 1;
		end
	end
end





