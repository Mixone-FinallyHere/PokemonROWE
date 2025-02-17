#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_ai_script_commands.h"
#include "battle_arena.h"
#include "battle_controllers.h"
#include "battle_interface.h"
#include "battle_main.h"
#include "battle_message.h"
#include "battle_pyramid.h"
#include "battle_scripts.h"
#include "battle_setup.h"
#include "battle_tower.h"
#include "battle_util.h"
#include "berry.h"
#include "bg.h"
#include "data.h"
#include "daycare.h"
#include "dexnav.h"
#include "decompress.h"
#include "dma3.h"
#include "event_data.h"
#include "evolution_scene.h"
#include "graphics.h"
#include "gpu_regs.h"
#include "international_string_util.h"
#include "item.h"
#include "link.h"
#include "link_rfu.h"
#include "load_save.h"
#include "main.h"
#include "malloc.h"
#include "m4a.h"
#include "palette.h"
#include "party_menu.h"
#include "pokeball.h"
#include "pokedex.h"
#include "pokemon.h"
#include "random.h"
#include "recorded_battle.h"
#include "roamer.h"
#include "safari_zone.h"
#include "scanline_effect.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "text.h"
#include "trig.h"
#include "tv.h"
#include "util.h"
#include "wild_encounter.h"
#include "window.h"
#include "constants/abilities.h"
#include "constants/battle_config.h"
#include "constants/battle_move_effects.h"
#include "constants/battle_string_ids.h"
#include "constants/hold_effects.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/party_menu.h"
#include "constants/rgb.h"
#include "constants/songs.h"
#include "constants/trainers.h"
#include "cable_club.h"

//Normalmode Scaling
u8 normalnumMonsBadge[]    = {2,3,3,4,4,5,5,5,5,6,6};				//Trainers Number of Pokemon
u8 normalnumMonsGym[]      = {3,4,4,4,5,5,5,6,6,6,6};				//Gym Leaders Number of Pokemon
u8 normalminTrainerLevel[] = {6,10,15,20,25,30,35,40,45,55,60};		//Levels for Trainer Pokemon
u8 normalminGymLevel[] 	   = {12,17,22,27,32,37,42,50,55,65,70};	//Levels for Gym Leaders
u8 normalnumMonsDouble[]   = {1,2,2,2,2,2,3,3,3,3,3};				//Number of Pokemon in a Wild Battle

//Hardmode Scaling
u8 hardnumMonsBadge[]      = {3,3,4,4,4,5,5,6,6,6,6};				//Trainers Number of Pokemon
u8 hardnumMonsGym[]        = {3,4,4,5,5,6,6,6,6,6,6};				//Gym Leaders Number of Pokemon
u8 hardminTrainerLevel[]   = {7,12,18,24,30,36,42,48,55,65,70};	//Levels for Trainer Pokemon
u8 hardminGymLevel[] 	   = {13,19,25,31,37,43,49,60,68,76,82};	//Levels for Gym Leaders
u8 hardnumMonsDouble[]     = {2,2,2,2,2,2,3,3,3,3,3};				//Number of Pokemon in a Wild Battle

u16 SplitEvolutions(u16 basespecies, u8 level);
u16 CheckforLegendary(u16 species);
u16 GetCurrentMapWildPokemon(u8 isWaterMon, u8 index);
bool8 IsPokemonValid(u16 mon);

//Wild Pokemon Scaling
u8 WildLevel[] = {4,10,15,20,25,30,35,40,45,55,60};
u8 MovePowerLimit[] = {60,60,70,70,80,90,100,250,250,250,250};

u8 IsHardMode(){
	if (gSaveBlock2Ptr->optionsBattleStyle != OPTIONS_BATTLE_STYLE_SHIFT)
		return 1;
	else
		return 0;
}

u16 GetFirstEvolution(u16 species){
    int i, j, k;
    bool8 found;

    // Working backwards up to 5 times seems arbitrary, since the maximum number
    // of times would only be 3 for 3-stage evolutions.
    for (i = 0; i < EVOS_PER_MON; i++)
    {
        found = FALSE;
        for (j = 1; j < NUM_SPECIES; j++)
        {
            for (k = 0; k < EVOS_PER_MON; k++)
            {
                if (gEvolutionTable[j][k].targetSpecies == species)
                {
                    species = j;
                    found = TRUE;
                    break;
                }
            }

            if (found)
                break;
        }

        if (j == NUM_SPECIES)
            break;
    }

    return species;
}

