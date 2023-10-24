<<<<<<< Updated upstream
printl( "-----------------------------------" );
printl( "  Bot Chatter Script Initialized"    );
printl( "-----------------------------------" );

// TODO:
// --------------------------------------------------------------------------
// Add a settings folder for Admins to change convars
// Chat commands to change convars
// Better way to start the script (By a timer?)
// Make sure that the bots do not talk while talking
// --------------------------------------------------------------------------
// I had ion's vocalizer in mind when coming with random responses.

local General_ResponseConcepts = 
[
//	"PlayerLedgeHangMiddle",
//	"PlayerLedgeHangStart",
//	"PlayerLedgeHangEnd",
	"PlayerDeath",
	"PlayerLaugh",
	"PlayerYes",
	"PlayerNo",
	"PlayerSorry",
	"PlayerHurrah",
	"PlayerIncapacitated",
	"PlayerAreaClear",
	"PlayerNegative", // Swear
	"PlayerGrabbedByTongue",
	"PlayerWatchOutBehind",
	"PlayerLookHere",
	"PlayerLookOut",
	"PlayerLostCall",
	"PlayerNiceJob",
	"PlayerAlertGiveItem",
	"PlayerAnswerLostCall",
	"PlayerYellRun",
	"PlayerTaunt",
	"PlayerToTheRescue",
	"PlayerWarnCareful", 
	"PlayerHelp", 
	"PlayerReviveFriend",
	"PlayerBackUp",
	"PlayerIncoming",
	"PlayerLedgeSave",
	"RelaxedSigh",
	"ScreamWhilePounced",
	"ReviveFriendDownFinal",
	"PlayerReviveFriendCritical", // You're gonna die if you go down again
	"RevivedByDefibrillatorDelayed", // STOP SHOCKING ME
	"C2M1Falling",	// Woah Shit!
	"C5M3FirstInAlarmField",	// Alarms everywhere people
	"ResponseSoftDispleasureSwear", // OMG
	"PlayerGroundPoundedByTank", // KILL THIS THING!
	"chargerpound", // He's breaking my butt!
	"SurvivorJockeyed", // Ellis! Is that you! WTH
	"CallForRescue", // Help! I'm trapped
	"WitchGettingAngry", // That bitch is getting pissed!
// 	Blocked due to Left4Bots
//	"PlayerImWithYou",
//	"PlayerMoveOn",
//	"PlayerHurryUp",
//	"PlayerAskReady",
//	"iMT_PlayerReloading",
	"iMT_PlayerFriendlyFire",
	"iMT_PlayerWitchChasing",
	"iMT_PlayerHello",
	"iMT_PlayerAnswerReady",
	"iMT_PlayerCoughing",
	"iMT_PlayerVomitInFace",
	"iMT_PlayerGooedBySpitter",
	"iMT_PlayerNearExit", // Safehouse!
	"iMT_PlayerDeathScream", // Falling scream
	"iMT_PlayerTeamKill",	// B&W Friendlyfire
	"iMT_PlayerBattleCry", // Chainsaw killstreak
	"iMT_PlayerIncapacitatedHurt", // Ouch
	"iMT_PlayerPainNoise",	// AHHHHH!
	"iMT_PlayerTransition", // That was close
];

