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
 * This class provides a pair of minimal and maximal double values.
 */
class cd_MinMaxDoubleSettings : cd_SettingsPack
{

  // public: ///////////////////////////////////////////////////////////////////

  double min() { return _min.value(); }
  double max() { return _max.value(); }

  // public: ///////////////////////////////////////////////////////////////////

  cd_MinMaxDoubleSettings init(string minCvar, string maxCvar, PlayerInfo p)
  {
    push(_min = new("cd_DoubleSetting").init(minCvar, p));
    push(_max = new("cd_DoubleSetting").init(maxCvar, p));

    return self;
  }

  // private: //////////////////////////////////////////////////////////////////

  private cd_DoubleSetting _min;
  private cd_DoubleSetting _max;

} // class cd_MinMaxDoubleSettings
