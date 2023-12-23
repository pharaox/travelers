# Travelers

[Subscribe on Steam](https://steamcommunity.com/sharedfiles/filedetails/?id=3082182371)

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

This mod is compatible with most other mods, except for mods that make similar changes to the travel system, or modify the `travl_on_actions.txt` and `travel_options.txt` vanilla files. Unfortunately, the latter includes most total conversion mods. If you use such mods, put this mod before them in the load order - you may lose the special treatment of imprisoned rulers as a result, but everything else should work as expected.

This mod is now also compatible with [Prisoners of War](https://steamcommunity.com/workshop/filedetails/?id=2511247871). For best experience, use the compatch by @cuomo860, see [Links](#links). With PoW, prisoners of war attach to the commander who captured them instead of traveling to the prison on their own. Put this mod after PoW in the load order.

This mod also supports changing its game rules mid-game with the [Gamerule Gadget](https://steamcommunity.com/sharedfiles/filedetails/?id=2826829936) mod.

I strongly recommend using also the [Unofficial Patch](https://steamcommunity.com/sharedfiles/filedetails/?id=2871648329) mod as it fixes many vanilla travel issues. Put this mod after Unofficial Patch in the load order.

## Localization

This mod is currently available in English, French, and Russian. For other languages, it uses the original English text as a placeholder.

## Features

### Character Travel

This mod makes characters travel to their default location (also called their "home") when it changes instead of teleporting. This applies to both landed and unlanded characters, and covers all possible cases, including the following:

* Marriage as a minor partner
* Joining a different court due to being invited, becoming a guest, etc.
* Imprisonment or release from prison
* Becoming landed for the first time
* Realm capital change due to a variety of reasons such as manual change, loss in conquest, inheritance, or being granted a better title

To ensure that important vanilla mechanics are not negatively affected, wandering and adventuring characters, as well those in an army are still able to teleport. Characters will also not interrupt most ongoing vanilla travel, such as traveling landed characters, characters traveling due to being involved in an activity, or unlanded characters traveling for a special purpose, e.g. wards traveling to their guardian's court. Unlanded characters returning home outside of an activity might interrupt their travel if their home changed, and head to their new home.

The character home and therefore their travel destination is always the realm capital of a landed character who acts as *receiver*. This may be their jailor (if they are imprisoned), the character itself (if they are landed), or else their warden (if they are a hostage), host (if they are a guest), or liege (if they are a courtier). In some situations, another character, usually residing at the travel origin may act as *sender*. If the player is either a sender or a receiver, they will get a message informing them about the departure or arrival. These messages can be enabled or disabled via the **Travel Messages** game rule.

### Core Travel Mechanics

Rather than changing a significant amount of vanilla code, this mod handles vanilla events (also known as "on_actions"), and tries to do so as graciously as possible in order not to break existing vanilla features and avoid any strange effects. This includes the following on_actions:

* `on_join_court`
* `on_leave_court`
* `on_imprison`
* `on_release_from_prison`
* `on_title_gain`
* `on_title_lost`
* `on_realm_capital_change` (newly introduced in CK3 1.11)
* `on_marriage` (for the minor partner)
* `on_concubinage` (for the concubine)

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

### Invite Characters to Court Interaction

To make it easier for players to find targets for the **Invite to Court** interaction, this mod adds an **Invite Characters to Court** convenience interaction that lists all characters that would accept such an invitation. This interaction redirects to **Invite to Court** for the selected target so that players may see their reasons for accepting.

## Performance

The *teleport detector* mentioned previously tracks the location of every non-teleporting character and triggers the `on_teleport` and `on_invalid_location` on_actions whenever one of these situations is detected. To achieve this, it activates on a regular basis and checks most living characters. This has a negative impact on the overall game performance that might be noticeable on lower-end machines.

By default, the teleport detector triggers the on_actions mentioned above and activates daily. This setup is the most accurate, but also the slowest. To avoid the performance strain on lower-end machines, you can use game rules to make it slightly less accurate but much faster:

* The **Teleport Detector Events** game rule allows disabling the `on_teleport` and `on_invalid_location` on_actions. When they are disabled, the teleport detector is effectively a lightweight location tracker that only updates a single variable per character. As a result, all travel triggered by vanilla events will still be accurate, but no travel will take place when characters teleport due to other reasons, or when they find themselves in an invalid location. These situations contribute less than 10% of all travel caused by this mod.
* The **Teleport Detector Interval** game rule allows specifying if the detector should activate every 1, 2, or 5 days. Increasing this interval will result in a significant performance gain, but might also result in incorrect travel in some rare cases (up to less than 0.5% of all travel caused by this mod).

The following table contains the times in seconds for 1, 2, 5, and 10 game years and different game rule combinations, measured on my own computer with CK3 1.11.0.1 and the Travelers 0.2.1, on max speed, in observer mode, and using the 867 game start:

| Setup | Events | Interval | 1y (s) | 2y (s) | 5y (s) | 10y (s) | Impact (%) |
|---|---|---:|---:|---:|---:|---:|---:|
| Vanilla | - | - | 11 | 22 | 56 | 119 | - |
| Events, 1d | Yes | 1d | 16 | 33 | 88 | 196 | 60-65% |
| No Events, 1d | No | 1d | 14 | 29 | 76 | 167 | 35-40% |
| No Events, 2d | No | 2d | 13 | 26 | 67 | 145 | 18-20% |
| No Events, 5d | No | 5d | 12 | 23 | 60 | 129 | 5-8% |

As you can see, the slowest and most accurate setup is 65% slower than vanilla, while the fastest and least accurate is only 5-8% slower.

As a recommendation, if you don't notice any performance issues, just leave the default settings. Otherwise, disable **Teleport Detector Events** and optionally increase **Teleport Detector Interval** until the issue is solved.

The **Invite Characters to Court** interaction might also become slow if the number of characters that would accept **Invite to Court** is large enough (hundreds). To avoid this, you can use the **Invite Characters to Court Range** game rule to reduce the range this interaction uses to look for characters.

## Links

* [Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3082182371)
* [Travelers and Prisoners of War Compatch (by @cuomo860)](https://steamcommunity.com/sharedfiles/filedetails/?id=3098184700) (WIP)
* [GitHub Repository](https://github.com/pharaox/travelers)

## Changes to Vanilla

The sections below list the changes made to existing vanilla objects in somewhat more detail for easier checking of compatibility with other mods.

### On_actions (`on_action`)

* `travel_on_actions.txt`:
  * Disabled travel events for imprisoned ruler characters.
  * Made court physician or bodyguards join their liege's entourage only if they are both available and at the same location as the liege.
  * Ensured travel plan completion events are not triggered for traveling prisoners.

### Travel (`travel`)

* `travel_options.txt`:
  * Disabled travel options for imprisoned ruler characters.

### Travel Events (`events/travel_events`)

* `travel_completion_events.txt`:
  * Mention reaching final destination and reroute to home only for vanilla travel
  * Add description and option for aborted travel