local Coach_ResponseConcepts = 
[
	"C5M3SeeGraveyard02", // Get Your ass moving Nick!
	"WeddingWitchDead01", // You got problems boy, deep down.
	"WorldC6M2_OnTourWalk101c", // Yes, a Shithole.
	"_C2M2_Kiddie01", // Feels like we babysitting.
	"C1M2SafeRoomb2", // Mister, I don't like your attitude.
	"WorldC6M2_InSewer202a", // Jesus, Ellis!
	"WorldC6M2_OnTourWalk103a", // Oh shut up Nick.
	"WorldC6M2_InSewer102a", // Nick, if I give you a piggyback ride, will you shut up about the sewer?
	"_C2M2_Riders04", // Singing or I love Midnight riders.
	"WorldC6M1_PostWedding01a", // No Ellis.
	"DLC1_C6M2_SafeRoomConvo12d", // Huh, historical shit?
	"_C2M2_CottonCandy01", // Cotton candy, king of foods.
	"C5M3Bodies03", // I don't know shit, we gonna keep moving.
	"_C2M1_Fall01", // Damn, I'm too old.
	"iMT_Ride", // Coach is going for a ride!
	"iMT_BurgerMeal", // BBQ Bacon Burger.
	"iMT_Pancakes", // Pancakes.
	"iMT_Hungry", // Kettlecorn, sub style, candy machine.
	"iMT_Apocalypse", // I find a burger tank.
	"iMT_Neighborhood", // THIS USED TO BE A NICE NEIGHTBORHOOD!
	"iMT_Hosanna", // Ohhh sweet hosanna!
	"iMT_Pray", // Gather around y'all.
	"iMT_Teaching", // This shits worse than teaching health class!
	"iMT_Fair", // Sounds fair.
	"iMT_Chicken", // Chicken ain't nuthin but a bird.
	"iMT_Dreaming", // Hoping for an open burger tank.
	"iMT_GetBusy", // Get busy living, or get busy dyin'.
	"iMT_Night", // Shit, looks like it's gonna be one hell of a night.
	"iMT_LouisRules", // Louis in the house!
	"iMT_Killing", // Damn right, we getting good at killing these things.
	"C6M1Intro_13e", // The boy says thank you.
	"C2M5_PlanWorked", // IT worked!
	"WorldIntroC31e3", // I'm not inviting CEDA.
	"DLC1_C6M2_SafeRoomConvo09a", // You ain't afriad of a little dirt?
	"WorldC6M1_WeddingWarn04a", // I hope we don't see a tank in a tuxedo.
	"C6M1TakeSubMachineGun01", // No Nick!
	"C6M1Intro_20d", // Yes, we are vampires.
	"_C4M3_FLOODED01", // All dat sugar...
	"DLC1_C6M2_SafeRoomConvo18c", // Girl, what are you think?
	"C5M3Jets2", // MOTHERF-!
	"_C4M5_BoatComing01", // There's Virgil!
	"WorldC6M2_Tattoo02b", // Coach got his secrets.
	"WorldSignStayInGroup2", // That's what I keep sayin'.
	"AskWhat", // What?
	"_C3M1CrazyMilitants", // I seen that movie, it don't end well.
	"WorldC3M1FerryCrossingG01", // Though I walk through the shadow of death, I will fear no evil.
	"C2M3SafeIntro011", // Nick, I was on the football team, Coach did just fine.
];

