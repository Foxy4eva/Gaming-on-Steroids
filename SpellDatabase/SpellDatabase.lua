

----------------------------------------------------------YOU GET THIS BONUS THINGIES--------------------------------------------
--Daaaaaaaaa -------------------->>SpellBook
function CreateSpellBook(myHeroPtr)
local Data = { 
               [Q]={ isReady = function() return CanUseSpell(myHeroPtr,_Q) == READY end, lvl =function() return GetCastLevel(myHeroPtr,_Q) end, range = function() return GetCastRange(myHeroPtr,_Q) end, cmana = function() return GetCastMana(myHeroPtr,_Q) end, cd = function() return GetCastCooldown(myHeroPtr,_Q) end, sname = function() return GetCastName(myHeroPtr,_Q) end},
               [W]={ isReady = function() return CanUseSpell(myHeroPtr,_W) == READY end, lvl =function() return GetCastLevel(myHeroPtr,_W) end, range = function() return GetCastRange(myHeroPtr,_W) end, cmana = function() return GetCastMana(myHeroPtr,_W) end, cd = function() return GetCastCooldown(myHeroPtr,_W) end, sname = function() return GetCastName(myHeroPtr,_W) end},
               [E]={ isReady = function() return CanUseSpell(myHeroPtr,_E) == READY end, lvl =function() return GetCastLevel(myHeroPtr,_E) end, range = function() return GetCastRange(myHeroPtr,_E) end, cmana = function() return GetCastMana(myHeroPtr,_E) end, cd = function() return GetCastCooldown(myHeroPtr,_E) end, sname = function() return GetCastName(myHeroPtr,_E) end},
               [R]={ isReady = function() return CanUseSpell(myHeroPtr,_R) == READY end, lvl =function() return GetCastLevel(myHeroPtr,_R) end, range = function() return GetCastRange(myHeroPtr,_R) end, cmana = function() return GetCastMana(myHeroPtr,_Q) end, cd = function() return GetCastCooldown(myHeroPtr,_Q) end, sname = function() return GetCastName(myHeroPtr,_R) end},
             }
             return Data;
             end;
----------USAGE---------------------- COMMENT LINE BELOW BEFORE USING THE DB (if you want :) ) ----------------------------------
--local SpellBook = CreateSpellBook(myHero);
--local Qrange = SpellBook.Q.range();
--local Qcd = SpellBook.Q.cd();
--This will give you the spellbook with all spell data as function so need need to include spells in Loop. This will reduce FPS drops :)
----You get the idea :)-----------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------THE DATABASE---------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--local CollisionType = {[Minion]={SlowDown,DmgDown,Stop},YasuoWall};
function CreateSkillShot (name, delay, range, radius, speed, accel, collision, aoe, _type)
local SpellData = {Name = name, Delay=delay, Range=range, Radius=radius, Speed=speed, Collision=collision, AOE=aoe, Type=_type, Accel=accel};
return SpellData;
end;

function Accel(sm,smx,ac) return {[speedmin]=sm, [speedmax]=smx, [accel]=ac} end;

