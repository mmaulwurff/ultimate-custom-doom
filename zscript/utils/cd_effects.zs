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
 * This class provides visual and audio effects.
 */
class cd_Effects
{

  // public: ///////////////////////////////////////////////////////////////////

  static play
  void maybeBlend(PlayerPawn pawn, cd_BlendSettings settings)
  {
    bool isBlendEnabled = settings.isEnabled();

    if (isBlendEnabled)
    {
      int    red   = settings.red();
      int    green = settings.green();
      int    blue  = settings.blue();
      string color = String.Format("%2x %2x %2x", red, green, blue);
      double alpha = settings.intensity();

      pawn.A_SetBlend(color, alpha, BLEND_DURATION);
    }
  }

  // private: //////////////////////////////////////////////////////////////////

  const BLEND_DURATION = TicRate / 2;

} // class cd_Effects
