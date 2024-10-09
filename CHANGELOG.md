# Changelog

## Version 0.8.2

### Compatibility

* Adapted to CK3 1.13.1

## Version 0.8.1

### Performance

* Fixed a performance issue affecting submods.

## Version 0.8.0

### Compatibility

* Adapted to CK3 1.13.0.1

### Core Travel

* If the receiver is a landless adventurer traveling with domicile, travel to their final destination instead of their capital.

## Version 0.7.9

### Localization

* Updated Korean translation by @gazette2.

## Version 0.7.8

### Core Travel

* Newly recruited (from pool) landed barons are now teleported directly to their capitals.
* "Major interest" characters (councillors, consorts, etc.) are no longer chosen as prisoner escort characters.

### Game Rules

* Added the *Prisoner Events Chance* game rule to allow tuning the chance for *Escape from Prison* events.

### Localization

* Added partial German translation by @Feivel.

## Version 0.7.7

### Compatibility

* Added more values to be overridden by compatibility submods.

## Version 0.7.6

### Core Travel

* Prisoner escort characters can now be chosen among own courtiers if ones with appropriate skills and traits are available, rather than from the pool.

### Compatibility

* Added more triggers to be overridden by compatibility submods.

## Version 0.7.5

### Compatibility

* Added a compatibility trigger to be used by other mods.

## Version 0.7.4

### Compatibility

* Adapted to CK3 1.12.5 (fixes)

## Version 0.7.3

### Compatibility

* Adapted to CK3 1.12.5

### Game Balance

* Changed travel safety bonuses for the *High* and *Very High* game rule settings to their original values (20 and 40), and added one additional *Medium* setting with a bonus of 10.
* Reduced the chance for the *Escape from Prison* event from 10% to 5%.

## Version 0.7.2

### Localization

* Updated Korean translation by @gazette2.

## Version 0.7.1

### Core Travel

* Players are now informed when a hostile prisoner escort departs.

### Travel Events

* The army owner is now also informed about the outcome of a *Hostile Army* event.

## Version 0.7.0

### Core Travel

* Traveling prisoners now are moved to a special prison type and can't be interacted with (ransomed, executed, etc.) (can be disabled via a game rule).
* Reduced travel safety bonuses from the *Travel Safety* game rule as they seemed excessive.

### Travel Events

* Added a special *Escape from Prison* event for traveling prisoners. A prisoner tries to escape by winning a prowess, diplomacy, or intrigue challenge against their guard.
* Added a special *Hostile Army* event for prisoner escort characters moving to a location containing a hostile army.
* Added one new *Carrion* travel danger event for non-ruler group leaders passing through locations affected by an epidemic, loosely based on the existing vanilla event.

### Game Rules

* Added the *Interactions for Traveling Prisoners* game rule to allow enabling or disabling the standard prison interactions (*Ransom*, *Execute*, etc.) for traveling prisoners.

### Localization

* Updated Korean translation by @gazette2.

## Version 0.6.1

### Localization

* Added Korean translation by @gazette2.

## Version 0.6.0

### Game Balance

* The default setting for the *Travel Safety* game rule is now *High*.

### Compatibility

* Adapted to CK3 1.12.1

## Version 0.5.3

### Compatibility

* Added changes needed for AGOT compatch.
* Improved compatibility with total conversion mods.

## Version 0.5.2

### Core Travel

* Added prisoner escort characters as courtiers instead of guests, to prevent players and AI from wasting their gold on recruiting them.
* Added an additional sentence to messages for prisoner escort characters to inform that they have joined only temporarily.

### Bug Fixes

* Fixed dead companions not being properly removed from the traveling group in some cases.

## Version 0.5.1

### Game Balance

* Adjusted the firing chance of some of the new events.
* Reduced by half the probability of death for all new events, unless it's a certain death.
* Terrain experts are now immune to all new events that are influenced by terrain.
* Removed cultural tradition conditions from all new events, since they already influence the travel safety, and for improved compatibility with total conversion mods.

### Game Rules

* Added the *Travel Safety* game rule to enable increasing the travel safety for all travel caused by this mod.

### Bug Fixes

* Current travel danger and travel safety are now properly taken into account when determining the "chance of no event" for the new events. As a result, these events now fire much less often on average.

### Housekeeping

* Added debug code and logs to measure character deaths during travel and event travel danger.

## Version 0.5.0

### Performance

* Improved location tracking accuracy outside of scheduled location tracker runs.
  * As a result, location tracker interval can now be increased with very small impact on accuracy.
* Added travel on `on_guest_arrived_from_pool`, `on_guest_ready_to_move_to_pool`, and `random_yearly_everyone_pulse` vanilla on_actions to send characters traveling in most situations that previously relied on location tracker events.
  * As a result, location tracker events can now be disabled with very small impact on accuracy.

### Game Rules

* Adapted the *Teleport Detector Events* and *Teleport Detector Interval* game rules to enable better performance by default.
  * Renamed them to *Location Tracker Events* and *Location Tracker Interval*.
  * Changed their defaults to *Disabled*, and *5 Days*.
  * Removed their slowest settings to ensure that they are not used for save games.
  * Added a new setting *10 days* to *Location Tracker Interval* for even better performance vs. slightly higher inaccuracy chance.

### Bug Fixes

* Wiped army combatants now teleport to their homes instead of traveling (unless imprisoned), as when disbanding an army.
* Fixed rare errors in `error.log`.

### Housekeeping

* Added debug code and logs to measure location tracking inaccuracy chance.

## Version 0.4.0

### Core Travel

* Enhanced travel mechanics for imprisoned characters.
  * Imprisoned characters always travel as companions of a "prisoner escort" group leader.
  * If the escorting character travel is aborted for any reason, e.g. death due to an event, all prisoners escape.
  * Imprisoned rulers can't have entourages, although they are still assigned a "prison guard" travel leader.

### Travel Events

* Added 14 new travel danger events for non-ruler group leaders, loosely based on existing vanilla events.
  * Other group members may also participate in the resolution of such an event, and all may suffer its consequences.
  * The player is informed about such events with appropriate messages.
  * These events can also happen to prisoner escort characters and so can affect traveling prisoners.

### Game Rules

* Added a new *Travel Events for Unlanded Characters* game rule to enable or disable these events.
* Added a new setting to the *Travel Messages* game rule to enable only travel event messages.

### UI

* Changed types for arrival / departure and event messages to less generic ones with appropriate icons and styles.
* Changed travel tooltip to add info about other group members.

### Bug Fixes

* Fixed group leader sometimes not changed when they die.
* Fixed characters teleporting rather than traveling if imprisoned mid-travel.
* Fixed characters sometimes not joining as entourage or companion if the group leader was meanwhile teleported to their default location.
* A second departure message is now sent for characters joining with 1 day delay, if there are such characters.

### Housekeeping

* Added more debug logs and removed less useful ones.

## Version 0.3.5

### Bug Fixes

* Fixed errors in `error.log` for characters without a location reported by players.

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
