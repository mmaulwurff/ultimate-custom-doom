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
 * This class provides time-related ancillary functions.
 */
class cd_Time
{

  // public: ///////////////////////////////////////////////////////////////////

  /**
   * This function checks if something periodic should happen now.
   *
   * @returns a pointer to player pawn if the event should happen,
   * otherwise null.
   */
  static
  PlayerPawn now(PlayerInfo player, cd_PeriodSettings settings)
  {
    if (!settings.isEnabled()) { return null; }

    int  periodTicks = settings.period() * Thinker.TICRATE;
    bool isTimeNow   = ((level.time % periodTicks) == 0);

    if (!isTimeNow) { return null; }

    PlayerPawn pawn = player.mo;

    return pawn;
  }

} // class cd_Time