local Nick_ResponseConcepts = 
[
	"AskWhat",
	"WorldC6M2_Tattoo01b", // I'll write Greasy Pig, we all (laughs)...
	"_C2M2_Steak01", // I'll deep-fry you an entire goddamn cow.
	"RemWorldC6M1_WeddingWarn02", // Coach, no time for cake.
	"C1M3SafeRoom2a", // Anyone sees a men's store, let me know, got blood on my suit.
	"_C4M5_BoatComing01", // There's virgil!
	"DLC1_C6M2_SafeRoomConvo14f", // Yeah, no I'm good, I'm good.
	"C6M1Intro_15a", // That's terriffic cupcake, is there a man we can talk to?
	"C6M1Intro_16a", // Climb down you big ape!
	"C6M1Intro_09a", // Hey.. Hey hey!
	"_C2M2_Kiddie01", // He's like a 5 yr old, with guns!
	"WeddingWitchDead03", // That's a good one, Coach.
	"C5M2Horse001", // Nice observation Ellis.
	"DLC1_C6M2_SafeRoomConvo07a", // I think you had a better chance with that Witch.
	"C1M2SafeRoomb3", // Whatever.
	"WorldC6M2_InSewer201a", // Don't you dare!
	"WorldC6M2_OnTourWalk101a", // Shithole?
	"WorldC502SmellBath3", // You're messed up!
	"C2M3SafeIntro012", // Psh, several. Easy.
	"C5M3AlarmFieldNags02", // Your mom's car.
	"C6M1Intro_15e", // Would ya lighten up?
	"C1M1Crumbs", // Crumbs? Really Coach? That's how you swear?
	"C5M3Bodies04", // Not good.
	"WorldC6M2_InSewer101c", // Ellis. I NEED this!
	"C1M4NearFinale02a", // We're pretty screwed
	"WorldC6M1_WeddingWarn05a", // You're about to get mauled to death
	"C5M3SeeGraveyard01", // YOU SURE WE SHOULDN'T PANIC?!
	"C5M3manhole01", // Christ, not the sewers.
	"_introc1m1b08donuts", // I trust ya, you look like a man who knows his donughts.
	"_C2M1abandoned02", // Thats on theory.
	"WorldC502Horse2", // You ever eat a Horse? It's tasty.
	"WorldC6M2_FinalWater01a", // I hate you Ellis!
	"DLC1_C6M2_SafeRoomConvo08a", // What's a matter sweety, playing hard to get?
	"_C1M2Abandoned", // It's STARTING to creep you out?
	"DLC1_C6M2_SafeRoomConvo09b", // Coach, a germ just wiped out the planet, so yes!
	"WorldC6M1_PostWedding02a", // Marrying her is the last thing you should do.
	"WorldC6M2_InSewer202a", // Ugh...
	"c6M3_loss2", // I'm starting to get that feeling myself.
	"C6M2_OpenGate1a", // Ellis, what did you just do?!
	"DLC1_C6M2_SafeRoomConvo11b", // She's out of your league.
	"DLC1_C6M2_SafeRoomConvo06a", // I hate your life coach.
	"C2M5_PlanWorked", // Coach, you're a genius, this worked!
	"WorldIntroC3f2", // I can't believe none of you were going to shoot him.
	"WorldC6M2_AfterGate201a", // Not the time, Ellis.
	"DLC1_C6M2_SafeRoomConvo02b", // I don't have a problem leaving you and the car behind, Ellis.
	"DLC1_C6M2_SafeRoomConvo01b", // Go to hell.
	"_C2M2_ThisTall01", // Nope, just lots of Tanks.
	"HistoricTour01a", // Trust me, that won't be the case.
	"DLC1_C6M2_SafeRoomConvo10d", // Under the what now?
	"_C2M2_SeeSafehouse01", // Tunnel of Love? Jesus Christ!
	"C3M2SafeRoomb2", // This swamp is just a cesspool for diseases.
	"Player.WhinyNick", // Yeah sure, all for one and one for all
	"C2M3SafeIntro013", // I think we should consitute what counts as close
	"DLC1_C6M3_SafeRoomConvo05d", // What? I'm a handsome man, what can I tell ya?
	"WorldSignRestrictedArea2", // Restricted area my ass.
	"DLC1_C6M3_SafeRoomConvo02d", // You got a good feeling about every scumbag that lives on a bridge?
	"WorldC3M1FerryCrossingE03", // Jesus Christ Ellis, like the goddamn zombies aren't bad enough
	"c3m2disgust", // THIS SOME TYPE OF SICK JOKE?
	"C2M3SafeIntro009", // Not cool Rochelle.
	"C2M3SafeIntro007", // Did ya see that sign up front? Cousins only day today.
	"DLC1_C6M3_SafeRoomConvo03d", // I'm not gonna look, Ellis.
	"iMT_Quiet", // Shut up Ellis.
	"iMT_HavingFun", // Ellis, do not look like you're having fun.
	"iMT_Fantasy", // THAT has been a fantasy of mine for a long long time.
	"iMT_Angel", // Ellis look, it's another Angel.
	"iMT_ShitAir", // I'm breathing shit-air into my lungs. It's being absorbed into my bloodstream, I'm literally... full of shit!
	"iMT_Honeymoon", // Honeymoon's over. Bitch.
	"iMT_Tricked", // Can't believe you fell for thjat.
	//"iMT_Hippie", // Always a stinking hippie.
	"iMT_NotDie", // I have not, come this far, to die now!
	"iMT_Game", // Anyone up for a game?
	"iMT_Depressing", // This is more depressing than the zombies.
	"iMT_Attractive", // Or: I can try to be more attractive to greaseball bikers.
	"iMT_Fish", // Don't worry Ellis, plenty of fish in the sea.
	"iMT_LazyAss", // That's funny, because I knew your lazy ass would still be here.
	"iMT_GetRoom", // Get a room.
	"iMT_ScrewYou", // You know what, screw both of you.
	"iMT_Test", // Looks real safe. Ellis, you go test it.
	"iMT_Sevensome", // Wanna make this into a sevensome? (LMFAO)
];

