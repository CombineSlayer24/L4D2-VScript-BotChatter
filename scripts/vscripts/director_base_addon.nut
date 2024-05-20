Msg( "-----------------------------------\n" );
Msg( "  Bot Chatter Script Initialized\n"    );
Msg( "-----------------------------------\n" );

// TODO:
// --------------------------------------------------------------------------
// Add a settings folder for Admins to change convars
// Chat commands to change convars
// Make sure that the bots do not talk while talking (Is this possible?)
// --------------------------------------------------------------------------
// ion's vocalizer is required, for those snooping in here.
// Credit to ChimiChamo for inspiration and for some code as like a base of some sorts.

local General_ResponseConcepts =
[
	"PlayerLedgeHangMiddle",
	"PlayerLedgeHangStart",
	"PlayerLedgeHangEnd",
	"PlayerDeath",
	"PlayerLaugh",
	"PlayerYes",
	"PlayerNo",
	"PlayerSorry",
	"PlayerHurrah",
	"PlayerChoke",
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
	"UseAdrenaline",
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
//	"PlayerEmphaticGo",
	"PlayerHeardCharger",
	"PlayerHeardJockey",
	"PlayerHeardSpitter",
	"PlayerHeardWitch",
	"PlayerHeardSmoker",
	"PlayerHeardHunter",
	"PlayerHeardBoomer",
	"PlayerWarnCharger",
	"PlayerWarnJockey",
	"PlayerWarnSpitter",
	"PlayerWarnSmoker",
	"PlayerWarnHunter",
	"PlayerWarnBoomer",
	"PlayerWarnTank",
	"iMT_PlayerGetToVehicleBoat",
	"iMT_PlayerGetToVehicleChopper",
	"iMT_PlayerGetToVehicleWheel",
	"iMT_PlayerReloading",
	"iMT_EllisStories",	// Now the best time?
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
	"iMT_PlayerIncapacitatedHurt", // AHHHHH!
	"iMT_PlayerPainNoise",	// Ouch
	"iMT_PlayerTransition", // That was close
	"iMT_PlayerGoingToDie",
	"iMT_PlayerBreathing",
	"iMT_PlayerKilledZombie", // Got it
	"iMT_SurvivorWasPounced",
	"iMT_PlayerNiceShot",
	"iMT_EllisStoryInterrupt",
];


local Coach_ResponseConcepts =
[
	"_C1M1_ElevatorHello", // Hello, My name is Coach
	"C6M1_IntotheparkNoHealth",
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
	"_C2M1_Fall02", // You a crazy man, Ellis .
	"c6M3_loss2", // I think we all losin' people.
	"WorldC3M1FerryCrossingD02", // Sometimes it's best not knowing.
	"WorldC3M1FerryCrossingI03", // Look at you youngin', giving Nick some shit back.
	"_C1M1_ElevatorHello2AliveExtra2", // You're going to make it.
	"DLC1_C6M3_SafeRoomConvo02e", // Sometimes, you got to have faith nick.
	"C5M5_saferoom005", // Well, you're free to make yourself a new life in here Nick.
	"_c4m2_waterpool02", // First the plague, now the flood.
	"Player.CoverMeC1RCoach2", // I ain't never done this before.
	"WorldSignWhereIsCEDA2", // Zombified
	"C5M3Bodies01", // How does being so right feel Nick!?
	"WorldC502NotZombies3b", // Yeah, true that.
	"_C1M1_ElevatorHello05c", // Let's stay together for a little while longer, Okay Nick?
	"InfoRemc3m2_parachutist2", // Why would you ever jump out of a plane?
	"WorldIntroC3e1", // Can I get a little warning?
	"C3M3SafeRoom2b2", // Ok, this just makes me sad.
	"C5M2_signcontagious01", // Sure is.
	"DLC1_C6M2_SafeRoomConvo13d", // There you go Nick, stay positive.
	"DLC1_C6M2_SafeRoomConvo01a", // Nick, son. I think we got bigger problems.
	"C5M1_intro008", // ON THE OTHER MOTHER F'ING SIDE OF THE WATER.
	"C6M1Intro_13b", // You've been killing zombies for the better part of 2 days boy, you can talk to a girl.
	"WorldC502Smell2", // Smells like people been living here and shit.
	"WorldC6M2_InSewer101a", // Nick my man, face it. We're walking through shit.
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
];

