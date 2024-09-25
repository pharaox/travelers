# Travelers

[Subscribe on Steam](https://steamcommunity.com/sharedfiles/filedetails/?id=3082182371)

## Overview

Ever wondered why hostages or wards must travel to your court, but spouses, invited courtiers, or prisoners can instantly teleport to it from hundreds of miles away? Or why you can magically teleport to your new realm capital together with all of your courtiers, guests, and prisoners?

If you did, you no longer need to wait for Paradox to fix it. With this mod, characters always travel to their default location when it changes instead of teleporting, no matter if it changed due to marriage, invitation, imprisonment or release from prison, becoming a guest, becoming landed for the first time, or realm capital change.

To ensure that important vanilla mechanics are not negatively affected, wandering and adventuring characters, as well those in an army are still able to teleport. Characters will also not interrupt any ongoing vanilla travel except in cases they would previously have teleported.

Not only do they travel, but they often don't do it alone. When multiple characters in the same location start travel to the same destination, they form a group with a single leader and one or more companions. If the leader is a ruler, the other travelers may join their entourage. Otherwise, each character travels alone in vanilla terms (since non-ruler characters can't have entourages), but they all arrive together. In both cases, the player is informed about the departure or arrival with a single message that lists all members of the group.

Since character homes may change mid-travel, such groups may lose members, change their destination, split, or disband altogether, but every character should eventually arrive at their correct home.

While traveling, rulers and their entourage may get some of the vanilla travel and danger events. As a result, some of them may die or leave, and others may join. Rulers can also select a travel leader, add travel options, and get experience on arrival.

Since there are no travel events for non-ruler characters available in vanilla, this mod adds 15 new travel danger events for non-ruler group leaders, loosely based on existing vanilla events. Other group members may also participate in the resolution of such an event, and all may suffer its consequences. The player is informed about such events with appropriate messages, and they can be disabled via a game rule.

Due to the increased volume of travel caused by this mod and the new travel danger events mentioned above, more characters may die or get injured due to travel danger events than before. To compensate for this, the travel safety of all travel caused by this mod is increased compared to vanilla travel. If you prefer, you can increase it even further or decrease it to its default level via a game rule.

Prisoners are a special case. Imprisoned characters always travel as companions of a "prisoner escort" group leader, who joins the imprisoner's court only temporarily and leaves on arrival, and may also get some of the danger events mentioned above. If their travel is aborted for any reason, e.g. death due to an event, all prisoners escape.

Imprisoned rulers traveling to their jailor's capital are assigned a "prison guard" travel leader, can't add travel options, and other characters may not join their entourages. They also don't get any vanilla travel events, but may still be affected by the danger events mentioned above.

Traveling prisoners are moved to a special prison type and can't be interacted with (ransomed, executed, etc.) (can be disabled via a game rule). They may try to escape while traveling via a special event, and may also get freed if their escorting character moves to a location containing a hostile army. As a player, you can try to free prisoners captured by an enemy by putting one of your armies on their path.

Finally, this mod also adds an **Invite Characters to Court** convenience interaction that lists all characters that would accept **Invite to Court**.

## Compatibility

