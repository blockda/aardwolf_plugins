--load scripts

--only one so far.


function testCommandHandler(args)
	--debugPrint("Inside the testCommandHandler yo, peep dis raw deal!"..args)
end

RegisterSpecialCommand("testcommand","testCommandHandler")

function demoCommand(args)
	Note("doing scripts")
	num = tonumber(args)
	if(num ~= nil) then
		WindowXCallS("layout_manager","demo",tostring(num))
	end
end

RegisterSpecialCommand("demo","demoCommand")

--debugPrint("button server functions loaded")
--set up windows.
--MainWindowSize(0,177,880,500)
--modding the main window is much harder now.
function OnBackgroundStartup()
	--debugPrint("backgroundStartup for mainboot.lua")

end

function LoadLayout(layout)
	WindowXCallS("layout_manager","LoadLayout",layout)
end
--NewWindow("lua_window",880,577,400,100,"windowscript")

function setScrollContainerWidth(value)
  options.scroll_contianer_width = value
  WindowXCallS("layout_manager","SetScrollContainerWidth",value)
end

function setBottomContainerHeight(value)
  options.bottom_container_heght = value;
  WindowXCallS("layout_manager","SetBottomContainerHeight",value)
end

function setLayoutFromPreferences(value)
  WindowXCallS("layout_manager","SetSelectedLayout",tonumber(value) + 1)
end

optionsTable = {}
optionsTable.scroll_container_width = setScrollContainerWidth
optionsTable.bottom_container_height = setBottomContainerHeight
optionsTable.selected_layout = setLayoutFromPreferences


options = {}
options.scroll_container_width = 150
options.bottom_container_height = 70
options.selected_layout = 3

function OnOptionChanged(key,value)
  --Note("\n"..key..":"..value.."\n")
  local func = optionsTable[key]
  if(func ~= nil) then
    func(value)
  end
  
end


--debugPrint("startup script loaded!")