local Nick_ResponseConcepts =
[
	"_C1M1_ElevatorHello", // Name's Nick.
	"C6M1_IntotheparkNoHealth",
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
	"C5M4JetPlanes", // Shut up Ellis.
	"C4M1_NoGas01", // There goes our milkrun
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

local Ellis_ResponseConcepts =
[
	"_C1M1_ElevatorHello", // Folk's call me Ellis.
	"C6M1_IntotheparkNoHealth",
	"WorldC6M1_WeddingWarn03c", // What?
	"_c2m3_coaster03", // Oh my god, it's Christmas!
	"C1M2SafeRooma2", // Heh heh, zombie apocalypse ain't all bad.
	"C1M3SafeRoom2e", // Amen.
	"_c2m3_coollight01", // This is awesome, man!
	"_C4M5_BoatComing01", // VIRGIL, WHAT'S UP BROTHER?!
	"C1M4SafeRoom2b3", // That man is an American hero.
	"WorldC3M1FerryCrossingJ3", // I knew it, all this runnin' around and climbing stuff is making me buff as hell.
	"C1M4SafeRoom2a5", // Now hold one second, you've been making jokes about JGJ.
	"C6M2_OpenGate1b", // Hey!
	"C5M5_Button2205", // Man, we're like fightin' zombie machines and shit.
	"WorldC3M1FerryCrossingM4", // Oh come one, that was fun.
	"C5M3SeeGraveyard06", // You can't shoot a ghost Nick.
	"WorldC6M2_FinalWater01b", // Well, I still like you Nick.
	"InfoRemC3M2Bathtub2", // Have you smelled yourself lately?
	"WorldC502Smell2", // I don't know, smells nice though.
	"DLC1_C6M2_SafeRoomConvo03b", // JUST A CAR?!
	"C1M2InsideGunShopPickupResponse", // Dang, Ro! Listen to you, you sound like my mama.
	"C6M1Intro_01c", // Oh come on man.
	"C5M3Sniper01", // Man, this is giving me creeps more than them zombies.
	"WorldSignC5AlarmWillSound3d", // Oh Okay, Okay, I get it.
	"WorldC502Horse3", // You're sick, you know that?
	"WorldC6M1_WeddingWarn03a", // Shut up Nick.
	"_C2M2_Peanut01", // How can you guys not like Lil' Peanut?
	"C2M1Intro009", // That's not cool, Nick.
	"_c2m3_cement01", // Yeah, very funny.
	"C5M3StopZombies", // It's still pretty.
	"EllisStoryReac01", // Okay.
	"C5M1_intro007", // No sense in hanging out here.
	"_C4M4_FLOODED01", // It's like a fabled city of Atlantis.
	"c1m4jimmyidea", // Man... This is just awful.
	"DLC1_C6M2_SafeRoomConvo21b", // I've seen my fair share of horror movies.
	"C3M2SafeRoomb3", // Nick does have a point.
	"DLC1_C6M2_SafeRoomConvo19e", // Find a nice open stretch. Like in that boxing movie.
	"WorldC3M1FerryCrossingk3", // Shit, that's just gross.
	"C6M1Intro_23b", // We uh, need some type of password, or something?
	"C3M2SafeRooma2", // You could try covering yourself in mud.
	"c2m5_intro009", // What's next? Dino's shooting lasers out of their eyes?
	"C2M3SafeIntro010", // Dude, I got no love for these zombies.
	"WorldC6M2_OnTourWalk102b", // Nick! We all see that the tour's got problems.
	"C6M1Intro_13f", // Coach, Come on man!
	"WorldIntroC31c1", // Oh man that was some crazy shit.
	"DLC1_C6M3_SafeRoomConvo04d", // Nick, I don't need that kind of pressure.
	"C6M1Intro_13c", // She's an angel.
	"C6M1Intro_24e", // Oh, I gotcha.
	"_C1M1_ElevatorHello03a", // Well, my name is Ellis.
	"DLC1_C6M3_SafeRoomConvo09a", // Nick, by the way, I have to borrow your suit.
	"_C2M2_Slide01", // Why y'all in a hurry for? This is awesome.
	"WorldC3M1FerryCrossingA01", // I know plenty of swamps.
	"WeddingWitchDead02", // Whole thing just makes me feel uncomfortable
	"RemWorldC6M1_WeddingWarn02", // Ain't seen none Coach.
	"WorldC502OfficialInstructions", // Kill all son's of a bitches.
	"C5M3Bodies01", // People shootin' people?
	"WorldC502BusStory2b", // Nick, you ever been to graceland? Man y'all should've come, it was so much fun.
	"DLC1_C6M3_SafeRoomConvo07c", // Yeah, it was love at first sight.
	"DLC1_C6M3_SafeRoomConvo08c", // I will kill him. I will kill him.
	"c6m3_loss2", // I like your attitude.
	"DLC1_C6M3_SafeRoomConvo03c", // You got a turd on your shoulder, Nick.
	"WorldC3M1FerryCrossingE02", // They grow people to eat.
	"C2M3SafeIntro006", // This ain't that kind of ride, Nick.
	"WorldC3M1FerryCrossingG02", // I'm walking through that valley, kickin' ass.
	"WorldC3M1FerryCrossingB01", // This says I'm a bad-ass zombie killin' machine.
	"DLC1_C6M3_SafeRoomConvo01a", // Rochelle and biker dude, sitting in the tree. K-I-S-S-I-N-G.
	"iMT_EllisStories", // Story Time Ellis.
	"iMT_Singing", // Gotta reach for the top, stay on the mountain!
	"iMT_AllAboard", // Choo Choo! All aboard!
	"iMT_SayingZoey", // Zoey Zoey Zoey, I love saying that.
	"iMT_Marriage", // I should totally marry that girl.
	"iMT_TeamFortress2", // Dude this like TF2.
	"iMT_Tattoos", // Tattos!
	"iMT_Candy", // Oh man, I found a candy bar.
	"iMT_CaCaw", // Ca Caw Ca Caw Ca Caw!
	"iMT_Madam", // Yes Ma'am.
	"iMT_Biscuit", // Butter my butt and call me a biscuit.
	"iMT_Comedian", // You're a real comedian Nick.
	"iMT_Dog", // Can we not talk about dogs!?
	"iMT_InLove", // Man, a girl who can shoot? I am in love.
	"iMT_FeelHer", // We're getting close, I can feel her.
	"iMT_InHonor", // I'm going to kill a tank for her honor.
	"iMT_Break", // If anyone needs a bathroom break, now is the time.
	"C5M4JetPlanes", // Nick, they can't hear you in jet planes.
	"C2M1Intro008", // I love you.
];

local Rochelle_ResponseConcepts =
[
	"_C1M1_ElevatorHello", // Hello, My name is Rochelle
	"C6M1_IntotheparkNoHealth",
	"AskWhat", // What?
	"WorldC6M1_PostWedding02a", // Is that how your brains really work?
	"DLC1_C6M2_SafeRoomConvo20a", // Well anyone who survives this shit is gonna be in great shape.
	"C1M3SafeRoom2e", // Amen
	"DLC1_C6M2_SafeRoomConvo08f", // He is better looking than you.
	"_C4M5_BoatComing01", // There's Virgil!
	"C6M1Intro_10d", // See Nick, you should try being nice.
	"C6M1Intro_18b", // I wanna call you an Asshole, really.
	"C6M1Intro_15c", // You used to be a can artist?
	"C6M1Intro_06d", // Then it's a date.
	"_C2M2_Kiddie02", // Ah, to hell with it. Whooo, Kiddie land!
	"DLC1_C6M2_SafeRoomConvo19a", // You lookin' good Coach
	"WorldSignReportSick3", // Don't worry Ellis, they mean the flu, not in the head.
	"C6M1Intro_22a", // Oh thank god! I thought I was the last woman on Earth.
	"WorldC6M2_OnTourWalk101a", // Shit-hole? Sorry Coach.
	"C3M2SafeRoom2d", // The white suit with zombie brains on it, that one?
	"_C2M2_Okra", // You don't like fried Okra?
	"C6M1Intro_20d", // Oh, Okay then. Yes, we are all Vampires.
	"C6M1Intro_17d", // Well shit.
	"WorldC502ArmYourself", // I thought all you yokels had guns.
	"C6M1Intro_22f", // [sighs] If that's what we gotta do, that's what we gotta do.
	"C1M2SafeRoomd2", // I bet you're right.
	"PlayerPickupFirstSMG2", // I guess I don't have much choice.
	"_C2M2_Kiddie05", // He is making the best out of a bad situation
	"C5M1Flyby02", // I'm going to take that as a good sign.
	"WorldC6M2_InSewer202a", // I'm not.... laughing, Ellis.
	"WorldC6M1_WeddingWarn03b", // WOULD YOU GUYS SHUT UP!
	"C5M5_Button2207", // That's sweet.
	"C1M2SafeRoomd2a", // A gun STORE?
	"C6M1Intro_05c", // You aren't from around these parts?
	"_C4M5_Intro04", // Sounds like a plan.
	"DLC1_C6M2_SafeRoomConvo03c", // Calm down Ellis.
	"C2M3SafeIntro009", // I never liked the Tunnel of Love.
	"_C2M2_Riders03", // I hate classic rock.
	"DLC1_C6M2_SafeRoomConvo17b", // Does anyone want to put a vote?
	"DLC1_C6M2_SafeRoomConvo06a", // I have memories too.
	"WorldC6M2_Tattoo02d", // Ugh
	"C1M4NearFinale03a", // I'm getting strong "we're not getting resuce" vibes here.
	"DLC1_C6M2_SafeRoomConvo14e", // Hey Nick, there's a -
	"WorldC6M2_InSewer101a", // Nick, I'm pretty sure this is sewage.... Yeah, it is.
	"WorldC6M2_OnTourWalk102b", // Shut up, Nick.
	"C1M2SafeRoomb3", // Ok Nick, being an asshole may have worked before.
	"WeddingWitchDead01", // Nick, you scare me.
	"DLC1_C6M2_SafeRoomConvo01a", // Compared to you Nick, he was downright nice.
	"Player.NotPackingHeat2", // OH, you meeting some friends?
	"C5M3Jets3", // NO NO NO NO.... NOOOO!
	"_C2M1MonsterTruck", // If JGJ have driven a monster truck.
	"_C2M1abandoned02", // That's probably it.
	"C6M1Intro_19b", // That sounds simple.
	"C5M4BombIntA", // They are not checking for survivors anymore.
	"C3M3SafeRoom2a3", // Oh zombie swamp people, I'm sorry but I have to shoot you.
	"C6M1Intro_18d", // It isn't worth getting to the other side?
	"DLC1_C6M3_SafeRoomConvo06a", // Someone has a crush on that "awesome" biker dude.
	"DLC1_C6M2_SafeRoomConvo03a", // You'll be with her soon, also it's a car, and it's creepy.
	"_C1M1_ElevatorHello2AliveExtra2", // comeoncomeoncomeon
	"DLC1_C6M3_SafeRoomConvo09b", // I uh... lucky girl?
	"C5M1_intro010", // With our luck, it's just a bridge monster
	"_C2M2_ThisTall01", // Soo many Tanks.
	"WorldC6M1_WeddingWarn03a", // It's funny that she's wearing a dress, but SHE WILL KILL YOU.
	"_C2M2_Steak01", // I'm buying everyone [x] guns.
	"C2M3SafeIntro010", // Gee, my bedroom was baby blue. I think my dad wanted a boy.
	"DLC1_C6M3_SafeRoomConvo04d", // Nick is jelous.
	"C6M1Intro_24b", // There's no such thing as aliens.
	"iMT_Tits", // We are here, cresant city. I tell you now, I am not showing anyone my tits.
	"iMT_NoNoNo", // No no no no nooo.
	"iMT_Charming", // Oh Nick, charming isn't the word I'd describe you with.
	"iMT_Wedding", // Hey Ellis, it's a nice day for a white wedding.
	"iMT_NickOCD", // I'm not gonna worry about cooties, Nick.
	"iMT_LoveGuns", // But I'm starting to love guns.
	"iMT_NoSex", // Not if you're the last man on Earth
	"iMT_Popcorn", // Popcorn, I love popcorn. You Coach?
	"iMT_Kitchen", // No one better make a crack about me in the kitchen.
	"iMT_Aye", // Aye...
	"iMT_Stomach", // I HEAR A HUN - Coach, is that your stomach?
	"iMT_Something", // Something old, something new, something about to rip your guts apart.
	"iMT_Turd", // Nick, you got a turd on your shoulder.
	"iMT_NewVoices", // It's nice to hear some new voices.
	"iMT_WhereFrom", // Wow, where the hell did you come from?
	"iMT_Learning", // I didn't know learning could be this much fun.
	"iMT_Hate", // Yeah, I hate stuff too.
	"iMT_Bothering", // Ellis! Quit bothering these poor people.
];

local Francis_ResponseConcepts =
[
	"ConceptBlock049", // What?
	"ConceptBlock629", // Whatever you say, professor Monster.
	"ConceptBlock607", // What if just your beard starts to turn, can I shoot that?
	"CrashCourseR09", // Ha ha ha ha, this is the one you're gonna die in.
	"IntroCrashR23", // And it turns out, I was right about that.
	"CrashFinaleGenerator2Speak", // various generator quotes
	"ConceptNuttier", // I'm gonna tear that bell down, and shove it up your ass.
	"ConceptBlock515", // Uh... Hello.
	"ConceptBlock019", // Everyone is a zombie, or an asshole.
	"C7M3_saferoom004b", // You're such a nerd.
	"ConceptBlock710", // I hate hospitals.
	"C7M1_saferoom17", // I hate islands.
	"C7M3_saferoom001", // Can we all get our own?
	"C7M2_saferoom02c", // Bullshit, say "Bill's an idiot" in Japanese.
	"C7M3_saferoom016c", // It's mental illness.
	"Smalltown04_path05a", // I'm coming Bill, keep your beard on.
	"IntroCrashR06", // Well, it's pretty complicated.
	"C7M1_saferoom21a", // Nah, don't worry. I hate boats too.
	"ConceptBlock721", // [laughs] Go to hell.
	"CrashCourseC01", // Ehhh, I doubt it
	"ConceptBlock558", // Have a heart, we got a helpless old man with us.
	"ConceptBlock637", // Long enough to know that you got a pretty mouth.
	"IntroCrashR18", // Cuz, it's money in the bank, remind me to explain gambling to you sometime.
	"ConceptBlock697", // Whatever.
	"ConceptBlock635", // Look on the bright side, if we don't make it, I'll still be handsome.
	"InfoRemc7m1_tankcar01", // Tanks?
	"CrashYerKidding", // Yer kidding, right?
	"hospital03_path08a2", // Woah, hey. That's uncalled for.
	"airport04_08a", // Bill? I was the one that who said that.
	"c6m3_outroL4D108a", // Nope, I haven't heard that one.
	"C6M1Intro_01b", // Nope!
	"InfoReminfo_powerboat4a", // Quiet Zoey.
	"C7M1_saferoom21", // Aye aye, Captain.
	"NeedsHelpResponseLouisB2", // I mean, I'm cool with that.
	"CrashCourseR10", // Nice one
	"C6M1Intro_10a", // Bite me.
	"CrashFinaleGeneratorUnPressSpeak", // Damnit!
	"C7M1_saferoom14a", // Hey, I ain't the one who though we can drive a train in the ocean.
	"ConceptBlock712", // Y'know what I don't hate? I don't hate vests.
	"CrashCourseR13", // I hate steam..... pipes.
	"c6m3_loss", // There's not many of us left, brother.
	"C7M1_saferoom13", // I think those are Bill's tears.
	"C7M1_saferoom05", // Louis, tell Zoey that I don't know what's going on.
	"IntroCrashR26", // Not even WEARIN' chaps.
	"SmallTown02_path01c", // You know what, I just realized I don't care, lead on!
	"C6M1Intro_05d", // No Ma'am.
	"C7M1_saferoom15b", // Hey Louis, I never thought I say, but I wanna hang out with you.
	"RiversideIsDeadPlan", // That's better than my plan.
	"C7M1_saferoom18a", // Okay, I vote for the island paradise where we don't have to fight zombies.
	"C7M1_saferoom07a", // What? We aren't gonna try and drive it on the ground?
	"ConceptBlock632", // Most people'll do anything if a cop tells them to.
	"C6M1Intro_20e", // Louis, I told you they're vampires.
	"C6M1Intro_09c", // I was talking to the little lady.
	"C6M1Intro_24b", // Yeah, yeah! that's what i've been saying.
	"C7M1_saferoom12a", // Really? This is you pissed?
	"IntroCrashR02", // I guess i DID tell ya.
	"InfoRemc7m1_pretank01", // Fine with me.
	"CrashCourseR11", // Unless it's lasagna monday, I love lasagna.
	"elevator_conversation", // Random Converstation
	"C7M1_saferoom06", // Found one.
	"C7M3_saferoom014b", // I don't know, I like to eat them.
	"IntroCrashR04", // Alright, i'll give you that.
	"iMT_Hate", // I hate -
	"iMT_Waterworks", // Waterworks?
	"iMT_FrozenBeard", // Hey Bill, your beard is frozen.
	"iMT_ImACop", // No no no, I AM a cop.
	"iMT_Brave", // Jesus i'm brave.
	"iMT_GodIsDead", // So God's dead huh?
	"iMT_Hersch", // I drove for hersch once...
	"iMT_Dog", // I wonder what happenend to that dog.
	"iMT_Predict", // I could've predicted
	"iMT_WomanOfTaste", // What?  She's a woman of taste.
	"iMT_Recycle", // Those guys recycle anything.
	"iMT_HateToo", // oh my god. YOU HATE STUFF TOO?
	"iMT_Hero", // Yeah yeah, we get it, you're a hero.
	"iMT_YourName", // What's your name again?
	"iMT_LoveRo", // Bye bye ro, I love you!
	"iMT_ShotHim", // Bill woud've shot him
	"iMT_Slow", // Taking it slow huh?
	"iMT_ThisFar", // never thought a fancy ass would make it this far.
];

local Louis_ResponseConcepts =
[
	"ConceptBlock050", // What?
	"C7M1_saferoom12", // Yeah. I'm pissed.
	"ConceptBlock717", // I gotta bad feeling about this.
	"InfoRemc7m1_pretank02", // Me?!
	"airport04_08b", // You're joking, right?
	"CrashFinaleGenerator2Speak", // Generator related starting.
	"C7M3_saferoom003a", // Holw old are you Bill?
	"ConceptBlock515", // Hello?
	"ConceptBlock019", // I'm going to beat you to death with my gun!
	"ConceptBlock652", // Whistle
	"CrashCourseB01", // Canada? Francis, we're in Pennsylvania.
	"C7M3_saferoom004", // I can make a firewall.
	"ConceptBlock645", // I ain't dying man.
	"ConceptBlock658", // We are unstoppable.
	"C7M3_saferoom017g", // Punk-ass island bitch!
	"IntroCrashR24", // Find yourself a parade.
	"CrashCourseR04", // I'll be damned Francis, whne did you learn to read?
	"ConceptBlock628", // They're zombies, Francis.
	"TakeShotgunGroovyLouis", // Giggle
	"IntroCrashR09", // For once, we're in complete agreement, Francis.
	"ConceptBlock619", // Humanity's gonna bounce right back up, you watch.
	"IntroCrashR22", // Five minutes ago, you hated flying.
	"IntroCrashWalkingB", // I have a bad feeling about this.
	"CrashCourseI01", // Sounds good.
	"C7M3_saferoom006b", // No more internet, no more xbox, no more nothing.
	"C7M2_saferoom02", // Taki, I love you, goodbye.
	"Farm01_path03a", // I bet your country-ass DOES likes this trailer.
	"C7M3_saferoom009a", // I like the sound of that.
	"SmallTown02_path01b", // Interesting true story, in 1975, the local township -
	"IntroCrashR13", // Have you tried turning it off and on again?
	"C7M3_saferoom016d", // Hey Francis, I got a good feeling of wearing your skin.
	"hospital04_path02a", // It's good for you Bill. Cardio.
	"C7M3_saferoom016b", // I'm in too good of a mood to get mad at you Francis.
	"C7M3_saferoom007c", // I don't remember what that feels like.
	"C7M1_saferoom05a", // I think she's mad at Bill.
	"IntroCrashR31", // On the bright side, look at all the great scenery we would've missed.
	"CrashFinaleGeneratorUnPressSpeak", // Damnit!
	"C7M1_saferoom21", // Francis, am I alone in hating boats?
	"C7M1_saferoom22a", // I'm trying Bill.
	"C7M3_saferoom010a", // I've always wanted to learn how to fish.
	"C7M3_saferoom015a", // Just a good feeling, i guess.
	"c6m3_outroL4D102a", // It was nice to see normal people for once.
	"IntroCrashR17", // Francis, why would you bet that we're doomed?
	"C7M3_saferoom013c", // Man, this is going to be the long rest of our lives.
	"C7M1_saferoom24", // Way to go Francis, some carido is just want we needed.
	"C7M1_saferoom15c", // Well thanks man.
	"ConceptBlock640", // That's what I'm talking about
	"IntroCrashR03", // We walking away from it, ain't we?
	"IntroCrashR37", // I bet we ain't going to see any more witches.
	"C7M2_saferoom04", // I think this island is the only chance we got.
	"c6m3_outroL4D106a", // Go Ellis.
	"C7M2_saferoom05c", // Let's make of note of that next time.
	"C7M1_saferoom08a", // I'd like to see that too.
	"RiversideIsDeadPlan", // Okay...
	"CrashCourseA01", // If it gets us to a safe zone.
	"Farm03_path01a", // Stay positive guys, I got a good feeling.
	"c6m3_loss2", // Hope if you don't mind we stay on our own.
	"C7M1_saferoom06b", // And it's on fire.
	"hospital04_path04a", // Get to the elevator
	"CrashCourseR10", // Farting...
	"C7M1_saferoom25b", // How can we be sure they're immune
	"C14M2NoteLighthouse2", // I got a bad feeling about this one.
	"iMT_TankFactory", // Hey Francis, what do they make at the tank factory?
	"iMT_GordonFreeman", // I feel like I'm gordon freeman.
	"iMT_Hero", // I outta start callin' you Jason.
	"iMT_Belch", // *Burp* 'scuse me.
	"iMT_Apocalypse", // Oh it's a bitch apocalypse now, bitch!
	"iMT_CounterStrike", // Grabbing a machine gun / Oh man, this is just like Counter-Strike!
	"iMT_CubScouts", // Any you guys cub scouts?
	"iMT_Alley", // Francis, wasn't this the alley you were born in?
	"iMT_Recycle", // I can't wait to recylce shit again.
	"iMT_Introduction", // Hi, I'm Louis.
	"iMT_SeeingMore", // Gonna be seeing more of that guy.
	"iMT_Believing", // Francis said you weren't gonna make it.
	"iMT_IT",
	"iMT_MadeIt", // Hey, you made it!
	"iMT_RifleRange", // Guys used to laugh at me at the rifle range.
	"iMT_ShotHim", // You're right Francis, he's not friendly. Bill would've shot him.
	"iMT_New", // Is that a NEW zombie?
	"iMT_BackToNormal", // I'm teaching your ass how to read.
];

local Bill_ResponseConcepts =
[
	"ConceptBlock051", // Wat?
	"ConceptBlock639", // I'll see peace back on earth if I have to murder these bastards with my bare hands.
	"C7M3_saferoom003c", // They didn't have electricity when I was born.
	"ConceptBlock611", // We're fighting a war of attrietion.
	"C7M3_saferoom003", // Bahhh, keep your computers, emails.. just give a pen and paper.
	"CrashFinaleGenerator2Speak", // Generator
	"C7M1_saferoom25a", // Out here, they're immune or dead.
	"ConceptBlock515", // Hello?
	"ConceptBlock025", // Son, we're immune, we're tired and there's infected in the damn woods.
	"ConceptBlock556", // Hey!
	"C7M1_saferoom06b", // And it's on fire!
	"InfoReminfo_carnotboat", // Francis that's a car!
	"InfoRemc7m2_seebarge01", // You know how to pilot these things, Fracis?
	"C7M3_saferoom010b", // I'll make you into a pro.
	"C7M1_saferoom16a", // You gettin' tired Francis?
	"C7M1_saferoom13a", // I'll give you something to cry about.
	"ConceptBlock608", // Teasing
	"ConceptBlock696", // They're zombies francis
	"ConceptBlock715", // Giggle
	"CrashFinaleGeneratorSpeakN", // Dahh, I'm too old for this shit.
	"C7M1_saferoom21b", // Francis, you would've been walking the plank.
	"airport04_08c", // Christ almighty...
	"C7M1_saferoom01a", // Shut up Francis.
	"C7M1_saferoom24a", // You're a regular health nut
	"InfoReminfo_trailerboatruck", // Cut the horseshit Francis.
	"C7M1_saferoom22", // It'll do you good, son.
	"InfoReminfo_trailerboat", // Son, that's a trailer and you're an idiot.
	"InfoRemInfo_powerboat", // Sail boat, Francis.
	"C7M3_saferoom012f", // Noted, let's go.
	"hospital04_path04a", // Elevator
	"C7M2_saferoom07", // We'll find it, we'll find it.
	"hospital04_path01a", // I've smelled worse.
	"C7M1_saferoom08b", // Both of you, shut up.
	"airport04_08a", // What'd I tell ya?  They tried to stop people from leaving.
	"C7M1_saferoom12b", // Shut your traps, let's move out.
	"InfoRemc7m1_harborblocked01", // Louis, the ocean doesn't flow into the river.
	"C7M1_saferoom04b", // 'Cause we ain't stoppin' for gas.
	"CrashFinaleGeneratorUnPressSpeak", // Generator
	"ConceptBlock652", // Humming
	"ConceptBlock711", // Francis, is there anything you don't hate?
	"C7M2_saferoom05b", // Shut up Franc--, alright that's not a bad idea.
	"NeedsHelpResponseLouisC2", // I'm kidding, let's go get him.
	"ConceptBlock663", // Woah-ho-ho.
	"ConceptNuttier", // This guy's nuttier than candy bar shit.
	"C7M1_saferoom20b", // Zoey, I can't.
	"C7M1_saferoom03", // Nope. Gotta be a sail boat.
	"ConceptBlock648", // What the hell was that?
	"InfoReminfo_sunkboatthere01", // Francis, that boat's underwater.
	"hospital02_path03c1", // Going to have to go top side.
	"Farm05_Path09C", // The honest to God military!
	"C7M2_saferoom01a", // Zoey. Listen. The four of us are all that matters now.
	"C7M1_saferoom23a", // Zoey...  I'm not leaving any of you behind.
	"C7M1_saferoom10b", // This isn't gonna be easy.
	"IntroAirport01bb", // A C-130 is nice flying.
	"ResponseWeCanStill", // Damn straight!
	"DontBeAnAss", // Don't be an ass Francis
	"C7M1_saferoom14", // You ever get tired of being an idiot Francis?
	"C7M2_saferoom06", // Dammit, Zoey! We trusted CEDA! We trusted the military!
	"C7M1_saferoom09a", // That was my plan.
	"IntroHospital03", // Good thinking!
	"elevator_conversation",
	"hospital02_path03b1", // This seems too easy.
	"RiversideIsDeadPlan", // Alright, let's do it then.
	"C14M2NoteLighthouse2", // I have a bad feeling about this.
	"iMT_Cold", // Is it too cold for you crybabies?
	"iMT_10Miles", // walked through 10 miles.
	"iMT_GoodEnough",
	"iMT_Stink", // Francis, is that you or the sewer?
	"iMT_GoodRun", // I had a good run (rest in piece Bill)
	"iMT_ShoeLeather",
	"iMT_JobDone", // My jobs done.
	"iMT_Woods", // Woods thicker than boomer shit.
	"iMT_LastFight", // You're too late!
	"iMT_Mad", // Zoey? You still mad?
	"iMT_Hallelujah", // Hallelujah!
	"iMT_Lonely", // I was getting lonely.
	"iMT_Home", // Francis, does this look like home to you?
	"iMT_FirstStep", // That first step'll kill you.
	"iMT_BigMouth", // Looks like yer big mouth still works.
	"iMT_Phone", // No one's gonna be answering that phone.
	"iMT_Family", // The only family i've got!
];

local Zoey_ResponseConcepts =
[
	"ConceptBlock052", // What?
	"ConceptBlock647", // Game over man
	"C7M3_saferoom016c", // I hate putting the lotion in the basket.
	"CrashCourseR12", // I love steam!
	"C7M1_saferoom09b", // Whatever
	"CrashFinaleGenerator2Speak",
	"ConceptBlock037", // What a dick!
	"ConceptBlock515", // Hello
	"ConceptBlock032", // Open the damn door!
	"C7M3_saferoom004b", // Ohhh booo!
	"CrashCourseB01", // Canada? Francis, we're in Pennsylvania.
	"ConceptBlock652", // So uh, yeah.
	"BounceReaction", // I'm ready to bounce
	"C6M1Intro_22b", // Yeah, I had that feeling as well.
	"C6M1Intro_15b", // ohh boo
	"C7M3_saferoom005", // would've picked 10 movies.
	"CrashCourseR01", // Birds are dicks.
	"CrashCourseR03", // The pilot was a ZOMBIE
	"ConceptBlock643", // Oops, sorry.
	"C7M3_saferoom006c", // No more human race.
	"C7M2_saferoom05b", // Because Franci-- yeah, what the hell Bill?
	"C7M1_saferoom18", // I'd like to put a vote.
	"CrashCourseR11", // I love lasagna
	"C7M1_saferoom23", // Maybe we can meet some new people.
	"ConceptBlock620", // You're an optimist Louis, I'll give you that.
	"CrashCourseR10", // Heh, nice.
	"InfoReminfo_powerboat4", // Francis, do you even know what asailboat looks like?
	"CrashFinaleGenerator2OnSpk", // Come to mama.
	"C7M2_saferoom01b", // Bill, I'm not ready to give up.
	"IntroCrashR01", // Ugh, do you HATE them?
	"c6m3_outroL4D109a", // Sure you are Francis, sure you are.
	"c6m3_outroL4D104a", // Francis, It's nice to see that still in you.
	"IntroCrashR10", // I knew it was too good to last.
	"C7M1_saferoom19a", // Louis, you of all people should understand.
	"c6m3_outroL4D105a", // Where? At the mall?
	"C6M1Intro_15d", // I could shoot you where you stand.
	"C6M1Intro_23a", // Not exactly.
	"c6m3_outroL4D103a", // It's hard enough.
	"c6m3_outroL4D107a", // Yeah, for about 10 minutes.
	"airport04_08d", // Right...
	"c6m3_outroL4D102b", // Don't worry, they won't be the last.
	"PlaneCrashResponse", // Holy shit!
	"IntroCrashR09", // Seconded, what the hell.
	"C7M1_saferoom02", // Yeah, or Bill will you leave.
	"c6m3_outroL4D101a", // Yeah, but... it's us three now.
	"TakeShotgunGroovyZoey", // Groovy.
	"C7M1_saferoom11", // Those ppl still dead?
	"IntroCrashR11", // The shitty pilot's store?
	"C7M3_saferoom007b", // I think that means we're safe.
	"IntroHospital02", // Good thinking.
	"elevator_conversation",
	"airport04_08b", // They were trying to stop the infection.
	"IntroCrashR04", // At least we got out of the city.
	"IntroCrashR07", // You what? Francis, are you alright?
	"iMT_Yoink",
	"iMT_NervousHumming",
	"iMT_5000Lawyers",
	"iMT_GodDamnYou",
	"iMT_SoylentGreen",
	"iMT_PilotLicense",
	"iMT_Chickenshits",
	"iMT_ProclaimLiberty",
	"iMT_SexyBrunette",
	"iMT_GodIsDead",
	"iMT_MetalSupply",
	"iMT_Really",
	"iMT_Parking",
	"iMT_CopyPaper",
	"iMT_PassingGas",
	"iMT_SnowCold",
	"iMT_Shoes",
	"iMT_LatestIssue",
	"iMT_Greeting",
	"iMT_NiceCar",
	"iMT_MyBuddyEllis",
	"iMT_Morons",
	"iMT_MissEllis",
	"iMT_CarCalling",
	"iMT_ComeBack",
	"iMT_Steal",
	"iMT_LastWoman",
];

local chatterRandomThink = SpawnEntityFromTable( "info_target", { targetname = "chatterRandomThink" } )
local responseConcepts;

// Table for model names and response concepts.
// There should be a better way than this garbage.
local modelResponseConcepts =
{
	["models/survivors/survivor_coach.mdl"] = Coach_ResponseConcepts,
	["models/survivors/survivor_gambler.mdl"] = Nick_ResponseConcepts,
	["models/survivors/survivor_mechanic.mdl"] = Ellis_ResponseConcepts,
	["models/survivors/survivor_producer.mdl"] = Rochelle_ResponseConcepts,
	["models/survivors/survivor_biker.mdl"] = Francis_ResponseConcepts,
	["models/survivors/survivor_manager.mdl"] = Louis_ResponseConcepts,
	["models/survivors/survivor_namvet.mdl"] = Bill_ResponseConcepts,
	["models/survivors/survivor_teenangst.mdl"] = Zoey_ResponseConcepts,
}

function BotRandomChatter()
{
	if ( chatterRandomThink.ValidateScriptScope() )
	{
		chatterRandomThink.GetScriptScope() [ "Think" ] <- function()
		{
			// Set the max attempts based on whether any survivor has left the safe area
			local maxAttempts = Director.HasAnySurvivorLeftSafeArea() ? 96 : 48
			//local maxAttempts = Director.HasAnySurvivorLeftSafeArea() ? 64 : 32
			// SET NULL YOU ASS!
			local bot = null

			while ( bot = Entities.FindByClassname( bot, "player" ) )
			{
				// If our bot is on survivors, and is a bot
				// and not incapped, hanging, near death, dead
				// in combat or no tanks active...
				// do it!

				if ( bot.IsSurvivor() && IsPlayerABot( bot )
				&& !bot.IsIncapacitated() && !bot.IsHangingFromLedge() && !bot.IsOnThirdStrike() && !bot.IsDead()
				&& !bot.IsInCombat() /* && !bot.IsFiringWeapon() && !bot.IsOnFire() && !bot.IsStaggering() */
				&& !Director.IsTankInPlay() )
				{
					// Jab away if the random threshold is met.
					if ( RandomInt( 0, maxAttempts ) < 3 )
					{
						local modelName = bot.GetModelName();
						local specificResponseConcepts = modelResponseConcepts[modelName];

						// If a specific model is found and an RNG between 0 and 100 is less than 65,
						// we'll use the specific response concepts for that model.
						if ( specificResponseConcepts != null && RandomInt( 0, 100 ) < 65 )
							responseConcepts = specificResponseConcepts;
						else // If the RNG is 65 or over, use general response.
							responseConcepts = General_ResponseConcepts;

						// Jab away and possibly make players laugh.
						DoEntFire( "!self", "SpeakResponseConcept", responseConcepts[ RandomInt( 0, responseConcepts.len() - 1 ) ], RandomFloat( 0.3, 0.6 ), null, bot );
					}
				}
			}

			//Have this run again in 2.7 seconds
			return 2.5
		}

		AddThinkToEnt( chatterRandomThink, "Think" )
	}
}

BotRandomChatter()