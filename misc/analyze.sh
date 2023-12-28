#!/usr/bin/env bash

# Departures and arrivals
echo "Departed as leader: $(grep -a "Character departed for .*'s court as leader" debug.log | uniq | wc -l)"
echo "Departed as companion: $(grep -a "Character departed for .*'s court as companion of" debug.log | uniq | wc -l)"
echo "Departed as entourage: $(grep -a "Character departed for .*'s court as entourage of" debug.log | uniq | wc -l)"
echo "- No event: $(grep -a "Character departed for .*'s court as entourage of .* (-)" debug.log | uniq | wc -l)"
echo "Arrived as leader: $(grep -a "Character arrived at .*'s court as leader" debug.log | uniq | wc -l)"
echo "Arrived as companion: $(grep -a "Character arrived at .*'s court as companion of" debug.log | uniq | wc -l)"
echo "Arrived as entourage: $(grep -a "Character arrived at .*'s court as entourage of" debug.log | uniq | wc -l)"
echo

# Events
echo "on_join_court: $(grep -a "on_join_court" debug.log | uniq | wc -l)"
echo "on_leave_court: $(grep -a "on_leave_court" debug.log | uniq | wc -l)"
echo "on_imprison: $(grep -a "on_imprison" debug.log | uniq | wc -l)"
echo "on_release_from_prison: $(grep -a "on_release_from_prison" debug.log | uniq | wc -l)"
echo "on_title_gain: $(grep -a "on_title_gain" debug.log | uniq | wc -l)"
echo "on_title_lost: $(grep -a "on_title_lost" debug.log | uniq | wc -l)"
echo "on_realm_capital_change: $(grep -a "on_realm_capital_change" debug.log | uniq | wc -l)"
echo "on_invalid_receiver: $(grep -a "on_invalid_receiver" debug.log | uniq | wc -l)"
echo "on_invalid_destination: $(grep -a "on_invalid_destination" debug.log | uniq | wc -l)"
echo "on_liege_event: $(grep -a "on_liege_event" debug.log | uniq | wc -l)"
echo "on_courtier_event: $(grep -a "on_courtier_event" debug.log | uniq | wc -l)"
echo "on_teleport: $(grep -a "on_teleport" debug.log | uniq | wc -l)"
echo "on_invalid_location: $(grep -a "on_invalid_location" debug.log | uniq | wc -l)"
echo "on_marriage: $(grep -a "(on_marriage)" debug.log | uniq | wc -l)"
echo "on_concubinage: $(grep -a "(on_concubinage)" debug.log | uniq | wc -l)"
echo "on_delayed_join_court: $(grep -a "(on_delayed_join_court)" debug.log | uniq | wc -l)"
echo

# Rare (actions)
echo "Aborting travel to start travel: $(grep -a "Aborting travel to start travel" debug.log | uniq | wc -l)"
echo "Aborting vanilla travel to start travel: $(grep -a "Aborting vanilla travel to start travel" debug.log | uniq | wc -l)"
echo "Aborting travel: $(grep -a "Aborting travel [(f]" debug.log | uniq | wc -l)"
echo "- for prison guard: $(grep -a "Aborting travel for prison guard" debug.log | uniq | wc -l)"
echo "- for PoW character: $(grep -a "Aborting travel for PoW character" debug.log | uniq | wc -l)"
echo "Restoring location: $(grep -a "Restoring location" debug.log | uniq | wc -l)"
echo "- for vanilla traveler: $(grep -a "Restoring location for vanilla traveler" debug.log | uniq | wc -l)"
echo "- for PoW traveler: $(grep -a "Restoring location for PoW traveler" debug.log | uniq | wc -l)"
echo "Changing travel leader: $(grep -a "Changing travel leader" debug.log | uniq | wc -l)"
echo "Removing travel companion: $(grep -a "Removing travel companion" debug.log | uniq | wc -l)"
echo

# Rare (events)
echo "Travel plan aborted: $(grep -a "Travel plan to .*'s court aborted" debug.log | wc -l)"
echo "Invalid receiver detected: $(grep -a "Invalid receiver detected" debug.log | wc -l)"
echo "Invalid destination detected: $(grep -a "Invalid destination detected" debug.log | wc -l)"
echo

# Rare (marriage in wrong location)
echo "Character married as major partner: $(grep -a "Character married as major partner" debug.log | wc -l)"
echo "Character married as minor partner: $(grep -a "Character married as minor partner" debug.log | wc -l)"
echo "Character divorced: $(grep -a "Character divorced" debug.log | wc -l)"
echo "Character was divorced: $(grep -a "Character was divorced" debug.log | wc -l)"
echo "Character took concubine: $(grep -a "Character took concubine" debug.log | wc -l)"
echo "Character was taken as concubine: $(grep -a "Character was taken as concubine" debug.log | wc -l)"
echo "Character released concubine: $(grep -a "Character released concubine" debug.log | wc -l)"
echo "Character was released as concubine: $(grep -a "Character was released as concubine" debug.log | wc -l)"
echo

# Pulse events
echo "Pulse event fired: $(grep -a "Pulse event fired" debug.log | wc -l)"
echo

# Danger events
echo "Danger: Bandits event fired: $(grep -a "Danger: Bandits event" debug.log | wc -l)"
echo "Danger: Missing Companion event fired: $(grep -a "Danger: Missing Companion event" debug.log | wc -l)"
echo "Danger: Lost event fired: $(grep -a "Danger: Lost event" debug.log | wc -l)"
echo "Danger: Out of Water event fired: $(grep -a "Danger: Out of Water event" debug.log | wc -l)"
echo "Danger: Aftermath event fired: $(grep -a "Danger: Aftermath.* event" debug.log | wc -l)"
echo "Danger: Sea Storm event fired: $(grep -a "Danger: Sea Storm event" debug.log | wc -l)"
echo "Danger: Avalanche event fired: $(grep -a "Danger: Avalanche event" debug.log | wc -l)"
echo "Danger: Snowbound event fired: $(grep -a "Danger: Snowbound event" debug.log | wc -l)"
echo "Danger: Ripped Sails event fired: $(grep -a "Danger: Ripped Sails event" debug.log | wc -l)"
echo "Danger: Brush Fire event fired: $(grep -a "Danger: Brush Fire event" debug.log | wc -l)"
echo "Danger: Mosquitoes event fired: $(grep -a "Danger: Mosquitoes event" debug.log | wc -l)"
echo "Danger: Beast Attack event fired: $(grep -a "Danger: Beast Attack event" debug.log | wc -l)"
echo "Danger: Spoiled Food event fired: $(grep -a "Danger: Spoiled Food event" debug.log | wc -l)"
echo "Danger: Sickness event fired: $(grep -a "Danger: Sickness event" debug.log | wc -l)"
echo "Total danger events: $(grep -a "Danger: .* event" debug.log | wc -l)"
echo "Character died: $(grep -a "Character died" debug.log | wc -l)"
echo

# Rare (debug)
#echo "Restoring incorrect location: $(grep -a "Restoring incorrect location" debug.log | uniq | wc -l)"
#echo "Character teleported: $(grep -a "Character teleported" debug.log | uniq | wc -l)"
#echo "Invalid character location detected: $(grep -a "Invalid character location detected" debug.log | uniq | wc -l)"
#echo

# Errors
echo "Starting travel to non-default location: $(grep -a "Starting travel to non-default location" error.log | wc -l)"
echo "Removing travel plan: $(grep -a "Removing travel plan from the character .* owner when the travel plan is not ending normally" error.log | wc -l)"
echo
