/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019, 2021
 *
 * This file is a part of Ultimate Custom Doom.
 *
 * Ultimate Custom Doom is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * Ultimate Custom Doom is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Ultimate Custom Doom.  If not, see <https://www.gnu.org/licenses/>.
 */

/**
 * This class provides the armor regeneration settings.
 */
class cd_ArmorRegenerationSettings
{

  int  amount()         { return _amount.value();         }

  /// Minimal amount of armor the player must have before regeneration starts.
  int  minAmount()      { return _minAmount.value();      }

  /// Regeneration stops if armor reaches this number.
  int  cap()            { return _cap.value();            }

  bool isSoundEnabled() { return _isSoundEnabled.value(); }

  cd_PeriodSettings period() { return _period; }
  cd_BlendSettings  blend () { return _blend;  }

  cd_ArmorRegenerationSettings init(PlayerInfo p)
  {
    _amount         = new("cd_IntSetting" ).init("cd_armor_regen_amount" , p);
    _minAmount      = new("cd_IntSetting" ).init("cd_armor_regen_min"    , p);
    _cap            = new("cd_IntSetting" ).init("cd_armor_regen_cap"    , p);

    _isSoundEnabled = new("cd_BoolSetting").init("cd_armor_sound_enabled", p);

    _period = new("cd_PeriodSettings").init( "cd_armor_regen_enabled"
                                           , "cd_armor_regen_freq"
                                           , p
                                           );

    _blend  = new("cd_BlendSettings" ).init( "cd_armor_regen_pulse"
                                           , "cd_armor_blend_color_r"
                                           , "cd_armor_blend_color_g"
                                           , "cd_armor_blend_color_b"
                                           , "cd_armor_blend_color_int"
                                           , p
                                           );
    return self;
  }

  void randomize(PlayerInfo p, cd_ArmorRegenerationLimits limits)
  {
    _amount   .randomize(p, limits.amount());
    _period   .randomize(p, limits.period());
    _minAmount.randomize(p, limits.min   ());
    _cap      .randomize(p, limits.cap   ());
  }

  // private: //////////////////////////////////////////////////////////////////

  private cd_IntSetting     _amount;
  private cd_IntSetting     _minAmount;
  private cd_IntSetting     _cap;

  private cd_BoolSetting    _isSoundEnabled;

  private cd_PeriodSettings _period;
  private cd_BlendSettings  _blend;

} // class cd_ArmorRegenerationSettings
