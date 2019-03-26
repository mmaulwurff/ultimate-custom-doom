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
 * This class represents a single integer setting.
 */
class cd_IntSetting : cd_CvarSetting
{

  // public: ///////////////////////////////////////////////////////////////////

  int value() { return _setting; }

  cd_IntSetting init(string cvarName)
  {
    super.init(cvarName);
    return self;
  }

  void randomize(PlayerInfo p, cd_MinMaxIntSettings minMax)
  {
    int min = minMax.min();
    int max = minMax.max();

    if (min >= max)           { return; }
    if (min == 0 && max == 0) { return; }

    int newValue = random(min, max);

    Cvar.GetCvar(cvarName(), p).SetInt(newValue);
  }

  // public: ///////////////////////////////////////////////////////////////////

  override
  void read(PlayerInfo p)
  {
    _setting = Cvar.GetCvar(cvarName(), p).GetInt();
  }

  // private: //////////////////////////////////////////////////////////////////

  private int _setting;

} // class cd_IntSetting
