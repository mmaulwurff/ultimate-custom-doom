version "3.7"



/******************************************************************************\
|****                  __  ______  _                 __                    ****|
|**                   / / / / / /_(_)___ ___  ____ _/ /____                  **|
|*                   / / / / / __/ / __ `__ \/ __ `/ __/ _ \                  *|
|*                  / /_/ / / /_/ / / / / / / /_/ / /_/  __/                  *|
|**                 \____/_/\__/_/_/ /_/ /_/\__,_/\__/\___/                  **|
|***     ______           __                     ____                       ***|
|**     / ____/_  _______/ /_____  ____ ___     / __ \____  ____  ____ ___   **|
|*     / /   / / / / ___/ __/ __ \/ __ `__ \   / / / / __ \/ __ \/ __ `__ \   *|
|*    / /___/ /_/ (__  ) /_/ /_/ / / / / / /  / /_/ / /_/ / /_/ / / / / / /   *|
|**   \____/\__,_/____/\__/\____/_/ /_/ /_/  /_____/\____/\____/_/ /_/ /_/   **|
|****                                                                      ****|
\******************************************************************************/



// Base ////////////////////////////////////////////////////////////////////////

#include "zscript/cd_ultimate_custom_doom.zs"
#include "zscript/cd_event_handler.zs"

// Settings ////////////////////////////////////////////////////////////////////

#include "zscript/settings/cd_settings.zs"

#include "zscript/settings/cd_settings_base.zs"
#include "zscript/settings/cd_settings_pack.zs"

#include "zscript/settings/cd_cvar_setting.zs"
#include "zscript/settings/cd_bool_setting.zs"
#include "zscript/settings/cd_int_setting.zs"
#include "zscript/settings/cd_double_setting.zs"

#include "zscript/settings/cd_player_settings.zs"
#include "zscript/settings/cd_misc_settings.zs"
#include "zscript/settings/cd_monster_settings.zs"

#include "zscript/settings/cd_blend_settings.zs"

#include "zscript/settings/cd_period_settings.zs"

#include "zscript/settings/cd_health_regeneration_settings.zs"
#include "zscript/settings/cd_armor_regeneration_settings.zs"
#include "zscript/settings/cd_ammo_regeneration_settings.zs"

#include "zscript/settings/cd_degeneration_settings.zs"
#include "zscript/settings/cd_health_degeneration_settings.zs"
#include "zscript/settings/cd_armor_degeneration_settings.zs"

#include "zscript/settings/cd_permanent_powerup_settings.zs"

#include "zscript/settings/cd_randomizer_settings.zs"

#include "zscript/settings/cd_min_max_int_settings.zs"
#include "zscript/settings/cd_min_max_double_settings.zs"

#include "zscript/settings/cd_randomizer_limits.zs"
#include "zscript/settings/cd_player_limits.zs"
#include "zscript/settings/cd_health_regeneration_limits.zs"
#include "zscript/settings/cd_armor_regeneration_limits.zs"
#include "zscript/settings/cd_ammo_regeneration_limits.zs"
#include "zscript/settings/cd_degeneration_limits.zs"
#include "zscript/settings/cd_health_degeneration_limits.zs"
#include "zscript/settings/cd_armor_degeneration_limits.zs"

// Object manipulation /////////////////////////////////////////////////////////

#include "zscript/properties/cd_player_properties.zs"
#include "zscript/properties/cd_misc_properties.zs"

#include "zscript/properties/cd_monster_properties.zs"

#include "zscript/properties/cd_player_health.zs"
#include "zscript/properties/cd_player_armor.zs"
#include "zscript/properties/cd_player_ammo.zs"

#include "zscript/properties/cd_permanent_powerup_properties.zs"

// Utilities ///////////////////////////////////////////////////////////////////

#include "zscript/utils/cd_math.zs"
#include "zscript/utils/cd_time.zs"
#include "zscript/utils/cd_effects.zs"

// Helper Inventory Items //////////////////////////////////////////////////////

#include "zscript/inventory/cd_start_giver_check.zs"

#include "zscript/inventory/cd_armor_bonus.zs"
#include "zscript/inventory/cd_start_armor_bonus.zs"

// Randomizer //////////////////////////////////////////////////////////////////

#include "zscript/cd_randomizer.zs"
