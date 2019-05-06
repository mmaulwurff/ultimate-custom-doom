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
 * This class represents a single double setting.
 */
class cd_DoubleSetting : cd_CvarSetting
{

  // public: ///////////////////////////////////////////////////////////////////

  double value() { return variable().GetFloat(); }

  cd_DoubleSetting init(string cvarName, PlayerInfo p)
  {
    super.init(cvarName, p);
    return self;
  }

  void randomize(PlayerInfo p, cd_MinMaxDoubleSettings minMax)
  {
    double min = minMax.min();
    double max = minMax.max();

    if (min >= max)           { return; }
    if (min == 0 && max == 0) { return; }

    double newValue = randomDouble(min, max);

    variable().SetFloat(newValue);
  }

  // private: //////////////////////////////////////////////////////////////////

  private
  double randomDouble(double min, double max)
  {
    int intMin = int(ceil(min * RANDOM_PRECISION));
    int intMax = int(     max * RANDOM_PRECISION );

    double r = random(intMin, intMax) / RANDOM_PRECISION;

    return r;
  }

  // private: //////////////////////////////////////////////////////////////////

  const RANDOM_PRECISION = 1000.0;

} // class cd_DoubleSetting
