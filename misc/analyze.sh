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
echo

# Rare (actions)
echo "Aborting travel before starting: $(grep -a "Aborting travel before starting" debug.log | uniq | wc -l)"
echo "Aborting travel: $(grep -a "Aborting travel (" debug.log | uniq | wc -l)"
echo "Restoring location: $(grep -a "Restoring location" debug.log | uniq | wc -l)"
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

# Rare (debug)
echo "Restoring incorrect location: $(grep -a "Restoring incorrect location" debug.log | uniq | wc -l)"
echo "Character teleported: $(grep -a "Character teleported" debug.log | uniq | wc -l)"
echo "Invalid character location detected: $(grep -a "Invalid character location detected" debug.log | uniq | wc -l)"
echo

# Errors
echo "Starting travel to non-default location: $(grep -a "Starting travel to non-default location" error.log | wc -l)"
echo "Removing travel plan: $(grep -a "Removing travel plan from the character .* owner when the travel plan is not ending normally" error.log | wc -l)"
echo