The current version is compatible with CK3 1.13. If you are still on CK3 1.12.x, use [version 0.7.9](https://github.com/pharaox/travelers/releases/download/0.7.9/travelers-0.7.9.zip) instead.

This mod is compatible with most other mods, except for mods that make similar changes to the travel system, or modify the `travl_on_actions.txt` and `travel_options.txt` vanilla files. Unfortunately, the latter includes most total conversion mods. If you use such mods, put this mod before them in the load order - the travel of imprisoned rulers may be affected as a result, but everything else should work as expected.

This mod is now fully compatible with [A Game of Thrones](https://steamcommunity.com/sharedfiles/filedetails/?id=2962333032) with a compatibility patch, see [Links](#links).

This mod is now also compatible with [Prisoners of War](https://steamcommunity.com/workshop/filedetails/?id=2511247871). For best experience, use the compatch by @cuomo860, see [Links](#links). With PoW, prisoners of war attach to the commander who captured them instead of traveling to the prison on their own. Put this mod after PoW in the load order.

This mod also supports changing its game rules mid-game with the [Gamerule Gadget](https://steamcommunity.com/sharedfiles/filedetails/?id=2826829936) mod.

## Localization

This mod is currently available in English, Russian, (partially) French, (partially) German (translated by @Feivel), and Korean (translated by @gazette2). For other languages, it uses the original English text as a placeholder.

## Features

### Character Travel

This mod makes characters travel to their default location (also called their "home") when it changes instead of teleporting. This applies to both playable (landed, or landless adventurers) and unplayable characters, and covers all possible cases, including the following:

* Marriage as a minor partner
* Joining a different court due to being invited, becoming a guest, etc.
* Imprisonment or release from prison
* Becoming landed for the first time
* Realm capital change due to a variety of reasons such as manual change, loss in conquest, inheritance, or being granted a better title

To ensure that important vanilla mechanics are not negatively affected, wandering and adventuring characters, as well those in an army are still able to teleport. Characters will also not interrupt most ongoing vanilla travel, such as traveling playable characters, characters traveling due to being involved in an activity, or unplayable characters traveling for a special purpose, e.g. wards traveling to their guardian's court. Unplayable characters returning home outside of an activity might interrupt their travel if their home changed, and head to their new home.

The character home and therefore their travel destination is always the realm capital of a playable character who acts as *receiver*. This may be their jailor (if they are imprisoned), the character itself (if they are playable), or else their warden (if they are a hostage), host (if they are a guest), or liege (if they are a courtier). In some situations, another character, usually residing at the travel origin may act as *sender*. If the player is either a sender or a receiver, they will get a message informing them about the departure or arrival. These messages can be enabled or disabled via the **Travel Messages** game rule.

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
* `on_guest_arrived_from_pool`
* `on_guest_ready_to_move_to_pool`
* `random_yearly_everyone_pulse`

The challenge with these on_actions is that they may be triggered before or after the character teleported. To ensure correct travel, this mod saves the current location of every non-teleporting character, so it could be determined if the character teleported and if yes, from where they should start traveling. This is done by the following 2 complementary mechanisms:

* Handling the above events and all vanilla travel events, after the character location has been updated.
* Using a dedicated *location tracker* that reschedules itself after a fixed number of days, configurable via a game rule.

The logic to handle any of the above events is always the same, and it does approximately the following:

* If the character is not at home, and their saved location is the same (or not yet available), start new travel to home (unless already traveling to home).
* If the character is at home, and their saved location is different, return them to that location and start new travel to home (unless already traveling to home).
* If the character is not at home, and their saved location is different, just return them to that location. Either they are already at home and were teleported to the wrong place (yes, vanilla does this sometimes), or they are not and will be sent traveling to home by another event.

There are some exceptions to the above to adjust for specific cases. Also, sometimes lieges notify their courtiers and courtiers notify their lieges about events that happened to them (via the custom on_actions `on_liege_event` and `on_courtier_event`), to ensure that everyone is notified and that liege events always precede courtier events so courtiers may join their liege's entourage.

### Handling Teleports and Invalid Locations

In a few cases, characters may teleport without any of the above events firing. In other cases, they may find themselves in a non-default location and not traveling. In previous versions of this mod, the *location tracker* detected such cases and triggered the custom on_actions `on_teleport` and `on_invalid_location` to send such characters traveling home from their saved location. However, this had a significant negative performance impact, so these events are now disabled. As a player, you are rather unlikely to notice any difference, because:

* There are very few cases of teleports remaining. One such case is when a traveling entourage character is removed from the travel and returned home in certain vanilla events. Another is when a courtier character is sent to visit a different court in certain vanilla events and interactions. Both are rather rare, causing less than 10 teleports per year.
* Characters stuck in non-default locations is caused by flawed vanilla logic and is also quite rare. It auto-corrects itself when any of the above events is triggered for such a character. The `random_yearly_everyone_pulse` event is triggered once per year for every character, so a character may remain no more than an year in a non-default location.

### Traveling in Groups

When multiple characters in the same location start travel to the same destination, they form a group with a single *leader* and one or more *companions*. If the leader is a ruler, the other travelers may join their entourage. Otherwise, each character travels alone in vanilla terms (since non-ruler characters can't have entourages), but they all arrive together. In both cases, the player is informed about the departure or arrival with a single message that lists all members of the group.

Since character homes may change mid-travel, such groups may lose members, change their destination, split, or disband altogether as a result. However, every character should eventually arrive at their correct home (unless they died during their travel).

### Travel and Danger Events

While traveling, rulers and their entourage may get some of the vanilla travel and danger events. As a result, some of them may die or leave, and others may join. Rulers can also select a travel leader, add travel options, and get experience on arrival.

Since there are no travel events for non-ruler characters available in vanilla, this mod adds 14 new travel danger events for non-ruler group leaders, loosely based on existing vanilla events. Other group members may also participate in the resolution of such an event, and all may suffer its consequences. The player is informed about such events with appropriate messages. These events can be disabled via the **Travel Events for Unplayable Characters** game rule.

Similarly to vanilla events, such events may only happen under certain conditions that may include various travel danger types, availability of companions or pool characters, winter or no winter, etc. Usually, they can be resolved via multiple options, most of them involving a skill-based challenge. The group member with the highest skill is always chosen for such challenges, if a member with at least 5 in the corresponding skill exists. Which option is eventually chosen depends on the AI dispositions of all participating characters and a random factor. There is always an "automatic failure" that is chosen if no other options are available.

If the challenge ends in a success, the responsible character may be rewarded by prestige or piety gain. Otherwise, they and all other characters may suffer various negative effects ranging from loss of prestige, piety, or gold, becoming wounded, injured, or diseased, getting negative modifiers, being delayed, and sometimes even dying.

These new travel danger events for non-ruler characters are the following:

| No | Name | Danger Types | Other Conditions | Challenges |
|---:|---|---|---|---|
| 1 | Bandits | Mountains, Desert Mountains, County control |  | Prowess, Diplomacy |
| 2 | Missing Companion | Wetlands, Forest, Taiga, Jungle | At least one companion | Stewardship |
| 3 | Lost | Forest, Taiga, Jungle | Not terrain expert | Learning, Stewardship |
| 4 | Out of Water | Desert, Desert Mountains, Drylands, Steppe | Not terrain expert | Diplomacy |
| 5 | Aftermath | Occupation, Siege, Raid, Army, Battle | Available pool character | Prowess |
| 6 | Sea Storm | Sea, Coastal Sea | Not terrain expert, Traveled for > 15 days | |
| 7 | Avalanche | Mountains, Desert Mountains | At least one companion, Winter, Not terrain expert | Prowess |
| 8 | Snowbound | | Winter, Not winter expert | Diplomacy |
| 9 | Ripped Sails | Sea, Coastal Sea | Not terrain expert  | Learning |
| 10 | Brush Fire | Hills | No winter, Not terrain expert | Martial |
| 11 | Mosquitoes | Wetlands, Floodplains, Forest, Taiga, Jungle | No winter, Not terrain expert | Learning |
| 12 | Beast Attack | Forest, Taiga, Jungle | Not terrain expert | Prowess |
| 13 | Spoiled Food | | No holding, Traveled for > 15 days | Learning, Intrigue |
| 14 | Sickness | Wetlands, Jungle | Not terrain expert, Traveled for > 15 days | |
| 15 | Carrion | | Epidemic | Learning |

Due to the increased volume of travel caused by this mod and the new travel danger events mentioned above, more characters may die or get injured due to travel danger events than before. If you don't like this, you can increase the travel safety of all travel caused by this mod via the **Travel Safety** game rule. This adds a travel safety modifier to all travel plans created by this mod, which causes both vanilla travel danger events and the new events mentioned above to fire less often.

### Prisoner Travel

Imprisoned characters always travel as companions of a "prisoner escort" group leader, who joins the imprisoner's court only temporarily and leaves on arrival, similarly to characters joining court due to travel options. The escorting character may also get some of the danger events mentioned in [Travel and Danger Events](#travel-and-danger-events). If this character travel is aborted for any reason, e.g. death due to an event, all prisoners escape.

Unlike rulers that travel to their own realm capital, imprisoned rulers traveling to their jailor's capital are assigned a "prison guard" travel leader, can't add travel options, and other characters may not join their entourages. They also don't get any vanilla travel events, but may still be affected by the travel danger events mentioned above if they happen to the character who escorts them.

Traveling prisoners are moved to a special prison type and can't be interacted with (ransomed, executed, etc.). This can be disabled via the **Interactions for Traveling Prisoners** game rule. They may try to escape while traveling via a special **Escape from Prison** event by winning a prowess, diplomacy, or intrigue challenge against their guard, although their chances of success are rather low and most would not even try it. They may also get freed if their escorting character moves to a location containing a hostile army and fails a martial challenge against the army commander. As a player, you can try to free prisoners captured by an enemy by putting one of your armies on their path.

### Invite Characters to Court Interaction

To make it easier for players to find targets for the **Invite to Court** interaction, this mod adds an **Invite Characters to Court** convenience interaction that lists all characters that would accept such an invitation. This interaction redirects to **Invite to Court** for the selected target so that players may see their reasons for accepting.

## Performance

The *location tracker* mentioned previously tracks the location of every non-teleporting character. It activates on a regular basis and checks most living characters. This has a negative impact on the overall game performance that might be noticeable on lower-end machines.

By default, the location tracker activates every 5 days, for a reasonable tradeoff between performance and accuracy. You can use the **Location Tracker Interval** game rule to make it either more accurate or faster. This rule allows specifying if the detector should activate every 2, 5, or 10 days. Increasing this interval will result in better performance, but will also increase the chance for using an inaccurate location when determining if a character should travel and from where.

When an inaccurate location is used, the character may teleport instead of traveling, or travel when they shouldn't. However, the chance for this is quite small for all settings. For the fastest setting, it amounts to less than 1% inaccurate travel cases out of all travel caused by this mod. Since the player sees only a small percentage of all this travel, the chance that they ever notice such inaccuracies is really small.

The following table contains the times in seconds for 1, 2, 5, and 10 game years and different settings, measured on my own computer with CK3 1.11.3 and the Travelers 0.5.0, on max speed, in observer mode, and using the 867 game start:

| Setup | Interval | 1y (s) | 2y (s) | 5y (s) | 10y (s) | Impact (%) | Inacc. Chance (%) |
|---|---:|---:|---:|---:|---:|---:|---:|
| Vanilla | - | 10 | 21 | 54 | 116 | - | - |
| Travelers |  2d | 13 | 27 | 71 | 157 | 35% | < 0.25% |
| Travelers |  5d | 12 | 23 | 62 | 136 | 17% | < 0.50% |
| Travelers | 10d | 10 | 22 | 59 | 129 | 11% | < 1.00% |

As you can see, the slowest setup is 35% slower than vanilla, the fastest is 11% slower, and the default one is 17% slower.

As a recommendation, if you don't notice any performance issues, just leave the default settings. Otherwise, you may try increasing the **Location Tracker Interval** to 10 days.

**Note**: In previous versions of this mod, it also allowed enabling or disabling the `on_teleport` and `on_invalid_location` on_actions via the **Location Tracker Events** game rule. They are now disabled by default and cannot be enabled, due to their negative performance impact. As a result, no travel takes place when characters teleport without any of the vanilla on_actions firing, or when they are stuck in non-default locations. These cases are however quite rare and to some extent handled by different mechanisms, see [Handling Teleports and Invalid Locations](#handling-teleports-and-invalid-locations).

The **Invite Characters to Court** interaction might also become slow if the number of characters that would accept **Invite to Court** is large enough (hundreds). To avoid this, you can use the **Invite Characters to Court Range** game rule to reduce the range this interaction uses to look for characters.

## Links

* [Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3082182371)
* [Travelers AGOT Compatibility](https://steamcommunity.com/sharedfiles/filedetails/?id=3166199552)
* [Travelers and Prisoners of War Compatch (by @cuomo860)](https://steamcommunity.com/sharedfiles/filedetails/?id=3098184700)
* [Chinese Translation (by @牛奶大魔王)](https://steamcommunity.com/sharedfiles/filedetails/?id=2903983628)
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
