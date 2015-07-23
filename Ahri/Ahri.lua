
----------------WORK IN PROGRESS DO NOT INSTALL-------------------------------
local version = 1.0;
DB = require "SpellDatabase.lua"

local myHero = GetMyHero()
local myHeroPos = nil
local SpellBook = CreateSpellBook(MyHero);

--    local castlevel = GetCastLevel(myHero,_Q); --returns how much the Q spell has been leveled up
--    local castrange = GetCastRange(myHero,_Q); --returns the range of the Q spell determined by the game engine
--    local castmana = GetCastMana(myHero,_Q,castlevel);  --returns the mana required to cast Q on the specific level it is
--    local castcd = GetCastCooldown(myHero,_Q,castlevel);  --returns the cooldown of the Q spell depending on the level it is currently
--    local castname = GetCastName(myHero,_Q);  --returns the current name of the Q spell (it changes for Nidalee and other champs depending on form)
--    local castusage = CanUseSpell(myHero,_Q); --returns the current state of the Q spell; READY=0;NOTAVAILABLE=1;NOTLEARNED=2;READYNONCAST=3;UNKNOWN=4;ONCOOLDOWN=5

--      	local QPred = GetPredictionForPlayer(myHeroPos,unit,GetMoveSpeed(unit),math.huge,250,850,100,true,true)
--        local Epred = GetPredictionForPlayer(myHeroPos,unit,GetMoveSpeed(unit)
--		if CanUseSpell(myHero, _E) == READY and IsDistance(unit, 700) and (GotBuff(unit,"cassiopeiamiasmapoison") > 0 or GotBuff(unit,"cassiopeianoxiousblastpoison") > 0) then
--			CastTargetSpell(unit, _E)
--		elseif CanUseSpell(myHero, _W) == READY and IsDistance(unit, 925) and WPred.HitChance == 1 then
--			CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
--		elseif CanUseSpell(myHero, _Q) == READY and IsDistance(unit, 850) and QPred.HitChance == 1 then
--			CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
--		end
--	end
--	local movePos = GenerateMovePos()
--	if GetDistance(GetMousePos()) > GetHitBox(myHero)*GetHitBox(myHero) then
--		MoveToXYZ(movePos.x, 0, movePos.z)
--	end
--end
if myHero.Name ~= "Ahri" then return end;
function AfterObjectLoopEvent(myHer0)
	myHeroPos = GetOrigin(myHero)
---------------------MODE---------------------------------
    if     KeyIsDown(0x20) then Combo()
	elseif KeyIsDown(0x40) then Harras()
    else end;
    return;
    end;

function CreateSpellBook(myHeroPtr)
local Data = { 
               [Q]={ isReady = function() return CanUseSpell(myHeroPtr,_Q) == READY end, lvl =function() return GetCastLevel(myHeroPtr,_Q) end, range = function() return GetCastRange(myHeroPtr,_Q) end, cmana = function() return GetCastMana(myHeroPtr,_Q) end, cd = function() return GetCastCooldown(myHeroPtr,_Q) end, sname = function() return GetCastName(myHeroPtr,_Q) end},
               [W]={ isReady = function() return CanUseSpell(myHeroPtr,_W) == READY end, lvl =function() return GetCastLevel(myHeroPtr,_W) end, range = function() return GetCastRange(myHeroPtr,_W) end, cmana = function() return GetCastMana(myHeroPtr,_W) end, cd = function() return GetCastCooldown(myHeroPtr,_W) end, sname = function() return GetCastName(myHeroPtr,_W) end},
               [E]={ isReady = function() return CanUseSpell(myHeroPtr,_E) == READY end, lvl =function() return GetCastLevel(myHeroPtr,_E) end, range = function() return GetCastRange(myHeroPtr,_E) end, cmana = function() return GetCastMana(myHeroPtr,_E) end, cd = function() return GetCastCooldown(myHeroPtr,_E) end, sname = function() return GetCastName(myHeroPtr,_E) end},
               [R]={ isReady = function() return CanUseSpell(myHeroPtr,_R) == READY end, lvl =function() return GetCastLevel(myHeroPtr,_R) end, range = function() return GetCastRange(myHeroPtr,_R) end, cmana = function() return GetCastMana(myHeroPtr,_Q) end, cd = function() return GetCastCooldown(myHeroPtr,_Q) end, sname = function() return GetCastName(myHeroPtr,_R) end},
             }
             return Data;
             end;

function Combo()
CastQ()
CastW()
CastE()
end;

function Harras() 
local currentmanaPC = GetCurrentMana(myHero)/GetMaxMana(myHero);
if currentmanaPC < 0.5 then return end;
CastQ();
CastE();

function IsNnRange(target,range)
if target == nil then return nil end;
local tPos = GetOrigin(target);
local mPos = GetOrigin(myHero);
local distance = math.sqrt((mPos.x-tPos.x)^2+(mPos.z-tPos.z)^2);
if distance<=range then return true else return false;
end;


----CASTS-------
function CastQ()
local target = GetCurrentTarget();
if target == nil then return end;
local mypredQ = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),2500,250,SpellBook.Q.range(),100,false,true);
if SpellBook.Q.isReady() and IsInRange(target,SpellBook.Q.range()) and mypredQ.HitChanse==1 then CasstSkillShot(_Q,mypredQ.x,mypredQ.y,mypredQ.z) else return end;
end;

function CastW()
local target = GetCurrentTarget();
if target == nil then return end;
--Parameters: CastStartPosVec,EnemyChampionPtr,EnemyMoveSpeed,YourSkillshotSpeed,SkillShotDelay,SkillShotRange,SkillShotWidth,MinionCollisionCheck,AddHitBox;
local Epred = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target));
if SpellBook.W.IsReady() and IsInRange(target,SpellBook.W.range()) then CastTargetSpell(myHero,_W) else return end;

function CastE()
local target = GetCurrentTarget();
if target == nil then return end;
local mypredE = GetPredictionForPlayer(myHeroPos,target,GetMoveSpeed(target),1550,250,SpellBook.E.range(),60,false,true);
if SpellBook.E.isReady() and IsInRange(target,SpellBook.Q.range()) and mypredE.HitChanse==1 then CasstSkillShot(_E,mypredE.x,mypredE.y,mypredE.z) else return end;
--huehue--