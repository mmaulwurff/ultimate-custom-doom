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
 * This class provides the monster manipulation functions.
 */

class cd_Monsters play
{

  // public: //////////////////////////////////////////////////////////////////

  static
  void applyMonsterMultipliersTo(Actor thing, cd_MonsterSettings settings)
  {
    applyHealthMultiplierTo(thing, settings.healthMultiplier());
    applySpeedMultiplierTo (thing, settings.speedMultiplier ());
  }

  static
  void applyMonsterMultipliersToAll(cd_MonsterSettings settings)
  {
    settings.read(null);

    let   iterator = ThinkerIterator.Create();
    Actor a;

    while (a = Actor(iterator.Next()))
    {
      if (!a.bISMONSTER) { continue; }

      applyMonsterMultipliersTo(a, settings);
    }
  }

  // private: //////////////////////////////////////////////////////////////////

  private static
  void applyHealthMultiplierTo(Actor thing, double multiplier)
  {
    if (multiplier <= 0) { multiplier = 1; }

    // LegenDoom Lite
    string ldlToken       = "LDLegendaryMonsterToken";
    int    ldlMultiplier  = (thing.CountInv(ldlToken) > 0) ? 3 : 1;

    int    defStartHealth = getDefault(thing).SpawnHealth();
    int    oldStartHealth = thing.SpawnHealth();
    int    oldHealth      = thing.health;
    double relativeHealth = double(oldHealth) / oldStartHealth;

    int    newStartHealth = cd_math.round(defStartHealth * multiplier * ldlMultiplier);
    int    newHealth      = cd_math.round(newStartHealth * relativeHealth);

    thing.StartHealth = newStartHealth;
    thing.A_SetHealth(newHealth);
  }

  private static
  void applySpeedMultiplierTo(Actor thing, double multiplier)
  {
    if (multiplier <= 0) { multiplier = 1; }

    double spawnSpeed = getDefault(thing).Speed;
    int    speed      = cd_math.round(spawnSpeed * multiplier);

    thing.Speed = speed;
  }

  private static
  readonly<Actor> getDefault(Actor thing)
  {
    class<Actor> type = thing.GetClassName();
    let          tmp  = GetDefaultByType(type);

    return tmp;
  }

} // class cd_Monsters
