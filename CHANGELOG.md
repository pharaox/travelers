# Changelog

## Version 0.3.4

### Game Rules

* Added a game rule to reduce the *Invite Characters to Court* interaction range in order to improve performance.
* Added the `GG_can_change_rule` flag to all game rules so they could be changed mid-game with the Gamerule Gadget mod.

### Compatibility

* Enabled compatibility with Prisoners of War (PoW) mod, without crashes this time.

### Bug Fixes

* Fixed a few rare cases where Travelers would interrupt vanilla travel of unlanded characters started by certain decisions and events.

### Housekeeping

* Added more debug logs to detect anomalies with vanilla and PoW travelers.

## Version 0.3.3

### Compatibility

* Reverted changes for compatibility with PoW and FF mods since they were causing crashes during load on Windows.

### Bug Fixes

* Fixed crashes during load on Windows.

## Version 0.3.2

### Game Rules

* Added a game rule to enable or disable travel messages.

### Localization

* Added English localization for all languages.
* Translated French and Russian localization strings.

### Compatibility

* Enabled compatibility with PoW and FF mods needed for the Travelers Compatch mod.

### Bug Fixes

* Fixed rare errors in `error.log` for dead travel leaders.

## Version 0.3.1

### Bug Fixes

* Prevented starting mod travel if the owner is involved in an activity.
  * Fixed Grand Weddings becoming invalidated in some cases.

## Version 0.3.0

### Compatibility

* Adapted to CK3 1.11.1
* Introduced a different mechanism for avoiding travel for characters joining the entourage due to an event, and removed most changes to vanilla events.
* Removed the changes to *Invite to Court* vanilla interaction.

### Bug Fixes

* Introduced a mechanism to auto-recover from pulse event losses.

### Housekeeping

* Removed unneeded changes to `travel_on_actions.txt`.
* Removed the debug pulse event and related code.
* Added a few more debug logs.

## Version 0.2.1

### Performance

* Improved the teleport detector performance.
* Improved location tracking accuracy by adding it to most events.
* Added game rules to fine tune the teleport detector performance on lower-end machines.

## Version 0.2.0

### Compatibility

* Adapted to CK3 1.11.0

## Version 0.1.0

### Interactions

* Added *Invite Characters to Court* convenience interaction (`travl_invite_courtiers_interaction`).

### On_actions

* Added travel to home on `on_join_court`, `on_leave_court`, `on_imprison`, `on_release_from_prison`, `on_title_gain`, `on_title_lost` on_actions.
* Added a *teleport detector* and the `on_teleport` and `on_invalid_location` custom on_actions.
* Added special handling for traveling imprisoned rulers.

### Miscellaneous

* Adapted vanilla travel options and travel event files.
* Added extensive debug logging.
