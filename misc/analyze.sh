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
echo "Aborting travel before starting: $(grep -a "Aborting travel before starting" debug.log | uniq | wc -l)"
echo "Aborting travel: $(grep -a "Aborting travel [(f]" debug.log | uniq | wc -l)"
echo "- PoW character: $(grep -a "Aborting travel for PoW character" debug.log | uniq | wc -l)"
echo "Restoring location: $(grep -a "Restoring location" debug.log | uniq | wc -l)"
echo "- PoW character: $(grep -a "Restoring location for PoW character" debug.log | uniq | wc -l)"
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

# Rare (debug)
#echo "Restoring incorrect location: $(grep -a "Restoring incorrect location" debug.log | uniq | wc -l)"
#echo "Character teleported: $(grep -a "Character teleported" debug.log | uniq | wc -l)"
#echo "Invalid character location detected: $(grep -a "Invalid character location detected" debug.log | uniq | wc -l)"
#echo

# Errors
echo "Starting travel to non-default location: $(grep -a "Starting travel to non-default location" error.log | wc -l)"
echo "Removing travel plan: $(grep -a "Removing travel plan from the character .* owner when the travel plan is not ending normally" error.log | wc -l)"
echo

# PoW
echo "PoW_on_army_enter_province_debug: $(grep -a "PoW_on_army_enter_province_debug" debug.log | wc -l)"
echo "on_commander_travel_to_army: $(grep -a "on_commander_travel_to_army" debug.log | wc -l)"
echo "on_travel_plan_movement_debug: $(grep -a "on_travel_plan_movement_debug" debug.log | wc -l)"
echo "on_travel_plan_movement_prisoner_transit: $(grep -a "on_travel_plan_movement_prisoner_transit" debug.log | wc -l)"
echo "on_travel_plan_complete_prisoner_transit: $(grep -a "on_travel_plan_complete_prisoner_transit" debug.log | wc -l)"
echo "dbg_log prisoner_of_war_capture_effect: $(grep -a "dbg_log prisoner_of_war_capture_effect" debug.log | wc -l)"
echo "PoW_on_imprison: $(grep -a "PoW_on_imprison$" debug.log | wc -l)"
echo "PoW_on_release_from_prison: $(grep -a "PoW_on_release_from_prison$" debug.log | wc -l)"
echo "PoW_delivery: $(grep -a "PoW_delivery$" debug.log | wc -l)"
echo "PoW_delivery not prisoner: $(grep -a "PoW_delivery not prisoner" debug.log | wc -l)"
echo "PoW_prisoner_transfer_to_army: $(grep -a "PoW_prisoner_transfer_to_army" debug.log | wc -l)"
echo "PoW_commander_story: $(grep -a "PoW_commander_story$" debug.log | wc -l)"
echo "PoW_commander_story_update: $(grep -a "PoW_commander_story_update" debug.log | wc -l)"
echo "PoW_commander_story on_setup: $(grep -a "PoW_commander_story on_setup" debug.log | wc -l)"
echo "PoW_commander_story on_end: $(grep -a "PoW_commander_story on_end" debug.log | wc -l)"
echo "PoW_commander_story on_owner_death: $(grep -a "PoW_commander_story on_owner_death" debug.log | wc -l)"
echo "PoW_commander_story triggered_effect Wrong Army: $(grep -a "PoW_commander_story triggered_effect Wrong Army [^O|L]" debug.log | wc -l)"
echo "PoW_commander_story triggered_effect Wrong Army Owner: $(grep -a "PoW_commander_story triggered_effect Wrong Army Owner" debug.log | wc -l)"
echo "PoW_commander_story triggered_effect Wrong Army Location: $(grep -a "PoW_commander_story triggered_effect Wrong Army Location" debug.log | wc -l)"
echo "PoW_commander_story triggered_effect Wrong Commander Location: $(grep -a "PoW_commander_story triggered_effect Wrong Commander Location" debug.log | wc -l)"
echo "PoW_commander_story triggered_effect Not leading army Commander: $(grep -a "PoW_commander_story triggered_effect Not leading army Commander" debug.log | wc -l)"