_SpellDatabase={
                [Atrox] =  {
                            [Q] = CreateSkillShot ("AtroxQ", 600, 650, 250, 2000, nil, true, "Circular"),
                            [E] = CreateSkillShot ("AtroxE", 250, 1075, 35, 1250, false, false, "Linear")
                            },
                [Ahri] =    {
                            [Q] = CreateSkillShot ("AhriOrbofDeception", 250, 1000, 100, 2500, false, false, "Linear", Accel(400,2500,-3200)),
                            [Qr]= CreateSkillShot ("AhriOrbReturn", 250, 1000, 100, 60, false, false, "Linear", Accel(60,2600,1900)), 
                            [E] = CreateSkillShot ("AhriSeduce", 250, 1000, 60, 1550, true, false, "Linear")
                            },
                [Ammumu] =  {
                            [Q] = CreateSkillShot ("BandageToss", 250, 1100, 90, 2000, true, false, "Linear")
                            },
                [Anivia] =  {
                            [Q] = CreateSkillShot ("FlashFrost", 250, 1100, 110, 850, false, false, "Linear")
                            },
                [Annie] =   {
                            [W] = CreateSkillShot ("Incinerate", 250, 825, 80, nil, false, true, "Cone"),
                            [R] = CreateSkillShot ("InfernalGuardian", 250, 600, 251, nil, false, true, "Circular")
                            },
                [Ashe] =    {
                            [W] = CreateSkillShot ("Volley", 250, 1200, 60, 1500, true, false, "Linear"),
                            [R] = CreateSkillShot ("EnchantedCrystalArrow", 250, 20000, 130, 1600, false, false, "Linear")
                            },
                [Bard] =    {
                            [Q] = CreateSkillShot ("BardQ", 250, 950, 60, 1600, true, false, "Linear"),
                            [R] = CreateSkillShot ("BardR", 500, 3400, 350, 2100, nil, true, "Circular")
                            },
                [Blitzcrack]=
                            {
                            [Q]= CreateSkillShot ("RocketGrab", 250, 1150, 70, 1800, true, false, "Linear")
                            },
                [Brand] =   {
                            [Q] = CreateSkillShot ("BrandBlaze", 250, 1100, 60, 1600, true, false, "Linear"),
                            [W] = CreateSkillShot ("BrandFissure", 850, 900, 240, nil, nil, true, "Circular")
                            },
                [Braum] =   {
                            [Q] = CreateSkillShot ("BraumQ", 250, 1050, 60, 1700, true, false, "Linear"),
                            [R] = CreateSkillShot ("BraumRWapper", 500, 1200, 115, 1400, false, false, "Linear")
                            },
                [Caitlyn] = {
                            [Q] = CreateSkillShot ("CaitlynPiltoverPeacemaker", 625, 1300, 90, 2200, false, false, "Linear"),
                            [E] = CreateSkillShot ("CaitlynEntrapment", 125, 1000, 80, 2000, true, false, "Linear")
                            },
                [Cassiopeia]=
                            {
                            [Q] = CreateSkillShot ("CassiopeiaNoxiousBlast", 600, 850, 150, nil, nil, true, "Circular"),
                            [W] = CreateSkillShot ("CassiopeiaMiasma", 250, 850, 150, nil, nil, true, "Circular"), --added manualy, needs checks
                            [R] = CreateSkillShot ("CassiopieaPetrifyingGaze", 600, 825, 80, nil, nil, true, "Cone")
                            },
                [Chogath] = {
                            [Q] = CreateSkillShot ("Rupture", 1200, 950, 250, nil, nil, true, "Circular")
                            },
                [Corki] =   {
                            [Q] = CreateSkillShot ("PhosphorusBomb", 300, 850, 250, 1000, nil, true, "Circular"),
                            [R] = CreateSkillShot ("MissileBarrage", 200, 1300, 40, 2000, true, false, "Linear"),
                            [R2]= CreateSkillShot ("MissileBarrage2",200, 1500, 40, 2000, true, false, "Linear")
                            },
                [Darius] =  {
                            [E] = CreateSkillShot ("DariusAxeGarbCone", 300, 550, 80, nil, nil, false, "Cone");
                            },
                [Diana] =   {
                            [Q] = CreateSkillShot ("DianaArc", 250, 895, 195, 1600, false, true, "Circular");
                            },
                [DrMundo]=  {
                            [Q] = CreateSkillShot ("InfectedCleaverMissileCast", 250, 1050, 60, 2000, true, false, "Linear");
                            },
                [Draven] =  {
                            [E] = CreateSkillShot ("DravenDoubleShot", 250, 1100, 130, 1400, true, false, "Linear"),
                            [R] = CreateSkillShot ("DravenRCast", 400, 20000, 160, 2000, false, false, "Linear");
                            },
                [Ekko] =    {
                            [Q] = CreateSkillShot ("EkkoQ", 250, 950, 60, 1650, true, false, "Linear"),
                            [W] = CreateSkillShot ("EkkoW", 3750, 1600, 3750, 1650, nil, true, "Circular"),
                            [R] = CreateSkillShot ("EkkoR", 250, 1600, 375, 1650, nil, true, "Circular")
                             },
                [Elise] =   {
                            [hE] = CreateSkillShot("EliseHumanE", 250, 1100, 55, 1600, true, false, "Linear")
                            },
                [Evelynn]=  {
                            [R] = CreateSkillShot ("EvelynnR", 250, 650, 350, nil, nil, true, "Circular")
                            },
                [Ezreal] =  {
                            [Q] = CreateSkillShot ("EzrealMysticShot", 250, 1200, 60, 2000, true, false, "Linear"),
                            [W] = CreateSkillShot ("EzrealEssenceFlux", 250, 1050, 80, 1600, false, false, "Linear"),
                            [R] = CreateSkillShot ("EzrealTrueshotBarrage", 1000, 20000, 160, 2000, false, false, "Linear")
                            },
                [Fizz] =    {
                            [R] = CreateSkillShot ("FizzMarinerDoom", 250, 1300, 120, 1350, false, true, "Linear")
                            },
                [Galio] =   {
                            [Q] = CreateSkillShot ("GalioResoluteSmite", 250, 900, 200, 1300, false, true, "Circular"),
                            [E] = CreateSkillShot ("GalioRighteousGust", 250, 1200, 120, 1200, "Linear"),
                            [R] = CreateSkillShot ("GalioIdolOfDuran", 250, 0, 550, nil, nil, true, "Circular");
                            },
                [Gnar] =    {--local SpellData = {Name = name, Delay=delay, Range=range, Radius=radius, Speed=speed, Collision=collision, AOE=aoe, Type=_type};
                            [Q] = CreateSkillShot ("GnarQ", 250, 1125, 60, 2500, false, false, "Linear", Accel(1400,2500,-3000)),
                            [Qreturn] = CreateSkillShot ("GnarQReturn", 0, 2500, 75, 60, false, false, "Linear", Accel(60,2600,60)),
                            [Qbig] = CreateSkillShot ("GnarBigQ", 500, 1150, 90, 2100, false, false, "Linear"),
                            [Wbig] = CreateSkillShot ("GnarBigW", 600, 600, 80, nil, nil, true, "Linear"),
                            [E] = CreateSkillShot ("GnarE", 0, 473, 150, 903, nil, true, "Circular"),
                            [Ebig] = CreateSkillShot ("GnarBigE",250, 475, 200, 1000, nil, true, "Circular"),
                            [R] = CreateSkillShot ("GnarR", 250, 0, 500, nil, nil, true, "Circular")
                            },
                [Gragas] =  {
                            [Q] = CreateSkillShot ("GragasQ", 250, 1100, 275, 1300, nil, true, "Circular"),
                            [E] = CreateSkillShot ("GragasE", 0, 950, 200, 1200, true, false, "Linear"),
                            [R] = CreateSkillShot ("GragasR", 250, 1050, 375, 1800, nil, true, "Circular");
                            },
                [Graves] =  {
                            [Q] = CreateSkillShot ("GravesClusterShot", 250, 1000, 50, 2000, false, false, "Linear"),
                            [R] = CreateSkillShot ("GravesChargeShot", 250, 1100, 100, 2100, false, false, "Linear")
                            },
                [Heimerdinger] =
                            {
                            [E] = CreateSkillShot ("HeimerdingerE", 250, 925, 100, 1200, nil, true, "Circular")
                            },
                [Irelia] =  {
                            [R] = CreateSkillShot ("IreliaTranscendentBlades", 0, 1200, 65, 1600, false, false, "Linear");
                            },
                [Janna] =   {
                            [Q] = CreateSkillShot ("JannaQ", 250, 1700, 120, 900, false, false, "Linear");
                            },
                [JarvanIV] ={
                            [Q] = CreateSkillShot ("JarvanIVDragonStrike", 600, 770, 70, nil, false, false, "Linear"),
                            [QE]= CreateSkillShot ("JarvanIVEQ", 250, 880, 70, 1450, false, false, "Linear"),
                            [E] = CreateSkillShot ("JarvanIVDemacianStandard", 500, 860, 175, nil, false, true, "Circular")
                            },
                [Jayce] =   {
                            [Q] = CreateSkillShot ("jayceshockblast", 250, 1300, 70, 1450, true, false, "Linear"),
                            [Qm]= CreateSkillShot ("JayceQAccel", 250, 1300, 70, 2350, false, false, "Linear"),
                            },
                [Jinx] =    {
                            [W] = CreateSkillShot ("JinxW", 600, 1500, 60, 3300, true, false, "Linear"),
                            [R] = CreateSkillShot ("JinxR", 600, 20000, 140, 1700, false, false, "Linear");
                [Kalista] = {
                            [Q] = CreateSkillShot ("KalistaMysticShot", 250, 1200, 40, 1700, true, false, "Linear", nil),
                            },
                [Karma] =   {
                            [Q] = CreateSkillShot ("KarmaQ", 250, 1050, 60, 1700, true, false, "Linear", nil),
                            [Qr]= CreateSkillShot ("KarmaQMantra", 250, 950, 80, 1700, true, false, "Linear", nil),
                            },
                [Karthus] = {
                            [Q] = CreateSkillShot ("KarthusLayWasteA2", 625, 875, 160, nil, nil, false, "Circular", nil),
                            }, 
                [Kassadin]= {
                            [R] = CreateSkillShot ("RiftWalk", 250, 450, 270, nil, nil, false, "Circular", nil),
                            },
                [Kennen] =  {
                            [Q] = CreateSkillShot ("KennenShurikenHurlMissile1", 125, 1050, 50, 1700, true, false, "Linear", nil),
                            },                                                 
                [Khazix] =  {
                            [W] = CreateSkillShot ("KhazixW", 250, 1025, 73, 1700, true, false, "Linear", nil),                                                                            
                            -- Can't do khazixwlong :'(
                            [E] = CreateSkillShot ("KhazixE", 250, 600, 300, nil, nil, false, "Linear", nil),
                            },
                [Kogmaw] =  {
                            [Q] = CreateSkillShot ("KogMawQ", 250, 1200, 70, 1650, true, false, "Linear", nil),
                            [E] = CreateSkillShot ("KogMawVoidOoze", 250, 1360, 120, 1400, false, false, "Linear", nil),
                            [R] = CreateSkillShot ("KogMawLivingArtillery", 1200, 1800, 150, nil, nil, false, "Linear", nil),
                            },
                [Leblanc] = {
                            [W] = CreateSkillShot ("LeblancSlide", 0, 600, 220, 1500, nil, true, "Circular"),
                            [E] = CreateSkillShot ("LeblancSoulShackle", 250, 950, 70, 1600, true, false, "Linear"),
                            [Rw]= CreateSkillShot ("LeblancSlideM", 0, 600, 220, 1500, nil, true, "Circular"),
                            [Re]= CreateSkillShot ("LeblancSoulShackleM", 250, 950, 70, 1600, nil, true, "Circular");
                            },
                [Leona] =   {
                            [E] = CreateSkillShot ("LeonaZenithBlade", 250, 905, 70, 2000, false, false, "Linear", nil),
                            [R] = CreateSkillShot ("LeonaSolarFlare", 1000, 1200, 300, nil, nil, true, "Circular", nil),
                            },  
                [Leesin] =  {
                            [Q] = CreateSkillShot ("BlindMonkQOne", 250, 1100, 65, 1800, true, false, "Linear"); 
                            },
                            },
                [Lissandra]={
                            [Q] = CreateSkillShot ("LissandraQ", 250, 700, 75, 2200, false, false, "Linear"),
                            [Qshards]=CreateSkillShot ("LissandraQShards", 250, 700, 90, 2200, nil, false, "Linear");
                            [E] = CreateSkillShot ("LissandraE", 250, 1025, 125, 850, false, false, "Linear");
                            },
                [Lucian] =  {
                            [Q] = CreateSkillShot ("LucianQ", 500, 1300, 65, false, false, "Linear"),
                            [W] = CreateSkillShot ("LucianW", 250, 1000, 55, false, false, "Linear"),
                            [R] = CreateSkillShot ("LucianR", 500, 1400, 110, true, false, "Linear");
                            },
                [Lulu] =    {
                            [Q] = CreateSkillShot ("LuluQ", 250, 950, 60, 1450, false, false, "Linear"),
                            [Qpix] = CreateSkillShot ("LuluQPix", 250, 950, 60, 1450, false, false, "Linear");
                            },
                [Lux] =     {
                            [Q] = CreateSkillShot ("LuxLightBinding", 250, 1300, 70, 1200, true, false, "Linear"),
                            [W] = CreateSkillShot ("LuxShield", 250,  1075, 100, 1400, false, false, "Linear"), --manually added
                            [E] = CreateSkillShot ("LuxLightStrikeKugel", 250, 1100, 275, 1300, false, true, "Circular"),
                            [R] = CreateSkillShot ("LuxMaliceCannon", 1000, 3500, 190, nil, nil, true, "Linear"); 
                            },
                [Malphite] ={
                            [R] = CreateSkillShot ("UFSlash", 0, 1000, 270, 1500, false, false, "Linear");
                            },
                [Malzahar] ={
                            [Q] = CreateSkillShot ("AlZaharCalloftheVoid", 1000, 900, 85, nil, nil, true, "Linear");
                            },
                [Morgana] = {
                            [Q] = CreateSkillShot ("DarkBindingMissile",250, 1300, 80, 1200, true, false, "Linear");
                            },
                [Nami] =    {
                            [Q] = CreateSkillShot ("NamiQ", 950, 1625, 150, nil, nil, true, "Circular"),
                            [R] = CreateSkillShot ("NamiR", 500, 2750, 260, 850, false, false, "Linear");
                            },
                [Nautilus] ={
                            [Q] = CreateSkillShot ("NautilusAnchorDrag",250, 1100, 90, 2000, true, false, "Linear");
                            },
                [Nocturne] ={
                            [Q] = CreateSkillShot ("NocturneDuskbringer", 250, 1125, 60, 1400, false, false, "Linear");
                            },
                [Nidalee] = {
                            [Q] = CreateSkillShot ("JavelinToss", 125, 1500, 40, 1300, true, false, "Linear");
                            },
                [Olaf] =    {
                            [Q] = CreateSkillShot ("OlafAxeThrowCast", 250, 1100, 150, 1600, false, false, "Linear");
                            },
                [Orianna] = {
                            [Q] = CreateSkillShot ("OriannasQ", 0, 1500, 80, 1200, false, false, "Linear"),
                            [Qend]= CreateSkillShot("OriannaQend", 0, 1500, 90, 1200, false, true, "Circular"),
                            [W] = CreateSkillShot ("OrianaDissonanceCommand", 250, 0, 255, nil, nil, true, "Circular"),
                            [E] = CreateSkillShot ("OriannasE", 0, 1500, 85, 1850, false, false, "Linear"),
                            [R] = CreateSkillShot("OrianaDetonateCommand", 700, 0, 410, nil, nil, true, "Circular");
                            },
                [Quinn] =   {
                            [Q] = CreateSkillShot ("QuinnQ", 250, 1050, 80, 1550, true, false, "Linear");
                            },
                [Rengar] =  {
                            [E] = CreateSkillShot ("RengarE", 250, 1000, 70, 1500, true, false, "Linear");
                            },
                [Reksai] =  {
                            [Q] = CreateSkillShot ("reksaiqburrowed", 500, 1625, 60, 1950, true, false, "Linear");
                            },
                [Riven] =   {
                            [R] = RumbleGrenade ("rivenizunablade", 250, 1100, 125, 1600, false, false, "Linear");
                            },
                [Rumble] =  {
                            [E] = CreateSkillShot ("RumbleGrenade", 250, 950, 60, 2000, true, false, "Linear"),
                            [R] = CreateSkillShot ("RumbleCarpetBombM", 400, 1200, 200, 1600, nil, true, "Linear"); 
                            },
                [Ryze] =    {
                            [Q] = CreateSkillShot ("ryzeq", 250, 900, 50, 1700, true, false, "Linear"); 
                            },
                [Sejuani] = {
                            [Q] = CreateSkillShot ("SejuaniArcticAssault", 0, 900, 70, 1600, true, false, "Linear"),
                            [R] = CreateSkillShot ("SejuaniGlacialPrisonStart", 250, 1100, 110, 1600, false, false, "Linear");
                            },
                [Sion] =    {
                            [E] = CreateSkillShot ("SionE", 250, 800, 80, 1800, false, false, "Linear"),
                            [R] = CreateSkillShot ("SionR", 500, 800, 120, 1000, false, false, "Linear");
                            },
                [Soraka] =  {
                            [Q] = CreateSkillShot ("SorakaQ", 500, 950, 300, 1750, nil, true, "Circular");
                            },
                [Shen] =    {
                            [E] = CreateSkillShot ("ShenShadowDash", 0, 650, 50, 1600, false, false, "Linear");
                            },
                [Shyvana] = {
                            [E] = CreateSkillShot ("ShyvanaFireball", 250, 950, 60, 1700, false, false, "Linear"),
                            [R] = CreateSkillShot ("ShyvanaTransformCast", 250, 1000, 150, 1500, false, false, "Linear");
                            },
                [Sivir] =   {
                            [Q] = CreateSkillShot ("SivirQ", 250, 1250, 90, false, false, "Linear"),
                            [QReturn] = CreateSkillShot ("SivirQReturn", 250, 1250, 90, false, false, "Linear");
                            },
                [Skarner] = {
                            [E] = CreateSkillShot ("SkarnerFracture", 250, 1000, 70, 1500, false, false, "Linear");
                            },
                [Sona] =    {
                            [R] = CreateSkillShot ("SonaR", 250, 1000, 140, 2400, false, true, "Linear");
                            },
                [Swain] =   {
                            [W] = CreateSkillShot ("SwainShadowGrasp", 1100, 900, 180, nil, true, "Circular"),
                            },
                [Syndra] =  {
                            [Q] = CreateSkillShot ("SyndraQ", 600, 800, 150, nil, nil, true, "Circular"),
                            [W] = CreateSkillShot ("syndrawcast", 250, 950, 210, 1450, nil, true, "Circular"),
                            [E] = CreateSkillShot ("syndrae5", 300, 950, 90, 1600, false, true, "Linear"),
                            },
                [Talon] =   {
                            [W] = CreateSkillShot ("TalonRake", 250, 800, 80, 2300, false, true, "Linear"),
                            [WReturn] = CreateSkillShot ("TalonRakeReturn", 250, 800, 80, 1850, false, true, "Linear")
                            },
                [TahmKench] =
                            {
                            [Q] = CreateSkillShot ("TahmKenchQ", 250, 951, 90, 2800, true, false, "Linear"),
                            },
                [Thresh] =  {
                            [Q] = CreateSkillShot ("ThreshQ", 500, 1100, 70, 1900, false, true, "Linear"),
                            [E] = CreateSkillShot ("ThreshEFlay", 125, 1075, 110, 2000, false, false, "Linear")
                            },
                [Tristana] ={
                            [W] = CreateSkillShot ("RocketJump", 500, 900, 270, 1500, false, true, "Circular");
                            }, 
                [Tryndamere] =
                            {
                            [E] = CreateSkillShot ("slashCast", 0, 660, 93, 1300, false, false, "Linear");
                            },
                [TwistedFate] = 
                            {
                            [Q] = CreateSkillShot ("WildCards", 250, 1450, 40, 1000, false, false, "Linear")
                            },
                [Twitch] =  {
                            [W] = CreateSkillShot ("TwitchVenomCask", 250, 900, 225, 1400, nil, true, "Circular")
                            }, 
                [Urgot] =   {
                            [Q] = CreateSkillShot ("UrgotHeatseekingLineMissile", 125, 1000, 60, 1600, true, false, "Linear"), 
                            [E] = CreateSkillShot ("UrgotPlasmaGrenate", 250, 1100, 210, 1500, nil, true, "Circular" )
                            },
                [Varus] =   {
                            [Q] = CreateSkillShot ("VarusQMissilee", 250, 1800, 70, 1900, false, false, "Linear"),   
                            [E] = CreateSkillShot ("VarusE", 1000, 925, 235, 1500, nil, true, "Circular"),
                            [R] = CreateSkillShot ("VarusR", 250, 1200, 120, 1950, false, false, "Linear");
                            },
                [Veigar] =  {
                            [Q] = CreateSkillShot ("VeigarBalefulStrike", 250, 950, 70, 2000, true, false, "Linear"),
                            [W] = CreateSkillShot ("VeigarDarkMatter", 1350, 900, 225, nil, false, "Circular"),
                            [E] = CreateSkillShot ("VeigarEventHorizon", 500, 700, 80, nil, false, "Ring");
                            },
                [Velkoz] =  {
                            [Q] = CreateSkillShot ("VelkozQ", 250, 1100, 50, 1300, true, false, "Linear"),
                            [Qsplit] = CreateSkillShot("VelkozQSplit", 250, 900, 55, 2100, true, false, "Linear"),
                            [W] = CreateSkillShot ("VelkozW", 250, 1200, 88, 1700, false, true, "Linear"),
                            [E] = CreateSkillShot ("VelkozE", 500, 800, 225, 1500, nil, true, "Circular")
                            },
                [Vi] =      {
                            [Q] = CreateSkillShot ("Vi-q", 250, 1000, 90, 1500, false, false, "Linear");
                            },
                [Victor] =  {
                           [E] = CreateSkillShot ("Laser", 250, 1500, 80, 780, false, false, "Linear"),
                            },
                [Xerath] =  {
                            [Q] = CreateSkillShot ("xerathrcanopulse", 600, 1600, 100, nil, false, true, "Linear"),
                            [W] = CreateSkillShot ("XerathArcaneBarrage2", 700, 1000, 200, nil, true, "Circular"),
                            [E] = CreateSkillShot ("XerathMageSpear", 200, 1150, 60, 1400, true, false, "Linear"),
                            [R] = CreateSkillShot ("xerathmissilewrapper", 700, 5600, 120, false, true, "Circular");
                            },
                [Yasuo] =   {
                            [Q] = CreateSkillShot ("yasuoq2", 400, 550, 20, nil, false, false, "Linear"),
                            [Q3]= CreateSkillShot ("yasuoq3", 500, 1150, 90, 1500, false, false, "Linear")
                            }, 
                [Zac] =     {
                            [Q] = CreateSkillShot ("ZacQ", 500, 550, 120, nil, false, false, "Linear");
                            },
                [Zed] =     {
                            [Q] = CreateSkillShot ("ZedShuriken" 250, 925, 50, 1700, false, false, "Linear"),
                            },
                
                [Ziggs] =   {
                            [Q] = CreateSkillShot ("ZiggsQ", 250, 850, 140, 1700, true, true, "Circular"),
                            [Qb1] = CreateSkillShot ("ZiggsQBounce1", 250, 850, 140, 1700, true, true, "Circular"),
                            [Qb2] = CreateSkillShot ("ZiggsQBounce1", 250, 850, 160, 1700, true, true, "Circular"),
                            [W] = CreateSkillShot ("ZiggsW", 250, 1000, 275, 1750, nil, true, "Circular"),
                            [E] = CreateSkillShot ("ZiggsE", 500, 900, 235, 1750, true, true, "Circular"),
                            [R] = CreateSkillShot ("ZiggsR", 0, 5300, 500, nil, nil, true, "Circular")
                            },
                [Zilean] =  {
                            [Q] = CreateSkillShot ("ZileanQ", 300, 900, 210, 2000, nil, true, "Circular"),                            },
                            }
                [Zyra] =    {
                            [Q] = CreateSkillShot ("ZyraQFissure", 600, 800, 220, nil, false, true, "Circular"),
                            [E] = CreateSkillShot ("ZyraGraspingRoots", 250, 1150, 70, 1150, false, false, "Linear"),
                            [Pas] = CreateSkillShot ("zyrapassivedeadmanager", 500, 1474, 70, 2000, false, false, "Linear"),
                            }
                    } 
                 