u8 GetNumBadges()
{
	if (FlagGet(FLAG_DEFEATED_RAYQUAZA))
		return 10;
	if (FlagGet(FLAG_SYS_GAME_CLEAR))
		return 9;
	else if (FlagGet(FLAG_RECEIVED_TM03))
		return 8;
	else if (FlagGet(FLAG_RECEIVED_TM04))
		return 7;
	else if (FlagGet(FLAG_RECEIVED_TM40))
		return 6;
	else if (FlagGet(FLAG_RECEIVED_TM42))
		return 5;
	else if (FlagGet(FLAG_RECEIVED_TM50))
		return 4;
	else if (FlagGet(FLAG_RECEIVED_TM34))
		return 3;
	else if (FlagGet(FLAG_RECEIVED_TM08))
		return 2;
	else if (FlagGet(FLAG_RECEIVED_TM39))
		return 1;

	return 0;
};

u8 getLevelBoost(){
	u8 badges = GetNumBadges();
	if (FlagGet(FLAG_SYS_GAME_CLEAR) && IsHardMode() == 1)
		return badges*2;
	else if(IsHardMode() == 1 || FlagGet(FLAG_SYS_GAME_CLEAR))
		return badges;
	else
		return 0;
}

u16 GetBaseSpecie(u16 basespecies){
	u16 id = gSaveBlock2Ptr->playerTrainerId[1];
	u16 randomizedspecie = 1;
	u16 firstStage = 1;
	u16 notLegendary = 1;
	if(FlagGet(FLAG_SYS_DEXNAV_GET) == FALSE){
		randomizedspecie = 1+((basespecies*id)% 884);
		notLegendary = CheckforLegendary(randomizedspecie);
		//firstStage = GetFirstEvolution(notLegendary);
		return notLegendary;
	}
	else
		return basespecies;
}

u8 getTrainerLevel(u8 Level){
	u8 badges = GetNumBadges();
	u8 levelboost = Random() % (2+badges);
	if(IsHardMode() == 0){
	if(Level == 0)//Weakest Trainer
		return normalminTrainerLevel[badges];
	else if(Level == 1)//Normal Trainer
		return normalminTrainerLevel[badges] + levelboost;
	else if (Level == 5 || Level == 6)//Gym Leader
		return normalminGymLevel[badges];
	else
		return Level;
	}else{
	if(Level == 0)//Normal Trainer
		return hardminTrainerLevel[badges] + levelboost;	
	else if(Level == 1)//Normal Trainer
		return hardminTrainerLevel[badges] + levelboost;
	else if (Level == 5 || Level == 6)//Gym Leader
		return hardminGymLevel[badges];
	}
	return Level;
}

u8 getWildLevel(u8 Ability){
	u8 levelboost = Random() % 5 + IsHardMode();
	if(Ability == ABILITY_PRESSURE || Ability == ABILITY_HUSTLE || Ability == ABILITY_VITAL_SPIRIT || Ability == ABILITY_INTIMIDATE)
		return WildLevel[GetNumBadges()] + 6;
	else if(Ability == ABILITY_WIMP_OUT || Ability == ABILITY_RUN_AWAY || Ability == ABILITY_RATTLED)
		return WildLevel[GetNumBadges()];
	
	return WildLevel[GetNumBadges()] + levelboost;
}

u8 getTrainerPokemonNum(){
	if(IsHardMode() == 0)
		return normalnumMonsBadge[GetNumBadges()];
	else
		return hardnumMonsBadge[GetNumBadges()];
}

u8 getLeaderPokemonNum(){
	if(IsHardMode() == 0)
		return normalnumMonsGym[GetNumBadges()];
	else
		return hardnumMonsGym[GetNumBadges()];
}

u8 getDoubleTrainerPokemonNum(){
	if(IsHardMode() == 0)
		return normalnumMonsDouble[GetNumBadges()];
	else
		return hardnumMonsDouble[GetNumBadges()];
}