local responseConcepts;
local bot = null;

// L4D1
local isFrancis = "models/survivors/survivor_biker.mdl";
local isLouis = "models/survivors/survivor_manager.mdl";
local isBill = "models/survivors/survivor_namvet.mdl";
local isZoey = "models/survivors/survivor_teenangst.mdl";
// L4D2
local isCoach = "models/survivors/survivor_coach.mdl";
local isNick = "models/survivors/survivor_gambler.mdl";
local isEllis = "models/survivors/survivor_mechanic.mdl";
local isRochelle = "models/survivors/survivor_producer.mdl";

function BotRandomChatter()
{	
	while ( bot = Entities.FindByClassname( bot, "player" ) )
	{
		if ( bot.IsSurvivor() && IsPlayerABot( bot ) )
		{
			local modelName = bot.GetModelName();
			local specificResponseConcepts;
			// Debug related
			local survivorName = "UNDEFINED MODEL:";

			// Let's have specific responses based on our playermodel
			if ( modelName == isCoach ) 
			{
				specificResponseConcepts = Coach_ResponseConcepts;
				survivorName = "Coach";
			}
			else if ( modelName == isNick ) 
			{
				specificResponseConcepts = Nick_ResponseConcepts;
				survivorName = "Nick";
			}

			if ( specificResponseConcepts != null && RandomInt( 0, 100 ) < 65 )
			{
				responseConcepts = specificResponseConcepts;
				printl( survivorName + ": Picked " + survivorName + "_ResponseConcepts" );
			}
			else // We failed to find a specific model.
			{
				responseConcepts = General_ResponseConcepts;
				printl( survivorName + " Picked General_ResponseConcepts" );
			}

			// Jab away! Time is set low for testing, have it set for 45 - 120
			DoEntFire( "!self", "SpeakResponseConcept", responseConcepts[ RandomInt( 0, responseConcepts.len() - 1 ) ], RandomFloat( 1.5, 6.0 ), null, bot );
		}
	}

	printl( "BotRandomChatter() function has been executed." );
}

// Need to run this on a timer of some sorts.
// Let's use the timer's time instead of setting it on DoEntFire
=======
printl( "-----------------------------------" );
printl( "  Bot Chatter Script Initialized"    );
printl( "-----------------------------------" );

// TODO:
// --------------------------------------------------------------------------
// Add a settings folder for Admins to change convars
// Chat commands to change convars
// Better way to start the script (By a timer?)
// Make sure that the bots do not talk while talking
// --------------------------------------------------------------------------
// I had ion's vocalizer in mind when coming with random responses.

local General_ResponseConcepts = 
[
//	"PlayerLedgeHangMiddle",
//	"PlayerLedgeHangStart",
//	"PlayerLedgeHangEnd",
	"PlayerDeath",
	"PlayerLaugh",
	"PlayerYes",
	"PlayerNo",
	"PlayerSorry",
	"PlayerHurrah",
	"PlayerIncapacitated",
	"PlayerAreaClear",
	"PlayerNegative", // Swear
	"PlayerGrabbedByTongue",
	"PlayerWatchOutBehind",
	"PlayerLookHere",
	"PlayerLookOut",
	"PlayerLostCall",
	"PlayerNiceJob",
	"PlayerAlertGiveItem",
	"PlayerAnswerLostCall",
	"PlayerYellRun",
	"PlayerTaunt",
	"PlayerToTheRescue",
	"PlayerWarnCareful", 
	"PlayerHelp", 
	"PlayerReviveFriend",
	"PlayerBackUp",
	"PlayerIncoming",
	"PlayerLedgeSave",
	"RelaxedSigh",
	"ScreamWhilePounced",
	"ReviveFriendDownFinal",
	"PlayerReviveFriendCritical", // You're gonna die if you go down again
	"RevivedByDefibrillatorDelayed", // STOP SHOCKING ME
	"C2M1Falling",	// Woah Shit!
	"C5M3FirstInAlarmField",	// Alarms everywhere people
	"ResponseSoftDispleasureSwear", // OMG
	"PlayerGroundPoundedByTank", // KILL THIS THING!
	"chargerpound", // He's breaking my butt!
	"SurvivorJockeyed", // Ellis! Is that you! WTH
	"CallForRescue", // Help! I'm trapped
	"WitchGettingAngry", // That bitch is getting pissed!
// 	Blocked due to Left4Bots
//	"PlayerImWithYou",
//	"PlayerMoveOn",
//	"PlayerHurryUp",
//	"PlayerAskReady",
//	"iMT_PlayerReloading",
	"iMT_PlayerFriendlyFire",
	"iMT_PlayerWitchChasing",
	"iMT_PlayerHello",
	"iMT_PlayerAnswerReady",
	"iMT_PlayerCoughing",
	"iMT_PlayerVomitInFace",
	"iMT_PlayerGooedBySpitter",
	"iMT_PlayerNearExit", // Safehouse!
	"iMT_PlayerDeathScream", // Falling scream
	"iMT_PlayerTeamKill",	// B&W Friendlyfire
	"iMT_PlayerBattleCry", // Chainsaw killstreak
	"iMT_PlayerIncapacitatedHurt", // Ouch
	"iMT_PlayerPainNoise",	// AHHHHH!
	"iMT_PlayerTransition", // That was close
];

