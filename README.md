# Travelers

## Overview

Ever wondered why hostages or wards must travel to your court, but spouses, invited courtiers, or prisoners can instantly teleport to it from hundreds of miles away? Or why you can magically teleport to your new realm capital together with all of your courtiers, guests, and prisoners?

If you did, you no longer need to wait for Paradox to fix it. With this mod, characters always travel to their default location when it changes instead of teleporting, no matter if it changed due to marriage, invitation, imprisonment or release from prison, becoming a guest, becoming landed for the first time, or realm capital change.

To ensure that important vanilla mechanics are not negatively affected, wandering and adventuring characters, as well those in an army are still able to teleport. Characters will also not interrupt any ongoing vanilla travel except in cases they would previously have teleported.

Not only do they travel, but they often don't do it alone. When multiple characters in the same location start travel to the same destination, they form a group with a single leader and one or more companions. If the leader is a ruler, the other travelers may join their entourage. Otherwise, each character travels alone in vanilla terms (since non-ruler characters can't have entourages), but they all arrive together. In both cases, the player is informed about the departure or arrival with a single message that lists all members of the group.

Since character homes may change mid-travel, such groups may lose members, change their destination, split, or disband altogether, but every character should eventually arrive at their correct home.

While traveling, rulers and their entourage may get some of the vanilla travel and danger events. As a result, some of them may die or leave, and others may join. Rulers can also select a travel leader, add travel options, and get experience on arrival. Non-ruler characters currently don't get any travel events, since none are available in vanilla.

Prisoners are a special case. Imprisoned rulers are assigned a "prison guard" travel leader, can't add travel options, don't get events or experience, and may only be joined by other imprisoned characters.

Finally, this mod also adds an **Invite Characters to Court** convenience interaction that lists all characters that would accept **Invite to Court**.

## Compatibility

The current version is compatible with CK3 1.11.

