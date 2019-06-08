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
 * This class represents miscellaneous properties.
 */
class cd_MiscProperties play
{

  // public: ///////////////////////////////////////////////////////////////////

  cd_MiscProperties init(cd_MiscSettings settings, PlayerInfo player)
  {
    rememberOriginals(player);

    return self;
  }

  void update(cd_MiscSettings settings, PlayerInfo player)
  {
    updateAirControl(settings);
    updateFriction(settings, player);
  }

  // private: //////////////////////////////////////////////////////////////////

  private
  void updateAirControl(cd_MiscSettings settings)
  {
    if (level.airControl != _airControl) // something changed the level air control
    {
      _originalAirControl = level.airControl;
    }

    level.airControl = settings.isEnabled()
      ? _originalAirControl * settings.airControl()
      : _originalAirControl;

    _airControl = level.airControl;
  }

  private
  void updateFriction(cd_MiscSettings settings, PlayerInfo player)
  {
    PlayerPawn pawn = player.mo;

    pawn.friction = settings.isEnabled()
      ? _originalFriction * settings.friction()
      : _originalFriction;
  }

  private
  void rememberOriginals(PlayerInfo player)
  {
    PlayerPawn pawn = player.mo;

    _originalAirControl = level.airControl;
    _originalFriction   = pawn.friction;
    _airControl         = _originalAirControl;
  }

  // private: //////////////////////////////////////////////////////////////////

  private double _originalAirControl;
  private double _originalFriction;

  // level air control can be changed without UCD knowing about it,
  // so better save the value for checks.
  private double _airControl;

} // class cd_MiscProperties