local Coach_ResponseConcepts = 
[
	"C5M3SeeGraveyard02", // Get Your ass moving Nick!
	"WeddingWitchDead01", // You got problems boy, deep down.
	"WorldC6M2_OnTourWalk101c", // Yes, a Shithole.
	"_C2M2_Kiddie01", // Feels like we babysitting.
	"C1M2SafeRoomb2", // Mister, I don't like your attitude.
	"WorldC6M2_InSewer202a", // Jesus, Ellis!
	"WorldC6M2_OnTourWalk103a", // Oh shut up Nick.
	"WorldC6M2_InSewer102a", // Nick, if I give you a piggyback ride, will you shut up about the sewer?
	"_C2M2_Riders04", // Singing or I love Midnight riders.
	"WorldC6M1_PostWedding01a", // No Ellis.
	"DLC1_C6M2_SafeRoomConvo12d", // Huh, historical shit?
	"_C2M2_CottonCandy01", // Cotton candy, king of foods.
	"C5M3Bodies03", // I don't know shit, we gonna keep moving.
	"_C2M1_Fall01", // Damn, I'm too old.
	"iMT_Ride", // Coach is going for a ride!
	"iMT_BurgerMeal", // BBQ Bacon Burger.
	"iMT_Pancakes", // Pancakes.
	"iMT_Hungry", // Kettlecorn, sub style, candy machine.
	"iMT_Apocalypse", // I find a burger tank.
	"iMT_Neighborhood", // THIS USED TO BE A NICE NEIGHTBORHOOD!
	"iMT_Hosanna", // Ohhh sweet hosanna!
	"iMT_Pray", // Gather around y'all.
	"iMT_Teaching", // This shits worse than teaching health class!
	"iMT_Fair", // Sounds fair.
	"iMT_Chicken", // Chicken ain't nuthin but a bird.
	"iMT_Dreaming", // Hoping for an open burger tank.
	"iMT_GetBusy", // Get busy living, or get busy dyin'.
	"iMT_Night", // Shit, looks like it's gonna be one hell of a night.
	"iMT_LouisRules", // Louis in the house!
	"iMT_Killing", // Damn right, we getting good at killing these things.
	"C6M1Intro_13e", // The boy says thank you.
	"C2M5_PlanWorked", // IT worked!
	"WorldIntroC31e3", // I'm not inviting CEDA.
	"DLC1_C6M2_SafeRoomConvo09a", // You ain't afriad of a little dirt?
	"WorldC6M1_WeddingWarn04a", // I hope we don't see a tank in a tuxedo.
	"C6M1TakeSubMachineGun01", // No Nick!
	"C6M1Intro_20d", // Yes, we are vampires.
	"_C4M3_FLOODED01", // All dat sugar...
	"DLC1_C6M2_SafeRoomConvo18c", // Girl, what are you think?
	"C5M3Jets2", // MOTHERF-!
	"_C4M5_BoatComing01", // There's Virgil!
	"WorldC6M2_Tattoo02b", // Coach got his secrets.
	"WorldSignStayInGroup2", // That's what I keep sayin'.
	"AskWhat", // What?
	"_C3M1CrazyMilitants", // I seen that movie, it don't end well.
	"WorldC3M1FerryCrossingG01", // Though I walk through the shadow of death, I will fear no evil.
	"C2M3SafeIntro011", // Nick, I was on the football team, Coach did just fine.
];