This mod is compatible with all other mods, including total conversion mods such as AGOT and EK2, except for mods making similar changes to the travel system. I strongly recommend using also the [Unofficial Patch](https://steamcommunity.com/sharedfiles/filedetails/?id=2871648329) mod as it fixes many vanilla travel issues. Put this mod after the Unofficial Patch in the load order.

## Features

### Character Travel

This mod makes characters travel to their default location (also called their "home") when it changes instead of teleporting. This applies to both landed and unlanded characters, and covers all possible cases, including the following:

* Marriage as a minor partner
* Joining a different court due to being invited, becoming a guest, etc.
* Imprisonment or release from prison
* Becoming landed for the first time
* Realm capital change due to a variety of reasons such as manual change, loss in conquest, inheritance, or being granted a better title

To ensure that important vanilla mechanics are not negatively affected, wandering and adventuring characters, as well those in an army are still able to teleport. Characters will also not interrupt any ongoing vanilla travel except in cases they would previously have teleported.

The character home and therefore their travel destination is always the realm capital of a landed character who acts as *receiver*. This may be their jailor (if they are imprisoned), the character itself (if they are landed), or else their warden (if they are a hostage), host (if they are a guest), or liege (if they are a courtier). In some situations, another character, usually residing at the travel origin may act as *sender*. If the player is either a sender or a receiver, they will get a message informing them about the departure or arrival.

### Core Travel Mechanics

Rather than changing a significant amount of vanilla code, this mod handles vanilla events (also known as "on_actions"), and tries to do so as graciously as possible in order not to break existing vanilla features and avoid any strange effects. This includes the following on_actions:

* `on_join_court`
* `on_leave_court`
* `on_imprison`
* `on_release_from_prison`
* `on_title_gain`
* `on_title_lost`
* `on_realm_capital_change` (newly introduced in CK3 1.11)

The challenge with these on_actions is that they may be triggered before or after the character teleported. To ensure correct travel, this mod adds a *teleport detector* that saves the current location of every non-teleporting character on a daily basis, so it could be determined if the character teleported and if yes, from where they should start traveling.

The logic to handle any of the above events is always the same, and it does approximately the following:

* If the character is not at home, and their saved location is the same (or not yet available), start new travel to home (unless already traveling to home).
* If the character is at home, and their saved location is different, return them to that location and start new travel to home (unless already traveling to home).
* If the character is not at home, and their saved location is different, just return them to that location. Either they are already at home and were teleported to the wrong place (yes, vanilla does this sometimes), or they are not and will be sent traveling to home by another event.

There are some exceptions to the above to adjust for specific cases. Also, sometimes lieges notify their courtiers and courtiers notify their lieges about events that happened to them (via the custom on_actions `on_liege_event` and `on_courtier_event`), to ensure that everyone is notified and that liege events always precede courtier events so courtiers may join their liege's entourage.

### Teleport and Invalid Location Events

In a few cases, characters may teleport due to reasons not covered by any of the above events. In other cases, they may find themselves in a strange place and not traveling. When the *teleport detector* detects such cases it triggers the custom on_actions `on_teleport` and `on_invalid_location`, that are handled by the same logic described above. This results in such characters starting their travel to home from their saved location, but unlike the vanilla events, this may happen 1 day after the character teleported. Since such cases are relatively few, you are rather unlikely to notice them as player.

### Traveling in Groups

When multiple characters in the same location start travel to the same destination, they form a group with a single *leader* and one or more *companions*. If the leader is a ruler, the other travelers may join their entourage. Otherwise, each character travels alone in vanilla terms (since non-ruler characters can't have entourages), but they all arrive together. In both cases, the player is informed about the departure or arrival with a single message that lists all members of the group.

Since character homes may change mid-travel, such groups may lose members, change their destination, split, or disband altogether as a result. However, every character should eventually arrive at their correct home (unless they died during their travel).

### Travel and Danger Events

While traveling, rulers and their entourage may get some of the vanilla travel and danger events. As a result, some of them may die or leave, and others may join. Rulers can also select a travel leader, add travel options, and get experience on arrival.

Unlike rulers, non-ruler characters currently don't get any travel events, since none are available in vanilla. They also don't get travel leaders, and can't add travel options. I may add some special events for such characters in future versions of this mod.

Unlike rulers that travel to their own realm capital, imprisoned rulers traveling to their jailor's capital are assigned a "prison guard" travel leader, can't add travel options, don't get events or experience, and may only be joined by other imprisoned characters. I may add some special events also for imprisoned characters in future versions of this mod.

### Invite Courtiers Interaction

To make it easier for players to find targets for the **Invite to Court** interaction, this mod adds an **Invite Characters to Court** convenience interaction that lists all characters that would accept such an invitation. This interaction redirects to **Invite to Court** for the selected target so that players may see their reasons for accepting.

## Links

* [Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=xxx)
* [GitHub Repository](https://github.com/pharaox/travelers)

## Changes to Vanilla

The sections below list the changes made to existing vanilla objects in somewhat more detail for easier checking of compatibility with other mods.

### Interactions (`character_interactions`)

* `invite_to_court_interaction`: Fixed errors for non-existing scopes.

### On_actions (`on_action`)

* `travel_on_actions.txt`:
  * Refactored some of the `on_travel` on_actions so that they could be handled by mods for characters that are not matched by the vanilla triggers.
  * Disabled travel events for imprisoned ruler characters.
  * Made court physician or bodyguards join their liege's entourage only if they are both available and at the same location as the liege.
  * Ensured travel plan completion events are not triggered for traveling prisoners.

### Effects (`scripted_effects`)

* `add_to_court_and_entourage_effect`, `add_to_entourage_court_and_activity_effect`: Mark characters added to court by these effects with a special variable to prevent them from starting travel to home rather than joining their liege's entourage.

### Travel (`travel`)

* `travel_options.txt`:
  * Disabled travel options for imprisoned ruler characters.

### Travel Events (`events/travel_events`)

* `travel_completion_events.txt`:
  * Mention reaching final destination and reroute to home only for vanilla travel
  * Add description and option for aborted travel
* `travel_events.txt`, `travel_events_filippa.txt`, `travel_danger_events.txt`, `travel_danger_events_klank.txt`: Mark characters added to court by these events with a special variable to prevent them from starting travel to home rather than joining their liege's entourage.
* `travel_danger_events_joe.txt` Fix errors for non-existing scopes and ensure events fire only for traveling characters.
