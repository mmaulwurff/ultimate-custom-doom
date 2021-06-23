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
 * This class provides permanent powerups manipulation functions.
 */
class cd_PermanentPowerupProperties play
{

// public: /////////////////////////////////////////////////////////////////////////////////////////

  static
  void adjustTimes(PlayerInfo player, cd_PermanentPowerupSettings settings)
  {
    PlayerPawn pawn = player.mo;

    if (pawn == NULL) return;

    if (settings.buddha           ()) prolongEffect(pawn, "PowerBuddha"           ); else restore(pawn, "PowerBuddha"           );
    if (settings.damage           ()) prolongEffect(pawn, "PowerDamage"           ); else restore(pawn, "PowerDamage"           );
    if (settings.doublefiringspeed()) prolongEffect(pawn, "PowerDoubleFiringSpeed"); else restore(pawn, "PowerDoubleFiringSpeed");
    if (settings.drain            ()) prolongEffect(pawn, "PowerDrain"            ); else restore(pawn, "PowerDrain"            );
    if (settings.flight           ()) prolongEffect(pawn, "PowerFlight"           ); else restore(pawn, "PowerFlight"           );
    if (settings.frightener       ()) prolongEffect(pawn, "PowerFrightener"       ); else restore(pawn, "PowerFrightener"       );
    if (settings.highjump         ()) prolongEffect(pawn, "PowerHighJump"         ); else restore(pawn, "PowerHighJump"         );
    if (settings.infiniteammo     ()) prolongEffect(pawn, "PowerInfiniteAmmo"     ); else restore(pawn, "PowerInfiniteAmmo"     );
    if (settings.invisibility     ()) prolongEffect(pawn, "PowerInvisibility"     ); else restore(pawn, "PowerInvisibility"     );
    if (settings.ghost            ()) prolongEffect(pawn, "PowerGhost"            ); else restore(pawn, "PowerGhost"            );
    if (settings.shadow           ()) prolongEffect(pawn, "PowerShadow"           ); else restore(pawn, "PowerShadow"           );
    if (settings.invulnerability  ()) prolongEffect(pawn, "PowerInvulnerable"     ); else restore(pawn, "PowerInvulnerable"     );
    if (settings.ironfeet         ()) prolongEffect(pawn, "PowerIronFeet"         ); else restore(pawn, "PowerIronFeet"         );
    if (settings.mask             ()) prolongEffect(pawn, "PowerMask"             ); else restore(pawn, "PowerMask"             );
    if (settings.lightamp         ()) prolongEffect(pawn, "PowerLightAmp"         ); else restore(pawn, "PowerLightAmp"         );
    if (settings.torch            ()) prolongEffect(pawn, "PowerTorch"            ); else restore(pawn, "PowerTorch"            );
    if (settings.morph            ()) prolongEffect(pawn, "PowerMorph"            ); else restore(pawn, "PowerMorph"            );
    if (settings.protection       ()) prolongEffect(pawn, "PowerProtection"       ); else restore(pawn, "PowerProtection"       );
    if (settings.regeneraton      ()) prolongEffect(pawn, "PowerRegeneration"     ); else restore(pawn, "PowerRegeneration"     );
    if (settings.scanner          ()) prolongEffect(pawn, "PowerScanner"          ); else restore(pawn, "PowerScanner"          );
    if (settings.speed            ()) prolongEffect(pawn, "PowerSpeed"            ); else restore(pawn, "PowerSpeed"            );
    if (settings.strength         ()) prolongEffect(pawn, "PowerStrength"         ); else restore(pawn, "PowerStrength"         );
    if (settings.targeter         ()) prolongEffect(pawn, "PowerTargeter"         ); else restore(pawn, "PowerTargeter"         );
    if (settings.timefreezer      ()) prolongEffect(pawn, "PowerTimeFreezer"      ); else restore(pawn, "PowerTimeFreezer"      );
    if (settings.timefreezer      ()) prolongEffect(pawn, "PowerWeaponLevel2"     ); else restore(pawn, "PowerWeaponLevel2"     );

    if (settings.minotaur()) prolongMinotaur(pawn); else restoreMinotaur(pawn);
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private static
  void prolongEffect(PlayerPawn pawn, string power)
  {
    let p = Powerup(pawn.FindInventory(power));
    if (p == null) { return; }

    p.EffectTics    += Thinker.TICRATE;
    p.bNoScreenBlink = true;
  }

  private static
  void restore(PlayerPawn pawn, string power)
  {
    let p = Powerup(pawn.FindInventory(power));
    if (p == null) { return; }

    class<Inventory>    type    = power;
    readonly<Inventory> default = GetDefaultByType(type);
    bool                orig    = default.bNoScreenBlink;

    p.bNoScreenBlink = orig;
  }

  private static
  void prolongMinotaur(PlayerPawn pawn)
  {
    prolongEffect(pawn, "PowerMinotaur");

    ThinkerIterator i = ThinkerIterator.Create("MinotaurFriend");
    MinotaurFriend mo;

    while ((mo = MinotaurFriend(i.Next())) != NULL)
    {
      mo.StartTime = level.maptime;
    }
  }

  private static
  void restoreMinotaur(PlayerPawn pawn)
  {
    restore(pawn, "PowerMinotaur");
  }

} // class cd_PermanentPowerupProperties
