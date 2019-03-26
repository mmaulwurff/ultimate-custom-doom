/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019
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
class cd_PermanentPowerupProperties
{

  // public: ///////////////////////////////////////////////////////////////////

  static play
  void adjustTimes(PlayerInfo player, cd_PermanentPowerupSettings settings)
  {
    PlayerPawn pawn = player.mo;

    if (pawn == null) { return; }

    if (settings.buddha           ()) { prolongEffect(pawn, "PowerBuddha"           ); }
    if (settings.damage           ()) { prolongEffect(pawn, "PowerDamage"           ); }
    if (settings.doublefiringspeed()) { prolongEffect(pawn, "PowerDoubleFiringSpeed"); }
    if (settings.drain            ()) { prolongEffect(pawn, "PowerDrain"            ); }
    if (settings.flight           ()) { prolongEffect(pawn, "PowerFlight"           ); }
    if (settings.frightener       ()) { prolongEffect(pawn, "PowerFrightener"       ); }
    if (settings.highjump         ()) { prolongEffect(pawn, "PowerHighJump"         ); }
    if (settings.infiniteammo     ()) { prolongEffect(pawn, "PowerInfiniteAmmo"     ); }
    if (settings.invisibility     ()) { prolongEffect(pawn, "PowerInvisibility"     ); }
    if (settings.ghost            ()) { prolongEffect(pawn, "PowerGhost"            ); }
    if (settings.shadow           ()) { prolongEffect(pawn, "PowerShadow"           ); }
    if (settings.invulnerability  ()) { prolongEffect(pawn, "PowerInvulnerable"     ); }
    if (settings.ironfeet         ()) { prolongEffect(pawn, "PowerIronFeet"         ); }
    if (settings.mask             ()) { prolongEffect(pawn, "PowerMask"             ); }
    if (settings.lightamp         ()) { prolongEffect(pawn, "PowerLightAmp"         ); }
    if (settings.torch            ()) { prolongEffect(pawn, "PowerTorch"            ); }
    if (settings.minotaur         ()) { prolongEffect(pawn, "PowerMinotaur"         ); }
    if (settings.morph            ()) { prolongEffect(pawn, "PowerMorph"            ); }
    if (settings.protecton        ()) { prolongEffect(pawn, "PowerProtection"       ); }
    if (settings.regeneraton      ()) { prolongEffect(pawn, "PowerRegeneration"     ); }
    if (settings.scanner          ()) { prolongEffect(pawn, "PowerScanner"          ); }
    if (settings.speed            ()) { prolongEffect(pawn, "PowerSpeed"            ); }
    if (settings.strength         ()) { prolongEffect(pawn, "PowerStrength"         ); }
    if (settings.targeter         ()) { prolongEffect(pawn, "PowerTargeter"         ); }
    if (settings.timefreezer      ()) { prolongEffect(pawn, "PowerTimeFreezer"      ); }
    if (settings.timefreezer      ()) { prolongEffect(pawn, "PowerWeaponLevel2"     ); }
  }

  // private: //////////////////////////////////////////////////////////////////

  private static play
  void prolongEffect(PlayerPawn pawn, string power)
  {
    let p = Powerup(pawn.FindInventory(power));

    if (p == null) { return; }

    p.EffectTics += Thinker.TICRATE;
  }

} // class cd_PermanentPowerupProperties