u16 GetWildPokemon(u16 basespecies, u8 level, u16 heldItem){
	//Variables
	u16 WildSpecie = GetBaseSpecie(basespecies);
	u16 split = SplitEvolutions(WildSpecie,level);
	u8 numbadges = GetNumBadges();
	u8 rand = 0;
	u8 FriendshipLevel = 24;
	u8 BadgesMidgame = 5;
	u8 BadgesLategame = 7;
	
	
	if (heldItem == ITEM_EVERSTONE || heldItem == ITEM_EVIOLITE|| !GetSetPokedexFlag(SpeciesToNationalPokedexNum(WildSpecie), FLAG_GET_SEEN)||2 <= (Random() % 10))
		return WildSpecie;
	
	switch(gEvolutionTable[split][0].method)
	{
		//Friendship Evolution Only
		case EVO_FRIENDSHIP:
		case EVO_ITEM_HOLD_DAY:
		if(level >= FriendshipLevel)
			return GetWildPokemon(gEvolutionTable[split][0].targetSpecies, level, heldItem);
		break;
		
		//Level based Evolutions
		case EVO_LEVEL:
		case EVO_LEVEL_DAY:
		case EVO_LEVEL_MALE:
		case EVO_LEVEL_NIGHT:
		case EVO_LEVEL_FEMALE:
			if(gEvolutionTable[split][0].param && gEvolutionTable[split][0].param <= level)
			{
				if(GetWildPokemon(gEvolutionTable[split][0].targetSpecies, level, heldItem))
					return GetWildPokemon(gEvolutionTable[split][0].targetSpecies, level, heldItem);
				else
					return gEvolutionTable[split][0].targetSpecies;
			}
		break;
		
		//Midgame Evolutions
		case EVO_BEAUTY:
		case EVO_LEVEL_DUSK:
		case EVO_ITEM_HOLD_NIGHT:
		case EVO_SPECIFIC_MON_IN_PARTY:
		case EVO_LEVEL_DARK_TYPE_MON_IN_PARTY:
			if(BadgesMidgame <= numbadges)
				return GetWildPokemon(gEvolutionTable[split][0].targetSpecies, level, heldItem);
		break;
	
		//Lategame Evolutions
		case EVO_MOVE:
		case EVO_ITEM:
		case EVO_TRADE:
		case EVO_MAPSEC:
		case EVO_ITEM_MALE:
		case EVO_TRADE_ITEM:
		case EVO_LEVEL_RAIN:
		case EVO_ITEM_FEMALE:
			if(BadgesLategame <= numbadges)
				return GetWildPokemon(gEvolutionTable[split][0].targetSpecies, level, heldItem);
		break;
		
	}
	return split;
}

u16 GetTrainerPokemon(u16 basespecies, u8 level){
	//Variables
	u16 TrainerSpecie = GetBaseSpecie(basespecies);
	u16 split = SplitEvolutions(TrainerSpecie,level);
	u8 numbadges = GetNumBadges();
	u8 rand = 0;
	u8 FriendshipLevel = 12;
	u8 BadgesMidgame = 4;
	u8 BadgesLategame = 6;
	
	//if(FlagGet(FLAG_UNUSED_0x054))
	//	return basespecies;
	
	switch(gEvolutionTable[split][0].method)
	{
		//Friendship Evolution Only
		case EVO_FRIENDSHIP:
		case EVO_ITEM_HOLD_DAY:
		case EVO_FRIENDSHIP_DAY:
		if(level >= FriendshipLevel)
			return GetTrainerPokemon(gEvolutionTable[split][0].targetSpecies, level);
		break;
		
		//Level based Evolutions
		case EVO_LEVEL:
		case EVO_LEVEL_DAY:
		case EVO_LEVEL_MALE:
		case EVO_LEVEL_NIGHT:
		case EVO_LEVEL_FEMALE:
			if(gEvolutionTable[split][0].param && gEvolutionTable[split][0].param <= level)
			{
				if(GetTrainerPokemon(gEvolutionTable[split][0].targetSpecies, level))
					return GetTrainerPokemon(gEvolutionTable[split][0].targetSpecies, level);
				else
					return gEvolutionTable[split][0].targetSpecies;
			}
		break;
		
		//Midgame Evolutions
		case EVO_TRADE_SPECIFIC_MON:
		case EVO_BEAUTY:
		case EVO_LEVEL_DUSK:
		case EVO_ITEM_HOLD_NIGHT:
		case EVO_SPECIFIC_MON_IN_PARTY:
		case EVO_LEVEL_DARK_TYPE_MON_IN_PARTY:
			if(BadgesMidgame <= numbadges)
				return GetTrainerPokemon(gEvolutionTable[split][0].targetSpecies, level);
		break;
	
		//Lategame Evolutions
		case EVO_MOVE:
		case EVO_ITEM:
		case EVO_TRADE:
		case EVO_MAPSEC:
		case EVO_ITEM_MALE:
		case EVO_TRADE_ITEM:
		case EVO_LEVEL_RAIN:
		case EVO_ITEM_FEMALE:
			if(BadgesLategame <= numbadges)
				return GetTrainerPokemon(gEvolutionTable[split][0].targetSpecies, level);
		break;
		
	}
	return split;
}