local Nick_ResponseConcepts = 
[
	"AskWhat",
	"WorldC6M2_Tattoo01b", // I'll write Greasy Pig, we all (laughs)...
	"_C2M2_Steak01", // I'll deep-fry you an entire goddamn cow.
	"RemWorldC6M1_WeddingWarn02", // Coach, no time for cake.
	"C1M3SafeRoom2a", // Anyone sees a men's store, let me know, got blood on my suit.
	"_C4M5_BoatComing01", // There's virgil!
	"DLC1_C6M2_SafeRoomConvo14f", // Yeah, no I'm good, I'm good.
	"C6M1Intro_15a", // That's terriffic cupcake, is there a man we can talk to?
	"C6M1Intro_16a", // Climb down you big ape!
	"C6M1Intro_09a", // Hey.. Hey hey!
	"_C2M2_Kiddie01", // He's like a 5 yr old, with guns!
	"WeddingWitchDead03", // That's a good one, Coach.
	"C5M2Horse001", // Nice observation Ellis.
	"DLC1_C6M2_SafeRoomConvo07a", // I think you had a better chance with that Witch.
	"C1M2SafeRoomb3", // Whatever.
	"WorldC6M2_InSewer201a", // Don't you dare!
	"WorldC6M2_OnTourWalk101a", // Shithole?
	"WorldC502SmellBath3", // You're messed up!
	"C2M3SafeIntro012", // Psh, several. Easy.
	"C5M3AlarmFieldNags02", // Your mom's car.
	"C6M1Intro_15e", // Would ya lighten up?
	"C1M1Crumbs", // Crumbs? Really Coach? That's how you swear?
	"C5M3Bodies04", // Not good.
	"WorldC6M2_InSewer101c", // Ellis. I NEED this!
	"C1M4NearFinale02a", // We're pretty screwed
	"WorldC6M1_WeddingWarn05a", // You're about to get mauled to death
	"C5M3SeeGraveyard01", // YOU SURE WE SHOULDN'T PANIC?!
	"C5M3manhole01", // Christ, not the sewers.
	"_introc1m1b08donuts", // I trust ya, you look like a man who knows his donughts.
	"_C2M1abandoned02", // Thats on theory.
	"WorldC502Horse2", // You ever eat a Horse? It's tasty.
	"WorldC6M2_FinalWater01a", // I hate you Ellis!
	"DLC1_C6M2_SafeRoomConvo08a", // What's a matter sweety, playing hard to get?
	"_C1M2Abandoned", // It's STARTING to creep you out?
	"DLC1_C6M2_SafeRoomConvo09b", // Coach, a germ just wiped out the planet, so yes!
	"WorldC6M1_PostWedding02a", // Marrying her is the last thing you should do.
	"WorldC6M2_InSewer202a", // Ugh...
	"c6M3_loss2", // I'm starting to get that feeling myself.
	"C6M2_OpenGate1a", // Ellis, what did you just do?!
	"DLC1_C6M2_SafeRoomConvo11b", // She's out of your league.
	"DLC1_C6M2_SafeRoomConvo06a", // I hate your life coach.
	"C2M5_PlanWorked", // Coach, you're a genius, this worked!
	"WorldIntroC3f2", // I can't believe none of you were going to shoot him.
	"WorldC6M2_AfterGate201a", // Not the time, Ellis.
	"DLC1_C6M2_SafeRoomConvo02b", // I don't have a problem leaving you and the car behind, Ellis.
	"DLC1_C6M2_SafeRoomConvo01b", // Go to hell.
	"_C2M2_ThisTall01", // Nope, just lots of Tanks.
	"HistoricTour01a", // Trust me, that won't be the case.
	"DLC1_C6M2_SafeRoomConvo10d", // Under the what now?
	"_C2M2_SeeSafehouse01", // Tunnel of Love? Jesus Christ!
	"C3M2SafeRoomb2", // This swamp is just a cesspool for diseases.
	"Player.WhinyNick", // Yeah sure, all for one and one for all
	"C2M3SafeIntro013", // I think we should consitute what counts as close
	"DLC1_C6M3_SafeRoomConvo05d", // What? I'm a handsome man, what can I tell ya?
	"WorldSignRestrictedArea2", // Restricted area my ass.
	"DLC1_C6M3_SafeRoomConvo02d", // You got a good feeling about every scumbag that lives on a bridge?
	"WorldC3M1FerryCrossingE03", // Jesus Christ Ellis, like the goddamn zombies aren't bad enough
	"c3m2disgust", // THIS SOME TYPE OF SICK JOKE?
	"C2M3SafeIntro009", // Not cool Rochelle.
	"C2M3SafeIntro007", // Did ya see that sign up front? Cousins only day today.
	"DLC1_C6M3_SafeRoomConvo03d", // I'm not gonna look, Ellis.
	"iMT_Quiet", // Shut up Ellis.
	"iMT_HavingFun", // Ellis, do not look like you're having fun.
	"iMT_Fantasy", // THAT has been a fantasy of mine for a long long time.
	"iMT_Angel", // Ellis look, it's another Angel.
	"iMT_ShitAir", // I'm breathing shit-air into my lungs. It's being absorbed into my bloodstream, I'm literally... full of shit!
	"iMT_Honeymoon", // Honeymoon's over. Bitch.
	"iMT_Tricked", // Can't believe you fell for thjat.
	//"iMT_Hippie", // Always a stinking hippie.
	"iMT_NotDie", // I have not, come this far, to die now!
	"iMT_Game", // Anyone up for a game?
	"iMT_Depressing", // This is more depressing than the zombies.
	"iMT_Attractive", // Or: I can try to be more attractive to greaseball bikers.
	"iMT_Fish", // Don't worry Ellis, plenty of fish in the sea.
	"iMT_LazyAss", // That's funny, because I knew your lazy ass would still be here.
	"iMT_GetRoom", // Get a room.
	"iMT_ScrewYou", // You know what, screw both of you.
	"iMT_Test", // Looks real safe. Ellis, you go test it.
	"iMT_Sevensome", // Wanna make this into a sevensome? (LMFAO)
];

