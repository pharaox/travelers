#!/usr/bin/env bash

LOGFILE=debug.log

# Departures and arrivals
echo "Departed as leader: $(grep -a "Character departed for .*'s court as leader" $LOGFILE | uniq | wc -l)"
echo "Departed as companion: $(grep -a "Character departed for .*'s court as companion of" $LOGFILE | uniq | wc -l)"
echo "Departed as entourage: $(grep -a "Character departed for .*'s court as entourage of" $LOGFILE | uniq | wc -l)"
echo "- No event: $(grep -a "Character departed for .*'s court as entourage of .* (-)" $LOGFILE | uniq | wc -l)"
echo "Arrived as leader: $(grep -a "Character arrived at .*'s court as leader" $LOGFILE | uniq | wc -l)"
echo "Arrived as companion: $(grep -a "Character arrived at .*'s court as companion of" $LOGFILE | uniq | wc -l)"
echo "Arrived as entourage: $(grep -a "Character arrived at .*'s court as entourage of" $LOGFILE | uniq | wc -l)"
echo

# Events
echo "on_join_court: $(grep -a "on_join_court" $LOGFILE | uniq | wc -l)"
echo "- on_marriage: $(grep -a "(on_marriage)" $LOGFILE | uniq | wc -l)"
echo "- on_concubinage: $(grep -a "(on_concubinage)" $LOGFILE | uniq | wc -l)"
echo "- on_delayed_join_court: $(grep -a "(on_delayed_join_court)" $LOGFILE | uniq | wc -l)"
echo "on_leave_court: $(grep -a "on_leave_court" $LOGFILE | uniq | wc -l)"
echo "on_imprison: $(grep -a "on_imprison" $LOGFILE | uniq | wc -l)"
echo "on_release_from_prison: $(grep -a "on_release_from_prison" $LOGFILE | uniq | wc -l)"
echo "on_title_gain: $(grep -a "on_title_gain" $LOGFILE | uniq | wc -l)"
echo "on_title_lost: $(grep -a "on_title_lost" $LOGFILE | uniq | wc -l)"
echo "on_realm_capital_change: $(grep -a "on_realm_capital_change" $LOGFILE | uniq | wc -l)"
echo "on_guest_arrived: $(grep -a "on_guest_arrived" $LOGFILE | uniq | wc -l)"
echo "on_guest_moved: $(grep -a "on_guest_moved" $LOGFILE | uniq | wc -l)"
echo "on_yearly_pulse: $(grep -a "on_yearly_pulse" $LOGFILE | uniq | wc -l)"
echo "on_invalid_receiver: $(grep -a "on_invalid_receiver" $LOGFILE | uniq | wc -l)"
echo "on_invalid_destination: $(grep -a "on_invalid_destination" $LOGFILE | uniq | wc -l)"
echo "on_liege_event: $(grep -a "on_liege_event" $LOGFILE | uniq | wc -l)"
echo "on_courtier_event: $(grep -a "on_courtier_event" $LOGFILE | uniq | wc -l)"
echo "on_teleport: $(grep -a "on_teleport" $LOGFILE | uniq | wc -l)"
echo "on_invalid_location: $(grep -a "on_invalid_location" $LOGFILE | uniq | wc -l)"
echo "escort: $(grep -a "(escort)" $LOGFILE | uniq | wc -l)"
echo "travel_event: $(grep -a "(travel_event)" $LOGFILE | uniq | wc -l)"
echo

# Rare (actions)
echo "Aborting travel to start travel: $(grep -a "Aborting travel to start travel" $LOGFILE | uniq | wc -l)"
echo "- imprisoned: $(grep -a "Aborting travel to start travel, imprisoned" $LOGFILE | uniq | wc -l)"
echo "Aborting travel completely: $(grep -a "Aborting travel completely" $LOGFILE | uniq | wc -l)"
echo "- imprisoned: $(grep -a "Aborting travel completely, imprisoned" $LOGFILE | uniq | wc -l)"
echo "Restoring location: $(grep -a "Restoring location" $LOGFILE | uniq | wc -l)"
echo "Changing travel leader: $(grep -a "Changing travel leader" $LOGFILE | uniq | wc -l)"
echo "Removing travel companion: $(grep -a "Removing travel companion" $LOGFILE | uniq | wc -l)"
echo "Freeing prisoner: $(grep -a "Freeing prisoner" $LOGFILE | uniq | wc -l)"
echo "Creating prison guard character: $(grep -a "Creating prison guard character" $LOGFILE | uniq | wc -l)"
echo