u16 SplitEvolutions(u16 basespecies, u8 level){
	u8 numbadges = GetNumBadges();
	if(basespecies > NUM_SPECIES || basespecies <= 0)
		basespecies = 131;
	
	if(basespecies == 265 && level >= 7)//Wurmple
	{
		u16 PossibleEvo[] = {266,268};
		u16 species = PossibleEvo[Random() % (sizeof(PossibleEvo)/sizeof(PossibleEvo[0]))];
		return species;
	}
	
	if(basespecies == 133 && level > 20)//Eevee
	{
		u16 PossibleEvo[] = {134,135,136,196,197,470,471,700};
		u16 species = PossibleEvo[Random() % (sizeof(PossibleEvo)/sizeof(PossibleEvo[0]))];
		return species;
	}
	
	if(basespecies == 61 && 5 <= numbadges)//Poliwhirl
	{
		u16 PossibleEvo[] = {62,186};
		u16 species = PossibleEvo[Random() % (sizeof(PossibleEvo)/sizeof(PossibleEvo[0]))];
		return species;
	}
	
	if(basespecies == 236 && level >= 20)//Tyrogue
	{
		u16 PossibleEvo[] = {237,106,107};
		u16 species = PossibleEvo[Random() % (sizeof(PossibleEvo)/sizeof(PossibleEvo[0]))];
		return species;
	}
	
	if(basespecies == 79 && level >= 37)//Slowpoke
	{
		u16 PossibleEvo[] = {80,199};
		u16 species = PossibleEvo[Random() % (sizeof(PossibleEvo)/sizeof(PossibleEvo[0]))];
		return species;
	}
	
	if(basespecies == 44 && level >= 35)//Gloom
	{
		u16 PossibleEvo[] = {45,182};
		u16 species = PossibleEvo[Random() % (sizeof(PossibleEvo)/sizeof(PossibleEvo[0]))];
		return species;
	}
	
	if(basespecies == 281 && level >= 30)//Kirlia
	{
		u16 PossibleEvo[] = {282,475};
		u16 species = PossibleEvo[Random() % (sizeof(PossibleEvo)/sizeof(PossibleEvo[0]))];
		return species;
	}
	
	if(basespecies == 290 && level >= 20)//Nincada
	{
		u16 PossibleEvo[] = {292,292};
		u16 species = PossibleEvo[Random() % (sizeof(PossibleEvo)/sizeof(PossibleEvo[0]))];
		return species;
	}
	
	if(basespecies == 840 && 4 <= numbadges)//Applin
	{
		u16 PossibleEvo[] = {841,842};
		u16 species = PossibleEvo[Random() % (sizeof(PossibleEvo)/sizeof(PossibleEvo[0]))];
		return species;
	}
	
	return basespecies;
}

u16 CheckforLegendary(u16 species){
	u16 LegendariesNum1[] = {144,150,243,249,377,480,638,716,785};
	u16 LegendariesNum2[] = {147,152,246,252,387,495,650,722,810};
	u8 i = 0;
	
	for(i = 0; i < 9;i++){
	if(species < LegendariesNum1[i])
		return species;
	else if(species < LegendariesNum2[i])
		return LegendariesNum2[i];
	}
	return species;
}