local responseConcepts;
local bot = null;

// L4D1
local isFrancis = "models/survivors/survivor_biker.mdl";
local isLouis = "models/survivors/survivor_manager.mdl";
local isBill = "models/survivors/survivor_namvet.mdl";
local isZoey = "models/survivors/survivor_teenangst.mdl";
// L4D2
local isCoach = "models/survivors/survivor_coach.mdl";
local isNick = "models/survivors/survivor_gambler.mdl";
local isEllis = "models/survivors/survivor_mechanic.mdl";
local isRochelle = "models/survivors/survivor_producer.mdl";

function BotRandomChatter()
{	
	while ( bot = Entities.FindByClassname( bot, "player" ) )
	{
		if ( bot.IsSurvivor() && IsPlayerABot( bot ) )
		{
			local modelName = bot.GetModelName();
			local specificResponseConcepts;
			// Debug related
			local survivorName = "UNDEFINED MODEL:";

			// Let's have specific responses based on our playermodel
			if ( modelName == isCoach ) 
			{
				specificResponseConcepts = Coach_ResponseConcepts;
				survivorName = "Coach";
			}
			else if ( modelName == isNick ) 
			{
				specificResponseConcepts = Nick_ResponseConcepts;
				survivorName = "Nick";
			}

			if ( specificResponseConcepts != null && RandomInt( 0, 100 ) < 65 )
			{
				responseConcepts = specificResponseConcepts;
				printl( survivorName + ": Picked " + survivorName + "_ResponseConcepts" );
			}
			else // We failed to find a specific model.
			{
				responseConcepts = General_ResponseConcepts;
				printl( survivorName + " Picked General_ResponseConcepts" );
			}

			// Jab away! Time is set low for testing, have it set for 45 - 120
			DoEntFire( "!self", "SpeakResponseConcept", responseConcepts[ RandomInt( 0, responseConcepts.len() - 1 ) ], RandomFloat( 1.5, 6.0 ), null, bot );
		}
	}

	printl( "BotRandomChatter() function has been executed." );
}

// Need to run this on a timer of some sorts.
// Let's use the timer's time instead of setting it on DoEntFire
>>>>>>> Stashed changes
BotRandomChatter();