# Rare (events)
echo "Travel plan aborted: $(grep -a "Travel plan to .*'s court aborted" $LOGFILE | wc -l)"
echo "- imprisoned: $(grep -a "Travel plan to .*'s court aborted, imprisoned" $LOGFILE | uniq | wc -l)"
echo "Aborting travel for prison guard: $(grep -a "Aborting travel for prison guard" $LOGFILE | uniq | wc -l)"
echo

# Pulse events
echo "Pulse event fired: $(grep -a "Pulse event fired" $LOGFILE | wc -l)"
echo

# Danger events
echo "Danger: Bandits event fired: $(grep -a "Danger: Bandits event fired" $LOGFILE | wc -l)"
echo "Danger: Missing Companion event fired: $(grep -a "Danger: Missing Companion event fired" $LOGFILE | wc -l)"
echo "Danger: Lost event fired: $(grep -a "Danger: Lost event fired" $LOGFILE | wc -l)"
echo "Danger: Out of Water event fired: $(grep -a "Danger: Out of Water event fired" $LOGFILE | wc -l)"
echo "Danger: Aftermath event fired: $(grep -a "Danger: Aftermath.* event fired" $LOGFILE | wc -l)"
echo "Danger: Sea Storm event fired: $(grep -a "Danger: Sea Storm event fired" $LOGFILE | wc -l)"
echo "Danger: Avalanche event fired: $(grep -a "Danger: Avalanche event fired" $LOGFILE | wc -l)"
echo "Danger: Snowbound event fired: $(grep -a "Danger: Snowbound event fired" $LOGFILE | wc -l)"
echo "Danger: Ripped Sails event fired: $(grep -a "Danger: Ripped Sails event fired" $LOGFILE | wc -l)"
echo "Danger: Brush Fire event fired: $(grep -a "Danger: Brush Fire event fired" $LOGFILE | wc -l)"
echo "Danger: Mosquitoes event fired: $(grep -a "Danger: Mosquitoes event fired" $LOGFILE | wc -l)"
echo "Danger: Beast Attack event fired: $(grep -a "Danger: Beast Attack event fired" $LOGFILE | wc -l)"
echo "Danger: Spoiled Food event fired: $(grep -a "Danger: Spoiled Food event fired" $LOGFILE | wc -l)"
echo "Danger: Sickness event fired: $(grep -a "Danger: Sickness event fired" $LOGFILE | wc -l)"
echo "Total danger events: $(grep -a "Danger: .* event option" $LOGFILE | wc -l)"
echo "- for prison guard: $(grep -a "Danger: .* event fired for prison guard" $LOGFILE | wc -l)"
echo "Character died: $(grep -a "Character died, " $LOGFILE | wc -l)"
echo "Character died while traveling: $(grep -a "Character died while traveling, " $LOGFILE | wc -l)"
echo "- ruler: $(grep -a ".* of .*Character died while traveling" $LOGFILE | wc -l)"
echo

# Rare (debug)
#echo "Character teleported: $(grep -a "Character teleported" $LOGFILE | uniq | wc -l)"
#echo "Invalid character location detected: $(grep -a "Invalid character location detected" $LOGFILE | uniq | wc -l)"
#echo
#echo "Accessing recent location: $(grep -a "Accessing recent location" $LOGFILE | wc -l)"
#echo

# Errors
echo "Starting travel to non-default location: $(grep -a "Starting travel to non-default location" error.log | wc -l)"
echo "Removing travel plan: $(grep -a "Removing travel plan from the character .* owner when the travel plan is not ending normally" error.log | wc -l)"
echo