u16 GetHeldItem(u16 baseitem)
{
	u16 holdEffect = ItemId_GetHoldEffect(baseitem);
	u16 NumBadges = GetNumBadges();
	if(IsHardMode() == 1)
		NumBadges = NumBadges + 1;
	
	if(holdEffect != HOLD_EFFECT_MEGA_STONE){
	if (NumBadges >= 7)
		return baseitem;
	else 
		return ITEM_SITRUS_BERRY;
	}
	
	if(baseitem == ITEM_ORAN_BERRY)//HP restorative items
	{
		if(NumBadges >= 6)
			return ITEM_SITRUS_BERRY;
		if(NumBadges >= 3)
			return ITEM_BERRY_JUICE;
		
		return baseitem;
	}
	
	if(baseitem == ITEM_LUM_BERRY)//Defense Styled Pokemon
	{
		if(NumBadges >= 8)
			return ITEM_FIGY_BERRY;
		if(NumBadges >= 6)
			return ITEM_LEFTOVERS;
	    if(NumBadges >= 4)
			return ITEM_LUM_BERRY;
	}
	
	if(baseitem == ITEM_MAGOST_BERRY)//Attack Oriented Pokemon
	{
		if(NumBadges >= 7)
			return ITEM_LIFE_ORB;
		if(NumBadges >= 5)
			return ITEM_FOCUS_SASH;
	    if(NumBadges >= 3)
			return ITEM_NORMAL_GEM;
	}
	
	if(baseitem == ITEM_RABUTA_BERRY)//Speed Oriented Pokemon
	{
		if(NumBadges >= 7)
			return ITEM_QUICK_CLAW;
		if(NumBadges >= 5)
			return ITEM_CUSTAP_BERRY;
	    if(NumBadges >= 3)
			return ITEM_SALAC_BERRY;
	}
	
	if(baseitem == ITEM_NOMEL_BERRY)//Normal Type Pokemon
		{
		if(NumBadges >= 7)
			return ITEM_NORMAL_GEM;
		if(NumBadges >= 5)
			return ITEM_CHOPLE_BERRY;
	    if(NumBadges >= 3)
			return ITEM_LUM_BERRY;
	}
	
	return baseitem;
}

u8 GetEvsfromPokemon(u8 evs)
{
	u8  NumBadges = GetNumBadges();
	u8  NumFlags = 10;
	u8  ScaledEvs = (evs/NumFlags)*NumBadges; 
	if(IsHardMode() == 1 && NumBadges != NumFlags)
		ScaledEvs = (evs/NumFlags)*NumBadges+1; 
	
	return ScaledEvs;
}

static bool32 IsMonValidSpecies(struct Pokemon *pokemon)
{
    u16 species = GetMonData(pokemon, MON_DATA_SPECIES2);
    if (species == SPECIES_NONE || species == SPECIES_EGG)
    {
        return FALSE;
    }
    return TRUE;
}

u8 GetPlayerUsableMons(void)
{
    int i;
	u8 PartySize = 0;
    struct Pokemon *pokemon = gPlayerParty;

    for (i = 0; i < PARTY_SIZE; i++, pokemon++)
    {
        if (IsMonValidSpecies(pokemon) && GetMonData(pokemon, MON_DATA_HP) != 0)
        {
            PartySize++;
        }
    }
    return PartySize;
}

bool8 IsMoveUsable(u8 movepower)
{
	if(movepower <= MovePowerLimit[GetNumBadges()])
		return TRUE;
	else
		return FALSE;
}

bool8 IsPokemonValid(u16 mon)
{
	if(mon > NUM_SPECIES || mon <= 0)
		return FALSE;
	else
		return TRUE;
}

