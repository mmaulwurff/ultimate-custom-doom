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
 * What?
 */
class cd_RandomizerSettings
{

  enum NotificationTypes
  {
    NOTHING,
    TEXT,
    IMAGE,
  }

  cd_PeriodSettings period() { return _period; }

  bool   isTimerEnabled            () { return _isTimerEnabled            .value(); }
  int    notificationType          () { return _notificationType          .value(); }
  bool   isNotificationSoundEnabled() { return _isNotificationSoundEnabled.value(); }
  double notificationVolume        () { return _notificationVolume        .value(); }

  cd_RandomizerSettings init(PlayerInfo p)
  {
    _period                     = new("cd_PeriodSettings").init("cd_random_enabled", "cd_random_frequency", p);

    _isTimerEnabled             = new("cd_BoolSetting"   ).init("cd_random_timer_enabled"             , p);
    _notificationType           = new("cd_IntSetting"    ).init("cd_random_notification_type"         , p);
    _isNotificationSoundEnabled = new("cd_BoolSetting"   ).init("cd_random_notification_sound_enabled", p);
    _notificationVolume         = new("cd_DoubleSetting" ).init("cd_random_notification_volume"       , p);

    return self;
  }

// private: ////////////////////////////////////////////////////////////////////////////////////////

  private cd_PeriodSettings _period;

  private cd_BoolSetting    _isTimerEnabled;
  private cd_IntSetting     _notificationType;
  private cd_BoolSetting    _isNotificationSoundEnabled;
  private cd_DoubleSetting  _notificationVolume;

} // class cd_RandomizerSettings
