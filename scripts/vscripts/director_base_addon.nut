Msg( "-----------------------------------\n" );
Msg( "  Bot Chatter Script Initialized\n"    );
Msg( "-----------------------------------\n" );

// TODO:
// --------------------------------------------------------------------------
// Add a settings folder for Admins to change convars
// Chat commands to change convars
// Make sure that the bots do not talk while talking (Is this possible?)
// --------------------------------------------------------------------------
// I had ion's vocalizer in mind when coming with random responses.
// Credit to ChimiChamo for inspiration and for some code as like a base of some sorts.

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
	"iMT_PlayerReloading",
	"iMT_EllisStories",	// If Ion's vocalizer is installed, survivors will tell ellis to shut up
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

local Ellis_ResponseConcepts =
[
	"WorldC6M1_WeddingWarn03c", // What?
	"_c2m3_coaster03", // Oh my god, it's Christmas!
	"C1M2SafeRooma2", // Heh heh, zombie apocalypse ain't all bad.
	"C1M3SafeRoom2e", // Amen.
	"_c2m3_coollight01", // This is awesome, man!
	"_C4M5_BoatComing01", // VIRGIL, WHAT'S UP BROTHER?!
	"C1M4SafeRoom2b3", //
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
	"C2M1Intro008", // I love you.
];

local chatterRandomThink = SpawnEntityFromTable( "info_target", { targetname = "chatterRandomThink" } )
local responseConcepts;

// The scope
function BotRandomChatter()
{
	if ( chatterRandomThink.ValidateScriptScope() )
	{
		chatterRandomThink.GetScriptScope() [ "Think" ] <- function()
		{
			// Set the max attempts based on whether any survivor has left the safe area
            local maxAttempts = Director.HasAnySurvivorLeftSafeArea() ? 64 : 32
            local bot = null

            // Define a dictionary for model names and response concepts
            local modelResponseConcepts =
			{
                ["models/survivors/survivor_coach.mdl"] = Coach_ResponseConcepts,
                ["models/survivors/survivor_gambler.mdl"] = Nick_ResponseConcepts,
                ["models/survivors/survivor_mechanic.mdl"] = Ellis_ResponseConcepts,
                ["models/survivors/survivor_producer.mdl"] = General_ResponseConcepts,
                ["models/survivors/survivor_biker.mdl"] = General_ResponseConcepts,
                ["models/survivors/survivor_manager.mdl"] = General_ResponseConcepts,
                ["models/survivors/survivor_namvet.mdl"] = General_ResponseConcepts,
                ["models/survivors/survivor_teenangst.mdl"] = General_ResponseConcepts,
            }

            // Define a dictionary for model names and survivor names (Debugging only)
            local modelSurvivorNames =
			{
                ["models/survivors/survivor_coach.mdl"] = "Coach",
                ["models/survivors/survivor_gambler.mdl"] = "Nick",
                ["models/survivors/survivor_mechanic.mdl"] = "Ellis",
                ["models/survivors/survivor_producer.mdl"] = "Rochelle",
                ["models/survivors/survivor_biker.mdl"] = "Francis",
                ["models/survivors/survivor_manager.mdl"] = "Louis",
                ["models/survivors/survivor_namvet.mdl"] = "Bill",
                ["models/survivors/survivor_teenangst.mdl"] = "Zoey",
            }

			while ( bot = Entities.FindByClassname( bot, "player" ) )
			{
				if ( bot.IsSurvivor() && IsPlayerABot( bot )
				&& !bot.IsIncapacitated() && !bot.IsHangingFromLedge() && !bot.IsOnThirdStrike() && !bot.IsDead()
				&& !bot.IsInCombat() && /* !bot.IsFiringWeapon() && */ !bot.IsOnFire() /* && !bot.IsStaggering() */
				&& !Director.IsTankInPlay() )
				{
					// Jab away if the random threshold is met.
					if ( RandomInt( 0, maxAttempts ) < 1 )
					{
						local modelName = bot.GetModelName();
						local specificResponseConcepts = modelResponseConcepts[modelName];
						local survivorName = modelSurvivorNames[modelName] || "UNDEFINED MODEL";

						// If a specific model is found and an RNG between 0 and 100 is less than 65,
						// we'll use the specific response concepts for that model.
						if ( specificResponseConcepts != null && RandomInt( 0, 100 ) < 65 )
						{
							responseConcepts = specificResponseConcepts;
							Msg( survivorName + ": Picked " + survivorName + "_ResponseConcepts\n" );
						}
						else
						{
							// If a specific model isn't found or the RNG is 65 or over,
							// we'll use the general response concepts.
							responseConcepts = General_ResponseConcepts;
							Msg( survivorName + " Picked General_ResponseConcepts\n" );
						}

						DoEntFire( "!self", "SpeakResponseConcept", responseConcepts[ RandomInt( 0, responseConcepts.len() - 1 ) ], RandomFloat( 0.5, 2.0 ), null, bot );
					}
				}
			}

			//Have this run again in 2.8 seconds.
			return 2.8
		}

		AddThinkToEnt( chatterRandomThink, "Think" )
	}
}

BotRandomChatter()