u16 GetMapRandomPokemon(u16 TrainerClass, u16 species)
{
	u8 i = 0;
	u8 j = 0;
	u8 k = 0;
	u8 rand = Random() % 12;
	u16 Landspecies[] = 
	{SPECIES_NONE,SPECIES_NONE,SPECIES_NONE,SPECIES_NONE,SPECIES_NONE,SPECIES_NONE,
	 SPECIES_NONE,SPECIES_NONE,SPECIES_NONE,SPECIES_NONE,SPECIES_NONE,SPECIES_NONE};
	u16 Waterspecies[] = 
	{SPECIES_NONE,SPECIES_NONE,SPECIES_NONE,SPECIES_NONE,SPECIES_NONE,SPECIES_NONE,
	 SPECIES_NONE,SPECIES_NONE,SPECIES_NONE,SPECIES_NONE,SPECIES_NONE,SPECIES_NONE};
	
	u16 randspecie = SPECIES_NONE;
	
	for(i = 0; i < 12 ;i++)
		Landspecies[i] = GetCurrentMapWildPokemon(0, i+rand);
	
	for(j = 0; j < 12 ;j++)
		Waterspecies[j] = GetCurrentMapWildPokemon(1, j+rand);
	
	if(rand <= 6)
		return species;
		
	switch(TrainerClass)
	{
		case TRAINER_CLASS_EXPERT:
		case TRAINER_CLASS_POKEMANIAC:
		for(k = 0; k < 12 ;k++){
		if(gBaseStats[Landspecies[k]].growthRate == GROWTH_SLOW || gBaseStats[Landspecies[k]].growthRate == GROWTH_MEDIUM_SLOW)
		{
		if(IsPokemonValid(Landspecies[k]))
				return Landspecies[k];
			else
				return species;
		}}
			return species;
		break;
		case TRAINER_CLASS_LADY:
		for(k = 0; k < 12 ;k++){
		if(gBaseStats[Landspecies[k]].type1 == TYPE_FAIRY || gBaseStats[Landspecies[k]].type2 == TYPE_FAIRY||
		gBaseStats[Landspecies[k]].type1 == TYPE_GRASS || gBaseStats[Landspecies[k]].type2 == TYPE_GRASS ||
		gBaseStats[Landspecies[k]].bodyColor == BODY_COLOR_PINK || gBaseStats[Landspecies[k]].eggGroup1 == EGG_GROUP_UNDISCOVERED ||
		(gBaseStats[Landspecies[k]].type2 == TYPE_NORMAL && gBaseStats[Landspecies[k]].type2 == TYPE_NORMAL))
		{
			if(IsPokemonValid(Landspecies[k]))
				return Landspecies[k];
			else
				return species;
		}}
			return species;
		break;
		case TRAINER_CLASS_HIKER:
		case TRAINER_CLASS_RUIN_MANIAC:
		for(k = 0; k < 12 ;k++){
		if(gBaseStats[Landspecies[k]].type1 == TYPE_GROUND || gBaseStats[Landspecies[k]].type2 == TYPE_GROUND ||
		   gBaseStats[Landspecies[k]].type1 == TYPE_ROCK || gBaseStats[Landspecies[k]].type2 == TYPE_ROCK)
		{
			if(IsPokemonValid(Landspecies[k]))
				return Landspecies[k];
			else
				return species;
		}}
			return species;
		break;
		case TRAINER_CLASS_HEX_MANIAC:
		for(k = 0; k < 12 ;k++){
		if(gBaseStats[Landspecies[k]].type1 == TYPE_GHOST || gBaseStats[Landspecies[k]].type2 == TYPE_GHOST ||
		   gBaseStats[Landspecies[k]].type1 == TYPE_PSYCHIC || gBaseStats[Landspecies[k]].type2 == TYPE_PSYCHIC ||
		   gBaseStats[Landspecies[k]].type1 == TYPE_DARK || gBaseStats[Landspecies[k]].type2 == TYPE_DARK)
		{
			if(IsPokemonValid(Landspecies[k]))
				return Landspecies[k];
			else
				return species;
		}}
			return species;
		break;
		case TRAINER_CLASS_AROMA_LADY:
		for(k = 0; k < 12 ;k++){
		if(gBaseStats[Landspecies[k]].type1 == TYPE_GRASS || gBaseStats[Landspecies[k]].type2 == TYPE_GRASS ||
		   gBaseStats[Landspecies[k]].eggGroup1 == EGG_GROUP_GRASS || gBaseStats[Landspecies[k]].eggGroup2 == EGG_GROUP_GRASS||
		   gBaseStats[Landspecies[k]].eggGroup1 == EGG_GROUP_FAIRY || gBaseStats[Landspecies[k]].eggGroup2 == EGG_GROUP_FAIRY)
		{
			if(IsPokemonValid(Landspecies[k]))
				return Landspecies[k];
			else
				return species;
		}}
			return species;
		break;
		case TRAINER_CLASS_GUITARIST:
		for(k = 0; k < 12 ;k++){
		if(gBaseStats[Landspecies[k]].type1 == TYPE_ELECTRIC || gBaseStats[Landspecies[k]].type2 == TYPE_ELECTRIC ||
		   gBaseStats[Landspecies[k]].abilities[0] == ABILITY_SOUNDPROOF || gBaseStats[Landspecies[k]].abilities[1] == ABILITY_SOUNDPROOF)
		{
			if(IsPokemonValid(Landspecies[k]))
				return Landspecies[k];
			else
				return species;
		}}
			return species;
		break;
		case TRAINER_CLASS_BUG_MANIAC:
		case TRAINER_CLASS_BUG_CATCHER:
		for(k = 0; k < 12 ;k++){
		if(gBaseStats[Landspecies[k]].type1 == TYPE_BUG || gBaseStats[Landspecies[k]].type2 == TYPE_BUG)
		{
			if(IsPokemonValid(Landspecies[k]))
				return Landspecies[k];
			else
				return species;
		}}
			return species;
		break;
		break;
		case TRAINER_CLASS_DRAGON_TAMER:
		for(k = 0; k < 12 ;k++){
		if(gBaseStats[Landspecies[k]].type1 == TYPE_DRAGON || gBaseStats[Landspecies[k]].type2 == TYPE_DRAGON)
		{
			if(IsPokemonValid(Landspecies[k]))
				return Landspecies[k];
			else
				return species;
		}}
			return species;
		break;
		case TRAINER_CLASS_BATTLE_GIRL:
		case TRAINER_CLASS_BLACK_BELT:
		for(k = 0; k < 12 ;k++){
		if(gBaseStats[Landspecies[k]].type1 == TYPE_FIGHTING || gBaseStats[Landspecies[k]].type2 == TYPE_FIGHTING ||
		(gBaseStats[Landspecies[k]].eggGroup1 == EGG_GROUP_HUMAN_LIKE && gBaseStats[Landspecies[k]].evYield_Attack != 0))
		{
			if(IsPokemonValid(Landspecies[k]))
				return Landspecies[k];
			else
				return species;
		}}
			return species;
		break;
		case TRAINER_CLASS_PSYCHIC:
		for(k = 0; k < 12 ;k++){
		if(gBaseStats[Landspecies[k]].type1 == TYPE_PSYCHIC || gBaseStats[Landspecies[k]].type2 == TYPE_PSYCHIC)
		{
			if(IsPokemonValid(Landspecies[k]))
				return Landspecies[k];
			else
				return species;
		}}
			return species;
		break;
		case TRAINER_CLASS_BIRD_KEEPER:
		case TRAINER_CLASS_TRIATHLETE:
		for(k = 0; k < 12 ;k++){
		if(gBaseStats[Landspecies[k]].type1 == TYPE_FLYING || gBaseStats[Landspecies[k]].type2 == TYPE_FLYING
		||gBaseStats[Landspecies[k]].eggGroup1 == EGG_GROUP_FLYING)
		{
			if(IsPokemonValid(Landspecies[k]))
				return Landspecies[k];
			else
				return species;
		}}
			return species;
		break;
		case TRAINER_CLASS_SCHOOL_KID:
		case TRAINER_CLASS_LASS:
		case TRAINER_CLASS_YOUNGSTER:
		for(k = 0; k < 12 ;k++){
		if(gBaseStats[Landspecies[k]].growthRate == GROWTH_FAST || gBaseStats[Landspecies[k]].growthRate == GROWTH_MEDIUM_FAST)
		{
			if(IsPokemonValid(Landspecies[k]))
				return Landspecies[k];
			else
				return species;
		}}
			return species;
		break;
		case TRAINER_CLASS_FISHERMAN:
		case TRAINER_CLASS_SWIMMER_F:
		case TRAINER_CLASS_SWIMMER_M:
		if(IsPokemonValid(Waterspecies[0]))
			return Waterspecies[0];
		else
			return species;
		break;
		default:
		return species;
	}
	return species;
}

u16 GetCurrentMapWildPokemon(u8 isWaterMon, u8 index)
{
    u16 headerId;
    const struct WildPokemonInfo *landMonsInfo;
    const struct WildPokemonInfo *waterMonsInfo;
    headerId = GetCurrentMapWildMonHeaderId();
	
    if (headerId == 0xFFFF)
        return SPECIES_NONE;
    landMonsInfo = gWildMonHeaders[headerId].landMonsInfo;
    waterMonsInfo = gWildMonHeaders[headerId].waterMonsInfo;
    //Land Pokemon
	if(isWaterMon == 0){
	if (landMonsInfo == NULL)
        return SPECIES_NONE;
	else
		return landMonsInfo->wildPokemon[index%11].species;
	}else if (waterMonsInfo == NULL)
        return SPECIES_NONE;
	else
		return waterMonsInfo->wildPokemon[index%4].species;
	
	return SPECIES_NONE;
}